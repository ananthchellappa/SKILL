/*************************************************************************
* DISCLAIMER: The following code is provided for Cadence customers       *
* to use at their own risk. The code may require modification to         *
* satisfy the requirements of any user. The code and any modifications   *
* to the code may not be compatible with current or future versions of   *
* Cadence products. THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, *
* INCLUDING WITHOUT LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED         *
* WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.         *
*************************************************************************/


;Global SKILL var to control whether only Monte Carlo ADE XL history is shown in the drop-down list 
;Define this var in order to write the statistical parameter data for other run modes such as 'Single Run...' over statistical corners.  (LJNaxlWriteMonteCarloToCSV_ShowAllHistory = 'unbound to revert change) 
;LJNaxlWriteMonteCarloToCSV_ShowAllHistory = 1

(defun LJNaxlWriteMonteCarloToCSV (sdbh histName @key (decoupleProcessMismatch t))
    
    (let (rdb checkPoint statPat dutSummary saveProcess saveMismatch enabledTests DUTtable
            runMode outh corners fileName firstparam debug timestart timeend runOptions
            globalsTable gparam mparam mparamval statGlobalPat statMismatchPat
            filterStatsArg outputs)

        (unless histName=="<Monte Carlo result history does not exist>"
            debug = t
            (when debug
                ;(printf "%s\n" getCurrentTime())
                timestart = getCurrentTime()
            )

            checkPoint = (axlGetHistoryCheckpoint (axlGetHistoryEntry sdbh histName))
            runMode = (axlGetCurrentRunMode checkPoint)
            (printf "History %s\n" histName)
            ;(printf "runMode = %s\n" runMode)

            rdb=(axlReadHistoryResDB histName)
            runOptions = (axlGetRunOptions checkPoint runMode )
            enabledTests = (LJNaxlGetEnabledTests checkPoint)

            (if runMode == "Monte Carlo Sampling" then

                ;(printf "runOptions = %L\n" runOptions)
                
                (when (axlGetRunOption checkPoint runMode "saveprocess")!=0
                    saveProcess = (axlGetRunOptionValue (axlGetRunOption checkPoint runMode "saveprocess"))
                    ;(printf "saveProcess= %L\n" saveProcess)
                    (when saveProcess == "0"
                        (printf "WARNING: Process data was not saved.  The process data will not be included in the report.\n" )
                    )
                )

                (when (axlGetRunOption checkPoint runMode "savemismatch")!=0
                    saveMismatch = (axlGetRunOptionValue (axlGetRunOption checkPoint runMode "savemismatch"))
                    ;(printf "saveMismatch = %L\n" saveMismatch)
                    (when saveMismatch == "0"
                        (printf "WARNING: Mismatch data was not saved.  The mismatch data will not be included in the report.\n" )
                    )
                )

                (when (axlGetRunOption checkPoint runMode "dutsummary")!=0 
                    dutSummary = (axlGetRunOptionValue (axlGetRunOption checkPoint runMode "dutsummary"))
                    ;(printf "DUT summary = %A\n" dutSummary)
                    (if dutSummary != "" then 
                        DUTtable = (LJNaxlGetMCDUTInfo dutSummary enabledTests)
                        (printf "DUT Summary:\n")
                        (foreach test DUTtable
                            (printf "\t%s\t%L\n" test DUTtable[test])
                        )
                    else
                        (printf "WARNING: DUT is not defined.\n")
                    )
                )
            )
                    
            (printf "Generating report for checkpoint %s\n" histName)

            statPat=(pcreCompile "statistical:")

            (foreach testName enabledTests
                (printf "\nTest = %s\n" testName)
                corners = (setof x (nthelem 1 rdb->points())->tests() (equal x->name testName))~>cornerName
                (foreach corner corners
                    fileName = (strcat "./" histName "_" testName "_" corner ".csv")
                    (printf "Writing %s\n" fileName)
                    outh = (outfile fileName) 
                    (printf "\tCorner = %s\n" corner)

                    (if decoupleProcessMismatch then
                        ;Decouple process and mismatch parameters with the same name 
                        ;This only matters when a mismatch parameter shares the same name as a process parameter

                        statGlobalPat=(pcreCompile "statistical:global:(\\S*)")
                        statMismatchPat=(pcreCompile "statistical:mismatch:(\\S*):(\\S*)")
                        (foreach p (setof x rdb->tests() (and (equal x->name testName) (equal x->cornerName corner)))

                            ;Create a table of the global parameter values to check if mismatch parameters exist with same name
                            ;  If so, decouple the global and mismatch values by subtracting the global value from the mismatch value
                            globalsTable = makeTable("globalsTable")

                            ;write header
                            (when p->pointID == 1
                                firstparam = t

                                filterStatsArg = (LJNaxlRDBAPIfilterStats p) 
                                (if filterStatsArg then
                                    outputs = p->outputs(?sortBy 'name ?filterStats nil)
                                else
                                    outputs = p->outputs(?sortBy 'name )
                                )

                                (foreach output outputs
                                    (when (or (equal output->type 'expr) (pcreExecute statPat output->name))
                                        (if firstparam then
                                            (fprintf outh "\"%s\"" output->name)
                                        else
                                            (fprintf outh ",\"%s\"" output->name)
                                        )
                                        firstparam = nil
                                    )
                                )
                            )

                            ;write values 
                            (fprintf outh "\n") 
                            firstparam = t
                            (if filterStatsArg then
                                outputs = p->outputs(?sortBy 'name ?filterStats nil)
                            else
                                outputs = p->outputs(?sortBy 'name )
                            )
                            (foreach output outputs ;sort create global table before mismatch
                                (cond 
                                    ((equal output->type 'expr)
                                        (if firstparam then
                                            (fprintf outh "%L" output->value)
                                        else
                                            (fprintf outh ",%L" output->value)
                                        )
                                        firstparam = nil
                                    )
                                    ((pcreExecute statGlobalPat output->name)
                                        gparam = (pcreSubstitute statGlobalPat "\\1")
                                        globalsTable[gparam] = output->value
                                        (if firstparam then
                                            (fprintf outh "%L" output->value)
                                        else
                                            (fprintf outh ",%L" output->value)
                                        )
                                        firstparam = nil
                                    )
                                    ((pcreExecute statMismatchPat output->name)
                                        mparam = (pcreSubstitute statMismatchPat "\\2")

                                        (if (exists mparam globalsTable stringp(mparam) && fixp(globalsTable[mparam])) then
                                            mparamval = output->value - globalsTable[mparam]
                                        else 
                                            mparamval = output->value
                                        )
                                        (if firstparam then
                                                (fprintf outh "%L" mparamval)
                                        else
                                                (fprintf outh ",%L" mparamval)
                                        )
                                        firstparam = nil
                                    )
                                )
                            )
                        );foreach point (decouple process and mismatch parameters with same name)

                    else
                        ;Don't decouple process and mismatch parameters with the same name 
                        ;This only matters when a mismatch parameter shares the same name as a process parameter
                        (foreach p (setof x rdb->tests() (and (equal x->name testName) (equal x->cornerName corner)))

                            ;write header
                            (when p->pointID == 1
                                firstparam = t

                                filterStatsArg = (LJNaxlRDBAPIfilterStats p) 
                                (if filterStatsArg then
                                    outputs = p->outputs(?sortBy 'name ?filterStats nil)
                                else
                                    outputs = p->outputs(?sortBy 'name )
                                )

                                (foreach output outputs
                                    (when (or (equal output->type 'expr) (pcreExecute statPat output->name))
                                        (if firstparam then
                                            (fprintf outh "\"%s\"" output->name)
                                        else
                                            (fprintf outh ",\"%s\"" output->name)
                                        )
                                        firstparam = nil
                                    )
                                )
                            )

                            ;write values 
                            (fprintf outh "\n") 
                            firstparam = t
                            (if filterStatsArg then
                                outputs = p->outputs(?sortBy 'name ?filterStats nil)
                            else
                                outputs = p->outputs(?sortBy 'name )
                            )
                            (foreach output outputs
                                (when (or (equal output->type 'expr) (pcreExecute statPat output->name))
                                    (if firstparam then
                                        (fprintf outh "%L" output->value)
                                    else
                                        (fprintf outh ",%L" output->value)
                                    )
                                    firstparam = nil
                                )
                            )
                        );foreach point
                    )
                (close outh)
                )
            )
            rdb->close()
            (printf "done\n")
            (when debug
                ;(printf "%s\n" getCurrentTime())
                timeend = getCurrentTime()
                (printf "TAT = %d seconds\n" (compareTime timeend,timestart))
            )
            1
        );unless MC history exists
    );let
)

(defun LJNaxlGetMCDUTInfo (dutSummary enabledTests)
    (let (dutbytest DUTtable testNames testName dutlist)
        dutbytest = (parseString dutSummary "#")
        testNames = '()
        DUTtable = (makeTable "DUTtable")
        (foreach duttest dutbytest
            testName = (car (parseString duttest "%"))
            ;dutSummary contains information on all tests
            ;Filter out disabled tests
            (when (setof test enabledTests (test == testName))
                testNames = (cons testName testNames) 
                dutlist = (parseString (cadr (parseString duttest "%")) ",")
                DUTtable[testName] = dutlist
            )
        )
    DUTtable
    )
)

;GUI

(defun LJNaxlWriteMonteCarloCSVfromGUI () 
    (let (sdbh histNames histName )
        sdbh = (LJNaxlGetCurrentWindowSetupDB) 

        (case LJNaxlWriteMonteCarloCSVForm->historyComboField->value 
             ;I did not add the ALL option to the list yet 
             ("ALL"
                histNames = (LJNaxlGetCurrentWindowHistoryNames) 
                (foreach hist histNames 
                    (LJNaxlWriteMonteCarloToCSV sdbh hist ?decoupleProcessMismatch t) 
                ))
             (t
                histName = LJNaxlWriteMonteCarloCSVForm->historyComboField->value 
                (LJNaxlWriteMonteCarloToCSV sdbh histName ?decoupleProcessMismatch t) 
             )
        )
    )
)

(defun LJNaxlWriteMonteCarloCSVForm ()
    (let (historyComboField )
    
        historyComboField = hiCreateComboField(
            ?name   'historyComboField
            ?prompt "History"
            ?items  (list "")   
            ?editable nil 
            ?value ""
            )

        hiCreateAppForm( ?name 'LJNaxlWriteMonteCarloCSVForm
            ?formTitle "Write Monte Carlo Data to CSV"
            ?callback "LJNaxlWriteMonteCarloCSVfromGUI()"
            ?fields list( historyComboField )
        )

        (LJNaxlWriteMonteCarloCSVInitCombobox)

        hiDisplayForm( LJNaxlWriteMonteCarloCSVForm)
    )
)


(defun LJNaxlWriteMonteCarloCSVInitCombobox ()
    (let (histNames)
        histNames = (LJNaxlGetCurrentWindowMonteCarloHistoryNames) 
        (when (length histNames)==0
            histNames = list("<Monte Carlo result history does not exist>") 
        )   
        ;LJNaxlWriteMonteCarloCSVForm->historyComboField->items = (append '("ALL") histNames)
        LJNaxlWriteMonteCarloCSVForm->historyComboField->items = histNames
        LJNaxlWriteMonteCarloCSVForm->historyComboField->value = (car LJNaxlWriteMonteCarloCSVForm->historyComboField->items)
        ;LJNaxlWriteMonteCarloCSVForm->historyComboField->value = "ALL"
    )
)

(defun LJNaxlDisplayWriteMonteCarloCSVForm ()
    (if (or (not (boundp 'LJNaxlWriteMonteCarloCSVForm)) 'LJNaxlWriteMonteCarloCSVForm == nil) then
        (LJNaxlWriteMonteCarloCSVForm) 
    else
        (LJNaxlWriteMonteCarloCSVInitCombobox )
        (hiDisplayForm LJNaxlWriteMonteCarloCSVForm)
    )
) 

;Tools menu item
(defun LJNaxlCreateWriteMonteCarloCSVMenu (window)
    (let (myMenuItem bannerMenus menu)

        myMenuItem = hiCreateMenuItem( 
                                 ?name 'LJNWriteMonteCarloCSVMenu
                                 ?itemText "Write Monte Carlo Data to CSV..."
                                 ?callback "LJNaxlDisplayWriteMonteCarloCSVForm()"
                                 )
        bannerMenus=(hiGetBannerMenus window)
        menu=(car (setof i bannerMenus (pcreMatchp "axlToolsMenu.*" (sprintf nil "%L" i))))
        (hiInsertMenuItem (symeval menu) myMenuItem 0 )
    )
)

(defun LJNaxlCreateWriteMonteCarloCSVMenuPostInstallTrigger (args)
    (LJNaxlCreateWriteMonteCarloCSVMenu args->window)
)

deRegUserTriggers(  "adexl" nil nil 'LJNaxlCreateWriteMonteCarloCSVMenuPostInstallTrigger )


;Utility

(defun LJNaxlRDBAPIfilterStats (point)
    ;Return t if the RDB API version filters statistical parameters by default (provides the options ?filterStats arg) 
    ;By default in IC6.1.6 ISR3+
    ;Pass an RDB point to the function

    (let (args (filterStats nil))
        args = (arglist point->outputs)
        (foreach arg args
            (when (listp arg)
                (when (member 'filterStats arg)
                    filterStats = t
                )
            )
        )
        filterStats
    )
)
    
(defun LJNaxlGetCurrentWindowMonteCarloHistoryNames ()
    (let (sdbh histNames MChistNames checkPoint)
        sdbh = (LJNaxlGetCurrentWindowSetupDB)
        histNames = (cadr (axlGetHistory sdbh))
        MChistNames = list()
        (foreach histName histNames
            (when (and ((axlGetHistoryGroup sdbh histName)==0) (axlGetHistoryCheckpoint (axlGetHistoryEntry sdbh histName)))
                checkPoint = (axlGetHistoryCheckpoint (axlGetHistoryEntry sdbh histName))
                (if (boundp 'LJNaxlWriteMonteCarloToCSV_ShowAllHistory) then
                    ;add all history items to drop-down list
                    MChistNames = (cons histName MChistNames)
                else
                    ;only add MC history items to drop-down list
                    (when (axlGetCurrentRunMode checkPoint) == "Monte Carlo Sampling"
                        MChistNames = (cons histName MChistNames)
                    )
                )
            )
        )
    MChistNames
    )
)

(defun LJNaxlGetCurrentWindowHistoryNames ()
    (let ()
        ;history names
        (cadr (axlGetHistory (LJNaxlGetCurrentWindowSetupDB)))
    )
)

(defun LJNaxlGetCurrentWindowSessionAndSetupDB ()
    (let (sess sdbh ret)
        sess = (LJNaxlGetCurrentWindowSession)
        sdbh = (axlGetMainSetupDB sess)
        (unless sdbh 
            (error "Cannot find ADE XL setupDB handle.\n")
        )
        ret=(ncons nil)
        ret->sess=sess
        ret->sdbh=sdbh
        ret
    )
)

(defun LJNaxlGetCurrentWindowSetupDB ()
    (let (sess sdbh)
        sess = (LJNaxlGetCurrentWindowSession)
        sdbh = (axlGetMainSetupDB sess)
        (unless sdbh 
            (error "Cannot find ADE XL setupDB handle.\n")
        )
    sdbh
    )
)

(defun LJNaxlGetCurrentWindowSession ()
    (let (sess)
        sess = (axlGetWindowSession (hiGetCurrentWindow))
        (unless sess 
            (error "Cannot find ADE XL session from current window. Select the ADE XL window to set the current window.\n")
        )
    sess
    )
)

;Return a list of enabled Tests (names)
(defun LJNaxlGetEnabledTests (sdb)
    (let (testNames enabledTests)
        testNames = (cadr (axlGetTests sdb))
        enabledTests = '()
        (foreach test testNames
            (when (axlGetEnabled (axlGetTest sdb test))
                enabledTests = (cons test enabledTests)
            )
        )
    enabledTests
    )
)
