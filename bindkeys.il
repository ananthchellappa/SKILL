toggler=0
sch_grid_togl=0
tb_toggle=0
load_all_bindkeys=t ; if you are someone else, then change this :)
simCellTbl = makeTable( "" nil )

load("~/SKILL/utils/toglInstObjFil.il") ; CTRL-P toggles selection filter
load("~/SKILL/CCS/CCSToggleSelectMode.il") ; CTRL-M toggles selection mode
load("~/SKILL/CCS/CCSsuppressDispForm.il")
load("~/SKILL/utils/killPinAnnotate.il") ; CTRL-6 removes terminal net names
;load("~/SKILL/utils/toolbarToggle.il") ; 7/12/18
load("~/SKILL/CCS/LSW.il") ; Provides functions to save/load LSW settings
load("~/SKILL/utils/sch_grid_togl.il") ; CTRL-F10 toggles schematic grid
load("~/SKILL/CCS/CCSchangeWireWidth.il") ; Provides function to change wire width (used by ALT-ScrollWheel)
load("~/SKILL/CCS/CCSExportOutputs.il")
load("~/SKILL/utils/vivaGridToggle.il") ; CTRL-G toggles grid in ViVa graph window
load("~/SKILL/CCS/CCSrectSelect.il") ; ALT-Z enables rectangular selection mode
load("~/SKILL/CCS/CCSOffCdsTermNetNames.il") ; F10 toggles display of terminal net names
load("~/SKILL/CCS/CCSSnapToGrid.il") ; ALT-G snaps objects to grid
; load("~/SKILL/CCS/CSComposerGridSnap.il")
load("~/SKILL/utils/hiSelectSymPins.il") ; CTRL-P toggles pin selection mode
load("~/SKILL/utils/updatePinLabels.il") ; CTRL-Up/Down changes selected pin label size
load("~/SKILL/utils/MYappendSignal.il") ; CTRL-4 enters select outputs to plot mode
load("~/SKILL/utils/MYappendAllSignal.il")
load("~/SKILL/utils/updateSnapSpacing.il") ; ALT-Up/Down doubles/halves grid snap spacing
load("~/SKILL/utils/CCSDescend.il")
; 6/27/18
load("~/SKILL/utils/newDescend.il")
load("~/SKILL/utils/CCSkey.il")
load("~/SKILL/utils/CCSrestoreDefaultWireColors.il") ; ALT-R restores default wire colors
load("~/SKILL/utils/awvGrid.il")
load("~/SKILL/utils/applify.il")
; load("~/SKILL/utils/sch_print_L.il")
load("~/SKILL/utils/MYappendDCSignal.il") ; CTRL-7 launches plot DC signal command
load("~/SKILL/utils/MYdescend.il") ; Provides function for descending into hierarchy (used by 'e' and CTRL-X)
load("~/SKILL/utils/hiReturn.il") ; Provides function to return up in hierarchy (used by CTRL-E)
load("~/SKILL/CCS/CCSMarkerForm.il") ; G finds error/warning markers
; 11/16/16
hiSetBindKey("Schematics" "Ctrl<Key>7" "MYappendDCSignal()") ; Launches plot DC signal command
; 7/19/16
hiSetBindKey("Layout" "Alt <Key>1" "pteSetVisible(\"MET1 drawing\" !pteIsVisible(\"MET1 drawing\" \"Layers\") \"Layers\")" ) ; Toggles visibility of MET1 drawing layer
hiSetBindKey("Layout" "Alt <Key>2" "pteSetVisible(\"MET2 drawing\" !pteIsVisible(\"MET2 drawing\" \"Layers\") \"Layers\")" ) ; Toggles visibility of MET2 drawing layer
hiSetBindKey("Layout" "Alt <Key>3" "pteSetVisible(\"MET3 drawing\" !pteIsVisible(\"MET3 drawing\" \"Layers\") \"Layers\")" ) ; Toggles visibility of MET3 drawing layer
hiSetBindKey("Layout" "Alt <Key>4" "pteSetVisible(\"MET4 drawing\" !pteIsVisible(\"MET4 drawing\" \"Layers\") \"Layers\")" ) ; Toggles visibility of MET4 drawing layer
hiSetBindKey("Layout" "Alt <Key>t" "pteSetVisible(\"TEXT drawing\" !pteIsVisible(\"TEXT drawing\" \"Layers\") \"Layers\")" ) ; Toggles visibility of TEXT drawing layer
hiSetBindKey("Layout" "Alt <Key>0" "pteToggleAllVisible( \"Layers\" hiGetCurrentWindow() )" ) ; Toggles visibility of all Layers
hiSetBindKey("Layout" "Alt <Key>9" "pteToggleAllVisible( \"Objects\" hiGetCurrentWindow() )" ) ; Toggles visibility of all Objects
hiSetBindKey("Layout" "Alt <Key>p" "pteSetVisible(\"POLY drawing\" !pteIsVisible(\"POLY drawing\" \"Layers\") \"Layers\")" ) ; Toggles visibility of POLY drawing layer
;10/17/17
hiSetBindKey("Layout" "Alt <Key>a" "pteSetVisible(\"PACT drawing\" !pteIsVisible(\"PACT drawing\" \"Layers\") \"Layers\")" ) ; Toggles visibility of PACT drawing layer
; 7/15/16 ; upgraded 9/12/18 scroll down ; thanks Parul Sharma
; hiSetBindKey("Schematics" "Ctrl<Key>n" "schHiCreateInst(\"basic\" \"noConn\" \"symbol\")")
; 7/5/16 Likesh Sahoo
load("~/SKILL/CCS/CCSLibManSelectInst.il") ; CTRL-ALT-S locates selected instance in Library Manager
; contains Ctrl Alt<Key>s
; load("~/SKILL/CCS/CheckNetSet.il")
load("~/SKILL/utils/schIncreasePinSpacing.il") ; Provides function to increase pin spacing (used by CTRL-+/-)
; 4/22/2014 atl v chelsea : grid
hiSetBindKey("Schematics" "Ctrl<Key>F10" "sch_grid_togl()") ; Toggles schematic grid
; load("~/SKILL/utils/addVDDVSS.il")
; load("~/SKILL/utils/getVDDVSS.il")
; load("~/SKILL/utils/addVCC.il")
; load("~/SKILL/utils/delVDD.il")
; lastVDD="VDD"
; lastVSS="VSS"
; hiSetBindKey("Schematics" "Ctrl Shift<Key>v" "addVDDVSS()")
; hiSetBindKey("Schematics" "Ctrl Shift<Key>g" "getVDDVSS()")
; hiSetBindKey("Schematics" "Ctrl Shift<Key>s" "setVDDVSS()")
; hiSetBindKey("Schematics" "Ctrl Shift<Key>d" "delVDD()")
; hiSetBindKey("Schematics" "Ctrl Alt<Key>v" "addVCC()")
; hiSetBindKey("Schematics" "Ctrl Alt<Key>g" "getVCC()")
; hiSetBindKey("Schematics" "Ctrl <Key>m" "hiToggleMagnifier()")
; 5/23/16
hiSetBindKey("Schematics" "Shift <Key>w" "schHiCreateWire(schGetEnv(\"defWideWireWidth\"))") ; Creates a wide wire
; 5/21/16
;;;;;hiSetBindKey("vivaGraph" "Ctrl<Key>d" "_vivaDeleteAll()") ; reassigned - since Cadence already gives you 'e' for this
; 5/20/16
hiSetBindKey("Schematics" "Alt <Key>2" "schHiOpenSymbolOrSchematicView(geGetEditCellView() hiGetCurrentWindow())") ; Opens symbol or schematic view
hiSetBindKey("Symbol" "Alt <Key>2" "schHiOpenSymbolOrSchematicView(geGetEditCellView() hiGetCurrentWindow())") ; Opens symbol or schematic view
; 5/17/16
hiSetBindKey("Schematics" "Ctrl <Key>F1" "deToggleAssistants()") ; Toggles Cadence assistants visibility
; 7/12/18 -- didn't know they had put this in
hiSetBindKey("Schematics" "Ctrl <Key>F2" "deToggleToolbars()") ; Toggles toolbars visibility
hiSetBindKey("vivaGraph" "Ctrl<Key>F2" "deToggleToolbars()") ; Toggles toolbars visibility
; also, ViVa actions are not captured to CIW!!
hiSetBindKey("Schematics" "Ctrl<Key>+" "schIncreasePinSpacing(\"+\")") ; Increases pin spacing
hiSetBindKey("Schematics" "Ctrl<Key>-" "schIncreasePinSpacing(\"-\")") ; Decreases pin spacing
hiSetBindKey("Schematics" "Ctrl<Key>KP_Add" "schIncreasePinSpacing(\"+\")") ; Increases pin spacing (keypad)
hiSetBindKey("Schematics" "Ctrl<Key>KP_Subtract" "schIncreasePinSpacing(\"-\")") ; Decreases pin spacing (keypad)
hiSetBindKey("Schematics" "Ctrl<Key>q" "CCSAddCustomOutputs()")
hiSetBindKey("vivaGraph" "Ctrl<Key>g" "vivaGridToggle()") ; Toggles grid in ViVa graph window
hiSetBindKey("vivaGraph" "Alt<Key>e" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"graphPrint\")") ; Launches Print Preview in ViVa
hiSetBindKey("Schematics" "Alt<Key>z" "CCSrectSelect()") ; Enables rectangular selection mode
; hiSetBindKey("Schematics" "Alt<Key>q" "CCSOffCdsTermNetNames()") ; sameer
; using F10.. set by the code itself..
; ; load("~/SKILL/utils/MYdescend.il") 6/22/2011
; rendered obsolte by Vikas Agarwal
; hiSetBindKey("Schematics" "Alt<Key>h" "zoomNet()")
; load("~/SKILL/utils/zoomNet.il")
; one that Dan Pickens brushed off :
; hiSetBindKey("awv" "<Key>d" "awvCrossHairDeleteList(awvGetCurrentWindow() 1 list(\"A\" \"B\"))")
; finally - long overdue - to prevent AWD from trying to update a window I was resizing..
; hiSetBindKey("awv" "Alt<Key>d" "graphicsOff()")
; hiSetBindKey("awv" "Alt<Key>e" "graphicsOn()")
; from Doug W 4/24/13 - how to cycle through fonts on selected set using Shift-scrollUp
hiSetBindKey("Schematics" "Shift<Btn4Down>"
"mapcar(lambda((obj) obj->font = or(cadr(member(obj->font '( \"fixed\" \"roman\" \"stick\" ))) \"fixed\")) setof(obj geGetSelSet() obj->objType == \"label\") )") ; Cycles selected label fonts
; for Vikas
load("~/SKILL/CCS/zoom_kais.il")
; 1/31/2013 - moved zoomInst here after glitch today.. need CCSclip
load("~/SKILL/utils/zoomInst.il")
; 8/23/2013
hiSetBindKey("Symbol" "Ctrl <Key>l" "squarePinsToLine()") ; Converts square pins to line pins
hiSetBindKey("Symbol" "Ctrl <Key>p" "hiSelectSymPins()") ; Toggles pin selection mode
; 10/19/2012
hiSetBindKey("Symbol" "Ctrl Alt<Key>a" "applify()")
; 10/4/2012 9/18/18 Sameer Garg - not Escape, use Escape EF
;hiSetBindKey("Schematics" "<Key>Escape EF" "{getLastInstInfo() hiFormCancel(geCommonFindMarkerForm) hiFormCancel(schObjPropForm) cancelEnterFun()}")
hiSetBindKey("Schematics" "<Key>Escape EF" "{getLastInstInfo() cancelEnterFun()}") ; Cancels command and gets last instance info
; move in the Calculator buffer - only tested in IC5.. 11/23/2012
; hiSetBindKey("awv" "<Btn4Down>" "_dwtCalCalcInput( 'up )")
; hiSetBindKey("awv" "<Btn5Down>" "_dwtCalCalcInput( 'dwn )")
; 11/14/2012
; hiSetBindKey("awv" "Ctrl<Key>d" "{drLoadDrf(buildString( list( pwd() \"display.drf_L1\") \"/\" ) ) awvRedrawWindowMenuCB()}" )
; hiSetBindKey("awv" "Ctrl<Key>t" "{drLoadDrf(buildString( list( pwd() \"display.drf_thickLine\") \"/\" ) ) awvRedrawWindowMenuCB()}" )
; 9/27/12; 2/14/17 changed from L1 to dashed
hiSetBindKey("Schematics" "Ctrl<Key>d" "{drLoadDrf(buildString( list( pwd() \"display.drf_dashed\") \"/\" ) ) hiRedraw()}" ) ; Loads dashed display resource file
hiSetBindKey("Schematics" "Ctrl<Key>t" "{drLoadDrf(buildString( list( pwd() \"display.drf_thickLine\") \"/\" ) ) hiRedraw()}" ) ; Loads thick line display resource file
; 11/4/14
hiSetBindKey("Schematics" "Ctrl<Key>l" "{drLoadDrf(buildString( list( pwd() \"display.drf_pwrplot\") \"/\" ) ) hiRedraw()}" ) ; Loads power plot display resource file
hiSetBindKey("Layout" "Ctrl<Key>l" "{drLoadDrf(buildString( list( pwd() \"display.drf_pwrplot\") \"/\" ) ) hiRedraw()}" ) ; Loads power plot display resource file
; 2/15/17
hiSetBindKey("Schematics" "Ctrl Shift<Key>b" "{drLoadDrf(buildString( list( pwd() \"display.drf_blink\") \"/\" ) ) hiRedraw()}" ) ; Loads blinking display resource file
hiSetBindKey("Layout" "Ctrl Shift<Key>b" "{drLoadDrf(buildString( list( pwd() \"display.drf_blink\") \"/\" ) ) hiRedraw()}" ) ; Loads blinking display resource file
; increase/ decrease wire thickness with ALT - scrollwheel
; hiSetBindKey("Schematics" "Alt<Btn4Down>" "geGetSelSet()~>width = car(geGetSelSet()~>width)*1.25")
; hiSetBindKey("Schematics" "Alt<Btn5Down>" "geGetSelSet()~>width = car(geGetSelSet()~>width)*0.8")
hiSetBindKey("Schematics" "Alt<Btn4Down>" "inc_wire_inst(1.25)") ; Increases wire thickness or bus number for selected instances/wires with ALT Scroll Wheel Down
hiSetBindKey("Schematics" "Alt<Btn5Down>" "inc_wire_inst(0.8)") ; Decreases wire thickness or bus number for selected instances/wires with ALT Scroll Wheel Up
hiSetBindKey("Schematics" "Ctrl<Key>r" "schHiReplace()") ; Opens the replace form
hiSetBindKey("Symbol" "Ctrl<Key>r" "schHiReplace()") ; Opens the replace form
; hiSetBindKey("Schematics" "<Key>1" "load(\"~/SKILL/utils/op_info.il\")")
; what served me so well for so long:)
hiSetBindKey("Schematics" "<Key>1" "sevPrintResults(sevSession(hiGetCurrentWindow()) 'dcOpPoints)") ; Prints DC operating points
hiSetBindKey("Schematics" "<Key>2" "CCSkey() awviPUpdateMenuCB()")
; 10/2/18
hiSetBindKey("Schematics" "<Key>3" "{CCSkey() if( rexMatchp( \"Results\" hiGetWindowName( hiGetCurrentWindow() ) ) awviClosePrintWindowMenuCB() )}")
hiSetBindKey("Schematics" "Alt<Key>s" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"splitStrip\")") ; Splits ViVa strip
; moving to 6.1.6
; hiSetBindKey("Schematics" "<Key>-" "_dwtCalCalcInput( 'subtract )")
hiSetBindKey("Schematics" "<Key>-" "calCalcInput( 'subtract )") ; Sends subtract input to Calculator
hiSetBindKey("Schematics" "<Key>4" "_vivaStartSelectSignalMode( \"VT\" )") ; Enters mode to select voltage traces for plotting
hiSetBindKey("Schematics" "<Key>7" "_vivaStartSelectSignalMode( \"VS\" )") ; Enters mode to select voltage signals for plotting
hiSetBindKey("Schematics" "Alt<Key>4" "_vivaStartSelectSignalMode( \"IT\" )") ; Enters mode to select current traces for plotting
hiSetBindKey("Schematics" "Alt<Key>7" "_vivaStartSelectSignalMode( \"IS\" )") ; Enters mode to select current signals for plotting
; hiSetBindKey("Schematics" "Ctrl<Key>4" "_amsaDirectPlot( sevSession(hiGetCurrentWindow()) 'asiiPlotTranSignalCB)")
; after de post aus Andrew Beckett
; ; hiSetBindKey("Schematics" "Ctrl<Key>4" "load(\"~/SKILL/utils/direct_plot.il\")")
hiSetBindKey("Schematics" "Ctrl<Key>4" "MYappendSignal()") ; Enters select outputs to plot mode
hiSetBindKey("Schematics" "Shift<Key>4" "explAppendSignal()") ; Appends signal to plot (Explorer)
; Checking for ver 6
if( rexMatchp( "IC6" cadr(parseString(getVersion(t))) )
    then
hiSetBindKey("Schematics" "<Key>5" "_vvCalculatorPlot(_vivaGetSessionName())" ) ; Plots Calculator expression in ViVa
hiSetBindKey("vivaGraph" "<Key>5" "_vvCalculatorPlot(_vivaGetSessionName())" ) ; Plots Calculator expression in ViVa
hiSetBindKey("Schematics" "Shift<Key>Up" "schHiFontUpdate(?increase t)") ; Increases selected text font size
hiSetBindKey("Schematics" "Shift<Key>Down" "schHiFontUpdate(?increase nil)") ; Decreases selected text font size
hiSetBindKey("Symbol" "Shift<Key>Up" "schHiFontUpdate(?increase t)") ; Increases selected text font size
hiSetBindKey("Symbol" "Shift<Key>Down" "schHiFontUpdate(?increase nil)") ; Decreases selected text font size
    else
hiSetBindKey("Schematics" "<Key>5" "_dwtCaliPlotCB( ?erase nil )" ) ; Plots Calculator expression
hiSetBindKey("Schematics" "Shift<Key>Up" "geGetSelSet()~>height = car(geGetSelSet()~>height)*1.25") ; Increases height of selected objects
hiSetBindKey("Schematics" "Shift<Key>Down" "geGetSelSet()~>height = car(geGetSelSet()~>height)*0.8") ; Decreases height of selected objects
hiSetBindKey("Symbol" "Shift<Key>Up" "geGetSelSet()~>height = car(geGetSelSet()~>height)*1.25") ; Increases height of selected objects
hiSetBindKey("Symbol" "Shift<Key>Down" "geGetSelSet()~>height = car(geGetSelSet()~>height)*0.8") ; Decreases height of selected objects
) ; if
; hiSetBindKey("Schematics" "<Key>6" "load(\"~/SKILL/utils/annotOp.il\")")
hiSetBindKey("Schematics" "<Key>6" "sevAnnotateResults(sevSession(hiGetCurrentWindow()) 'dcOpPoints)") ; Annotates DC operating points on schematic
hiSetBindKey("Schematics" "Alt<Key>6" "sevAnnotateResults(sevSession(hiGetCurrentWindow()) 'dcNodeVoltages)") ; Annotates DC node voltages on schematic
; may 7 2014 after using isr6 for the first time
; hiSetBindKey("Schematics" "Ctrl<Key>6" "sevAnnotateResults(sevSession(hiGetCurrentWindow()) 'defaults)")
hiSetBindKey("Schematics" "Ctrl<Key>6" "killPinAnnotate()") ; Removes terminal net names annotation
hiSetBindKey("Schematics" "<Key>9" "geEnterAddNetProbe()") ; Enters mode to add net probe
hiSetBindKey("Layout" "<Key>9" "leHiMarkNet()") ; Marks net in Layout
;hiSetBindKey("Schematics" "<Key>0" "geDeleteAllProbe(getCurrentWindow() t)")
; 12/16/19
hiSetBindKey("Schematics" "<Key>0" "{geDeleteAllProbe(getCurrentWindow() t) geDeleteAllHilightSet( geGetWindowCellView() )}") ; Deletes all probes and discards all highlights
hiSetBindKey("Layout" "<Key>0" "leHiUnmarkNetAll()") ; Unmarks all nets in Layout
hiSetBindKey("Schematics" "<Key>8" "geDeleteNetProbe()") ; Deletes net probe
hiSetBindKey("Layout" "<Key>8" "leHiUnmarkNet()") ; Unmarks net in Layout
hiSetBindKey("Layout" "Alt<Key>x" "lxHiProbe()") ; Probes object in Layout
hiSetBindKey("Schematics" "Ctrl<Key>w" "hiCloseWindow(getCurrentWindow())") ; Closes current window
hiSetBindKey("Schematics" "Alt<Key>w" "sevOpenPlotWindow(sevSession(getCurrentWindow()))" ) ; Opens plot window for ADE session
hiSetBindKey("Schematics" "Alt<Key>b" "load(\"~/SKILL/utils/sch_print.il\")")
hiSetBindKey("Schematics" "Ctrl<Key>b" "load(\"~/SKILL/utils/sch_print_L.il\")")
; hiSetBindKey("Schematics" "Ctrl<Key>b" "sch_print_L()")
hiSetBindKey("Schematics" "Alt<Key>r" "{CCSrestoreDefaultWireColors() schZoomFit(1.0 0.9)}") ; Restores default wire colors and zooms fit
hiSetBindKey("Schematics" "<Key>e" "MYdescend(1)") ; Descends into hierarchy (current window)
hiSetBindKey("Schematics" "Ctrl<Key>x" "MYdescend(0)") ; Descends into hierarchy (new window)
; worked with Sanjeev of CCS
; hiSetBindKey("Schematics" "Ctrl<Key>x" "load(\"~/SKILL/utils/descendSchNew.il\")")
; hiSetBindKey("Schematics" "Alt<Key>x" "load(\"~/SKILL/utils/descendSch.il\")")
; above now used for full path hierarchical descending..
; hiSetBindKey("Schematics" "Alt<Key>d" "zoomInst()")
; 1/31/2013 :(
hiSetBindKey("Schematics" "Alt<Key>d" "CCSclip() hiRegTimer(\"zoomInst(CLIPDATA)\" 10)") ; Zooms to instance based on clipboard data
hiSetBindKey("Schematics" "Alt<Key>x" "hierDescend(parseString(hierPath \"/\"))") ; Descends into hierarchy based on path variable
hiSetBindKey("Schematics" "Ctrl<Key>y" "load(\"~/SKILL/utils/descendSym.il\")")
hiSetBindKey("Schematics" "Alt<Key>e" "{hierPath=geGetInstHier(hiGetCurrentWindow()) schHiReturnToTop()}") ; Saves current hierarchical path and returns to top
hiSetBindKey("Schematics" "Alt<Key>g" "CCSSnapToGrid()") ; Snaps objects to grid
hiSetBindKey("Symbol" "Alt<Key>g" "CCSSnapToGrid()") ; Snaps objects to grid
hiSetBindKey("Schematics" "Ctrl<Key>e" "MYReturn()") ; Returns up in hierarchy
hiSetBindKey("Schematics" "Ctrl<Key>v" "load(\"~/SKILL/utils/descendVA.il\")")
;hiSetBindKey("Schematics" "<Key>j" "sevPrintResults('sevSession1 'dcOpPoints)")
hiSetBindKey("Schematics" "Ctrl<Key>Up" "updatePinLabels(1.2)") ; Increases selected pin label size
hiSetBindKey("Schematics" "Ctrl<Key>Down" "updatePinLabels(0.8)") ; Decreases selected pin label size
hiSetBindKey("Schematics" "Alt<Key>Up" "updateSnapSpacing(2)") ; Doubles grid snap spacing
hiSetBindKey("Schematics" "Alt<Key>Down" "updateSnapSpacing(0.5)") ; Halves grid snap spacing
hiSetBindKey("Symbol" "Alt<Key>Up" "updateSnapSpacing(2)") ; Doubles grid snap spacing
hiSetBindKey("Symbol" "Alt<Key>Down" "updateSnapSpacing(0.5)") ; Halves grid snap spacing
hiSetBindKey("Symbol" "Ctrl<Key>Up" "updatePinLabels(1.25)") ; Increases selected pin label size
hiSetBindKey("Symbol" "Ctrl<Key>Down" "updatePinLabels(0.8)") ; Decreases selected pin label size
hiSetBindKey("Symbol" "Alt<Key>e" "{hierPath=geGetInstHier(hiGetCurrentWindow()) schHiReturnToTop()}") ; Saves current hierarchical path and returns to top
hiSetBindKey("Schematics" "<Key>k" "sevDirectPlot(sevSession(hiGetCurrentWindow()) 'asiDirectPlotResultsMenuCB)") ; Direct plot results menu
; "load(\"~/SKILL/utils/result_plot_mform.il\")")
; eliminated that file load thing on 1/31/2013
hiSetBindKey("Schematics" "<Key>j" "_noiseSummaryPrintMenuCB('((noise noise) (pnoise pnoise)) sevSession(hiGetCurrentWindow())" ) ; Prints noise summary results
; "load(\"~/SKILL/utils/noise_info.il\")")
; eliminated that file load thing on 1/31/2013
hiSetBindKey("Schematics" "Alt<Key>c" "sevOpenCalculator()") ; Opens Calculator
; hiSetBindKey("awv" "Alt<Key>s" "awviSwitchAxisModeCB()" )
hiSetBindKey("Schematics" "Ctrl<Key>2" "schHiChangeEditMode(\"a\")") ; Changes edit mode to append (editable)
hiSetBindKey("Schematics" "Ctrl Shift<Key>2" "schHiChangeEditMode(\"r\")") ; Changes edit mode to replace
hiSetBindKey("Layout" "Ctrl<Key>2" "_leChangeEditMode(\"a\")") ; Changes edit mode to append (editable) in Layout
hiSetBindKey("Symbol" "Ctrl<Key>2" "schHiChangeEditMode(\"a\")") ; Changes edit mode to append (editable) in Symbol
hiSetBindKey("Schematics" "Alt<Key>f" "schHiFind()") ; Opens the find form
hiSetBindKey("Symbol" "Alt<Key>f" "schHiFind()") ; Opens the find form
hiSetBindKey("Schematics" "Alt<Key>i" "load(\"~/SKILL/utils/findInst.il\")")
hiSetBindKey("Schematics" "Alt<Key>n" "load(\"~/SKILL/utils/findNet.il\")")
hiSetBindKey("Symbol" "Ctrl<Key>w" "hiCloseWindow(getCurrentWindow())") ; Closes current window
hiSetBindKey("Symbol" "Shift<Key>x" "schHiVICAndSave()") ; Performs VIC and saves in Symbol view
hiSetBindKey("Symbol" "Ctrl<Key>e" "MYReturn()") ; Returns up in hierarchy
; hiSetBindKey("awv" "<Key>u" "awvUpdateWindowMenuCB()")
; hiSetBindKey("awv" "Ctrl<Key>u" "awvUndoMenuCB()")
; hiSetBindKey("awv" "<Key>5" "_dwtCaliPlotCB( ?erase nil )" )
; hiSetBindKey("awv" "<Key>r" "{ awvResetWindowMenuCB() awviSwitchAxisModeCB()}")
; ;hiSetBindKey("awv" "Ctrl<Key>x" "awvXAxisMenuCB()")
; hiSetBindKey("awv" "Ctrl<Key>w" "awvCloseWindowMenuCB()")
; hiSetBindKey("awv" "Ctrl<Key>o" "awvAxesOptionMenuCB()")
hiSetBindKey("Show File" "Ctrl<Key>w" "hiEditFileQuitTrigger(-1 0)") ; Closes Show File window
hiSetBindKey("Schematics" "<Key>t" "_noiseSummaryPrintMenuCB('((noise noise) (pnoise pnoise)) 'sevSession1)") ; Prints noise summary results (Session 1)
; hiSetBindKey("awv" "Ctrl<Key>g" "myAwvToggleGrid()")
; hiSetBindKey("awv" "<Key>s" "awvSubwindowMenuCB()")
; ; ; hiSetBindKey("awv" "Ctrl<Key>e" "load(\"~/SKILL/utils/awv_print.il\")") ; removed 11/7/2012
; hiSetBindKey("awv" "Ctrl<Key>b"
; "load(\"~/SKILL/utils/awv_print_gv.il")")
; hiSetBindKey("awv" "Ctrl<Key>e" "load(\"~/SKILL/utils/awv_print_gv_L.il\")")
; hiSetBindKey("awv" "Ctrl<Key>x" "load(\"~/SKILL/utils/awv_x_log.il\")")
; ; ; hiSetBindKey("awv" "Ctrl<Key>t" "load(\"~/SKILL/utils/awv_x_auto.il\")") ; 11/14/2012
; hiSetBindKey("awv" "<Key>c" "sevOpenCalculator()")
hiSetBindKey("Read veriloga" "Ctrl<Key>w" "schHdlCloseWindow( getCurrentWindow() nil)") ; Closes Verilog-A window
hiSetBindKey("Read veriloga" "Ctrl<Key>e" "schHDLReturn()") ; Returns from Verilog-A view
hiSetBindKey("Verilog-AMS" "Ctrl<Key>w" "schHdlCloseWindow( getCurrentWindow() nil)") ; Closes Verilog-AMS window
hiSetBindKey("Verilog-AMS" "Ctrl<Key>e" "schHDLReturn()") ; Returns from Verilog-AMS view
hiSetBindKey("systemVerilog" "Ctrl<Key>e" "schHDLReturn()") ; Returns from SystemVerilog view
; hiSetBindKey("Command Interpreter" "Alt<Key>l" "mxOpenLibManager")
hiSetBindKey("Read HDL" "Ctrl<Key>w" "schHdlCloseWindow( getCurrentWindow() nil)") ; Closes HDL window
; hiSetBindKey("analogArtist-Simulation" "<Key>c" "sevOpenCalculator()")
; above doesn't work
; Mark Summers
hiSetBindKey("Schematics" "<Key>q" "hiSetFormSize(schObjPropForm list(500 1000)) schHiObjectProperty()") ; Opens object properties form with custom size
; Sanjeev - to ensure that IC6 behaves like IC5 - my follow on email to 42806692
hiSetBindKey("Schematics" "None<Btn1Down>(2)" "schExtendSelectPt()") ; Extends selection with double click
; property form from S Pradeep Raja
load("~/SKILL/CCS/CCSpbSchObjProp.il") ; Q opens schematic object properties form
; 7/26/16 from Likesh Sahoo - select all of a wire with only one segment already selected
hiSetBindKey( "Schematics" "Ctrl Alt<Key>w" "geSelectFigs( car(geGetSelSet()~>net~>figs) )" ) ; Selects all figures on the net of the selected wire
load("~/SKILL/utils/lcPinNames.il")
hiSetBindKey( "Schematics" "Ctrl Alt<Key>5" "lcPinNames( 1 )" )
hiSetBindKey( "Symbol" "Ctrl Alt<Key>5" "lcPinNames( 1 )" )
load("~/SKILL/utils/lcLabels.il")
hiSetBindKey( "Schematics" "Ctrl Alt<Key>6" "lcLabels( )" )
; 8/1/16
load("~/SKILL/utils/symIncreasePinSpacing.il") ; Provides function to increase pin spacing in Symbol view (used by CTRL-+/-)
hiSetBindKey("Symbol" "Ctrl<Key>+" "symIncreasePinSpacing(1)") ; Increases pin spacing
hiSetBindKey("Symbol" "Ctrl<Key>-" "symIncreasePinSpacing(-1)") ; Decreases pin spacing
hiSetBindKey("Symbol" "Ctrl<Key>KP_Add" "symIncreasePinSpacing(1)") ; Increases pin spacing (keypad)
hiSetBindKey("Symbol" "Ctrl<Key>KP_Subtract" "symIncreasePinSpacing(-1)") ; Decreases pin spacing (keypad)
hiSetBindKey( "Schematics" "Ctrl Alt Shift<Key>s" "saved_sel = geGetSelSet()" ) ; Saves current selection
hiSetBindKey( "Schematics" "Ctrl Shift<Key>l" "foreach( obj saved_sel geSelectObject(obj) )" ) ; Restores saved selection
; 9/1/16
; hiSetBindKey( "Schematics" "Ctrl Shift<Key>x" "geHiDeleteAllMarker()" )
; 10/28/17
hiSetBindKey( "Schematics" "Ctrl Shift<Key>x" "geDeleteAllMarker( geGetEditCellView()) nil nil nil" ) ; Deletes all markers 12/22/25 long overdue
; 9/3/16
load( "~/SKILL/utils/pinName2ClipBoard.il" ) ; CTRL-SHIFT-C copies selected pin name to clipboard
hiSetBindKey( "Schematics" "Ctrl Shift<Key>c" "pinName2ClipBoard()" ) ; Copies selected pin name to clipboard
; 9/5/16 , 10/3/16
load "~/SKILL/utils/createOrSelPins.il" ; CTRL-SHIFT-P creates pin from label or selects pins
hiSetBindKey( "Schematics" "Ctrl Shift<Key>p" "createOrSelPins()" ) ; Creates pin from selected label or selects all pins
hiSetBindKey( "Symbol" "Ctrl Shift<Key>p" "schHiSelectByProperty( \"select\" \"pinName\" \"==\" \"*\" )" ) ; Selects all pins
load( "~/SKILL/utils/horizontalize.il" )
hiSetBindKey( "Symbol" "Ctrl Shift<Key>h" "horizontalize()" )
hiSetBindKey( "Schematics" "Ctrl Shift<Key>h" "horizontalize()" )
load( "~/SKILL/utils/roundPinsToLine.il" ) ; Provides function to convert round pins to line pins
load( "~/SKILL/utils/squarePinsToLine.il" ) ; CTRL-L converts square pins to line pins
load( "~/SKILL/utils/arrows.il" ) ; Provides function to create graphical arrows
; 9/9/16
load "~/SKILL/utils/zoomText.il" ; CTRL-ALT-D zooms to selected text label
hiSetBindKey( "Schematics" "Ctrl Alt<Key>d" "zoomText()" ) ; Zooms to selected text label
; 9/12/16
load "~/SKILL/utils/toglImportSplitRseg.il" ; CTRL-M toggles split mode for imported devices in Layout XL
; 9/30/16; 10/7/16
load "~/SKILL/utils/MYflip.il" ; Provides function to flip objects horizontally/vertically (used by CTRL-H/U)
hiSetBindKey( "Schematics" "Ctrl <Key>h" "MYflip(1)" ) ; Flips selected objects horizontally
hiSetBindKey( "Schematics" "Ctrl <Key>u" "MYflip(0)" ) ; Flips selected objects vertically
hiSetBindKey( "Symbol" "Ctrl <Key>h" "MYflip(1)" ) ; Flips selected objects horizontally
hiSetBindKey( "Symbol" "Ctrl <Key>u" "MYflip(0)" ) ; Flips selected objects vertically
; 10/3/16
load "~/SKILL/utils/selSimilar.il" ; CTRL-ALT-H selects similar objects (same master)
hiSetBindKey( "Schematics" "Ctrl Alt<Key>h" "selSimilar()" ) ; Selects similar objects (same master)
hiSetBindKey( "Layout" "Ctrl Alt<Key>h" "selSimilar()" ) ; Selects similar objects (same master)
; 10/7/16
load("~/SKILL/utils/inc_bus.il") ; Provides function to increment/decrement bus indices (used by inc_wire_inst and txpose_inst_label)
load("~/SKILL/utils/inc_wire_inst.il") ; ALT-ScrollWheel changes wire thickness or bus number on instance/net names
load("~/SKILL/utils/fl_nodes.il")
load("~/SKILL/utils/getWinNum.il")
; 11/29/16 after Bhupendra Kumar helped out..
load "~/SKILL/utils/selectInTableView.il" ; CTRL-I selects object in Hierarchy Editor table view
hiSetBindKey( "Schematics" "Ctrl <Key>i" "heHiEditConfig() selectInTableView()" ) ; Opens Hierarchy Editor config view and selects instance in table view
; 1/26/17
load "~/SKILL/utils/listInstPaths.il" ; CTRL-ALT-L lists instance paths
hiSetBindKey( "Schematics" "Ctrl Alt<Key>l" "listInstPaths()" ) ; Lists instance paths
; 2/8/17
load "~/SKILL/utils/toglInstMstrDisplay.il" ; CTRL-ALT-D toggles instance label display between instance name and master name
hiSetBindKey( "Layout" "Ctrl Alt<Key>d" "toglInstMstrDisplay()" ) ; Toggles instance label display between instance name and master name
; 2/15/17
load "~/SKILL/utils/setInstNamePrefix.il" ; Provides function to set instance name prefix
; 3/1/17
load "~/SKILL/utils/removeColors.il" ; F7 removes colors (highlighting)
hiSetBindKey( "Schematics" "<Key>F7" "removeColors()" ) ; Removes colors (highlighting)
hiSetBindKey( "Schematics" "Ctrl <Key>F7" "geResetCellView(deGetCellView())" ) ; Resets cell view
; 3/14/17
hiSetBindKey( "Schematics" "Alt <Key>Q" "schHiSelectByProperty(\"select\")" ) ; Selects objects by property
; 3/21/17
load "~/SKILL/utils/fixPartName.il" ; CTRL-ALT-C fixes @Partname property in Symbol view
hiSetBindKey( "Symbol" "Ctrl Alt<Key>C" "fixPartName()" ) ; Fixes @Partname property
; 4/3/17
load "~/SKILL/utils/openSelReadOnly.il" ; CTRL-SHIFT-N opens selected cell view in read-only mode
; 5/18/17
hiSetBindKey("Schematics" "Alt Shift<Key>h" "heHiEditConfig()") ; Launches Hierarchy Editor config view
; 11/11/17
hiSetBindKey( "Schematics" "Ctrl <Key>c" "if( geGetWindowCellView()~>mode != \"r\" then schHiCreateNoteShape( ?shape \"ellipse\" ?style \"dashed\"))" ) ; Creates a dashed ellipse note shape
; 1/3/17
hiSetBindKey("Layout" "Alt <Key>v" "pteSetVisible(\"Vias\" !pteIsVisible(\"Vias\" \"Objects\") \"Objects\")" ) ; Toggles visibility of Vias objects
; 3/20/18
hiSetBindKey("Schematics" "Alt Shift<Key>d" "MYappendTranDiff()") ; Launches plot transient difference command
; 5/2/18
load "~/SKILL/utils/renameInsts.il" ; CTRL-ALT-I renames selected instances iteratively
hiSetBindKey("Schematics" "Ctrl Alt<Key>i" "renameInsts()") ; Renames selected instances iteratively
;7/30/18
load "~/SKILL/utils/txpose_bus.il" ; Provides function to transpose bus indices (used by txpose_inst_label)
load "~/SKILL/utils/txpose_inst_label.il" ; ALT-SHIFT-ScrollWheel transposes instance name/label bus indices
; 1/11/20
;hiSetBindKey("Schematics" "Alt Shift<Btn4Down>" "txpose_inst_label('t)")
;hiSetBindKey("Schematics" "Alt Shift<Btn5Down>" "txpose_inst_label(nil)")
; 7/12/18
hiSetBindKey( "Schematics" "Shift <Key>r" "schHiCreateNoteShape( ?shape \"rectangle\" ?style \"solid\")" ) ; Creates a solid rectangle note shape
hiSetBindKey( "Schematics" "Shift <Key>q" "schHiCreateNoteShape( ?shape \"polygon\" ?style \"solid\")" ) ; Creates a solid polygon note shape
; 6/1/16 and 7/12/18
hiSetBindKey( "Schematics" "<Key>n" "schHiCreateNoteShape( ?shape \"line\" ?style \"solid\" ?width 0)") ; Creates a solid line note shape
; 7/26/18
hiSetBindKey("Schematics" "Alt Shift <Key>q" "load( \"~/SKILL/utils/sch_prop_all_sel.il\" )" ) ; Loads script to launch properties form with "All Selected"
hiSetBindKey("Schematics" "<Key>q" "load( \"~/SKILL/utils/sch_prop_only_current.il\" )" ) ; Loads script to launch object properties form
; 8/25/18
load "~/SKILL/utils/CreateLibManSelInst.il" ; CTRL-ALT-N places instance from Library Manager
hiSetBindKey("Schematics" "Ctrl Alt <Key>n" "CreateLibManSelInst()" ) ; Places instance from Library Manager
; 8/13/19
hiSetBindKey("Layout" "Ctrl Alt <Key>n" "CreateLibManSelInst()" ) ; Places instance from Library Manager
MYLIB= ""
MYCELL= ""
MYVIEW= ""
if( load_all_bindkeys
then
    println("Loading additional bindkeys")
    ; 9/12/18 ; Parul Sharma
    hiSetBindKey("Schematics" "Ctrl <Key>n" "{ MYLIB=schCreateInstForm->libraryName->value \
    MYCELL=schCreateInstForm->cellName->value MYVIEW=schCreateInstForm->viewName->value \
    schHiCreateInst(\"basic\" \"noConn\" \"symbol\") }") ; Saves current instance form values and creates "noConn" symbol instance
    hiSetBindKey("Schematics" "<Key>i" "{ if( MYLIB && MYCELL && MYVIEW then \
    if( MYCELL != \"noConn\" then \
    	println(\"Not noConn\") \
    	schCreateInstForm->libraryName->value=MYLIB \
    	schCreateInstForm->cellName->value=MYCELL \
    	schCreateInstForm->viewName->value=MYVIEW schHiCreateInst() else schHiCreateInst() \
    ) ) }" \
    ) ; Places instance using saved form values
    ; one has to use the Ctrl-n bindkey after the first 'i' bindkey usage until I figure out a better way :)
)
; 9/14/18 thanks Sameer Garg
load "~/SKILL/utils/getLastInstInfo.il" ; Provides function to get information about the last placed instance
; 9/16/18
load "~/SKILL/utils/subJumpBack.il" ; CTRL-ALT-E jumps back up in hierarchy
hiSetBindKey( "Schematics" "Ctrl Alt <Key>e" "subJumpBack()" ) ; Jumps back up in hierarchy
; 9/19/18
load "~/SKILL/utils/libManSelectTB.il" ; CTRL-ALT-T selects testbench in Library Manager
; contains CTRL-ALT-T to locate testbench
; 09/28/18
load "~/SKILL/utils/copyResVal.il" ; CTRL-ALT-R copies resistor value from one to others
hiSetBindKey("Schematics" "Ctrl Alt<Key>r" "copyResVal()") ; Copies resistor value from one to others
;10/31/18
hiSetBindKey("vivaGraph" "Ctrl<Key>d" "and(setq(sessionName awvGetCurrentWindow()->vivaSession) awvCloseWindow(awvGetCurrentWindow()))") ; Closes current ViVa window
;11/09/18
hiSetBindKey("Schematics" "Ctrl Shift<Key>o" "{selectResults('dcOpInfo) report(?output \"param.txt\" ?format \"spice\")}") ; Saves DC operating point results to file
;12/20/18 ; 01/23/19
;load "~/SKILL/utils/genNetlist.il"
;hiSetBindKey("Schematics" "Alt Shift<Key>n" "genNetlist()")
;01/02/19
hiSetBindKey("Schematics" "Alt Shift<Key>l" "ddsOpenLibManager()") ; Opens Library Manager
;01/21/19
hiSetBindKey("Schematics" "Ctrl Alt <Key>q" "sevQuit(sevSession(hiGetCurrentWindow()) )") ; Quits attached ADE-L session
;02/18/19
load "~/SKILL/utils/incrText.il" ; CTRL-PageUp/Down increments/decrements selected text instances
hiSetBindKey( "Schematics" "Ctrl <Key>PageUp" "incrText( 1 )" ) ; Increments selected text instance
hiSetBindKey( "Schematics" "Ctrl <Key>PageDown" "incrText( -1 )" ) ; Decrements selected text instance
;03/10/19
load "~/SKILL/utils/loadLatestRun.il" ; CTRL-SHIFT-R loads the latest simulation run results
hiSetBindKey( "Schematics" "Ctrl Shift<Key>R" "loadLatestRun()" ) ; Loads the latest simulation run results
;07/01/19
load "~/SKILL/utils/togl_ViVA_Browser.il" ; CTRL-B toggles the ViVa browser
hiSetBindKey("vivaGraph" "Ctrl<Key>b" "togl_ViVA_Browser()") ; Toggles the ViVa browser
;07/09/19
load "~/SKILL/utils/rePlotOverlay.il"
hiSetBindKey("Schematics" "Alt Shift <Key>p" "rePlotOverlay()")
; 7/31/19 -- THanks Edwin of Perforce (IC Manage )
load "~/SKILL/utils/ICM_libManSelectInst.il" ; ALT-SHIFT-S locates selected instance/cell in IC Manage Library Manager
; 10/9/19
load "~/SKILL/utils/putViewName.il"
hiSetBindKey( "Schematics" "Ctrl Shift<Key>s" "putViewName()" )
; 1/11/20
load "~/SKILL/utils/proc_alt_sh_scroll.il"
load "~/SKILL/utils/updateTemp.il"
hiSetBindKey("Schematics" "Alt Shift<Btn4Down>" "proc_alt_sh_scroll_up()")
hiSetBindKey("Schematics" "Alt Shift<Btn5Down>" "proc_alt_sh_scroll_down()")
; 2/7/20
; load "~/SKILL/utils/viva_condense.il" ; don't know what this does seems useless :)
; hiSetBindKey("vivaGraph" "Alt Shift<Key>e" "viva_condense()")
; 3/11/2020
load "~/SKILL/utils/list_pins.il" ; Provides function to list pins
; 8/6/2020
hiSetBindKey("vivaGraph" "Alt Shift<Key>s" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"moveTracesNewStrip\")") ; Moves selected traces to a new strip in ViVa
; 8/9/2020
load "~/SKILL/utils/getPlotsAsText.il" ; ALT-SHIFT-W gets plot data as text
hiSetBindKey("Schematics" "Alt Shift<Key>w" "getPlotsAsText()") ; Gets plot data as text
load "~/SKILL/utils/plotTextWaves.il" ; CTRL-SHIFT-W plots text data as waves
hiSetBindKey("Schematics" "Ctrl Shift<Key>w" "plotTextWaves()") ; Plots text data as waves
hiSetBindKey("Schematics" "Alt <Key>s" "_schHiSave()") ; Saves schematic
load "~/SKILL/utils/tag_labels.il"
hiSetBindKey("Schematics" "Ctrl Alt<Key>_" "tag_labels()") ; ; underscore meaningful name nets side by side test-bench helper
load "~/SKILL/utils/toglOnlyWireLblSel.il" ; CTRL-SHIFT-W toggles selection filter for wire labels
hiSetBindKey("Schematics" "Ctrl Shift<Key>w" "toglOnlyWireLblSel()") ; Toggles selection filter for wire labels
load "~/SKILL/utils/HEDoffTopCellGlobalBindings.il" ; CTRL-1 disables global bindings in Hierarchy Editor for top cell
hiSetBindKey("Cadence Hierarchy Editor" "Ctrl <Key>1" "HEDoffTopCellGlobalBindings()" ) ; Disables global bindings for top cell
hiSetBindKey("Schematics" "Ctrl <Key>1" "HEDoffTopCellGlobalBindings()" ) ; Disables global bindings for top cell
load "~/SKILL/utils/smartIncPinSpace.il" ; CTRL-SHIFT-]/[ smartly increases/decreases pin spacing
hiSetBindKey("Schematics" "Ctrl Shift<Key>]" "smartIncPinSpace(\"+\")") ; Smartly increases pin spacing
hiSetBindKey("Schematics" "Ctrl Shift<Key>[" "smartIncPinSpace(\"-\")") ; Smartly decreases pin spacing
hiSetBindKey( "vivaGraph" "Ctrl Shift<Key>d" "awvDeleteSubwindow( awvGetCurrentWindow() )") ; Deletes current subwindow in ViVa
; 9/2/21
load "~/SKILL/utils/delDashEllipse.il" ; CTRL-SHIFT-D deletes dashed ellipse note shapes
hiSetBindKey( "Schematics" "Ctrl Shift<Key>d" "delDashEllipse() ") ; Deletes dashed ellipse note shapes
; 9/29/21
hiSetBindKey( "Schematics" "Ctrl Alt Shift<Key>r" "sevRunEngine( sevSession(hiGetCurrentWindow() ) )") ; Runs simulation engine for ADE session
; 3/10/22
load "~/SKILL/utils/toggleCase.il" ; CTRL-ALT-C toggles case of selected text or pin names
hiSetBindKey( "Schematics" "Ctrl Alt<Key>c" "toggleCase()" ) ; Toggles case of selected text or pin names
; 3/28/22 after Lalit tells me they did modify to ignore the don't-confirm setting between ISR16 and 23
hiSetBindKey("vivaGraph" "<Key>e" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"deleteObjects\") ") ; Deletes selected objects in ViVa
; 4/12/22 toggle net highlighting
load "~/SKILL/utils/togl_net_hilite.il" ; CTRL-ALT-SHIFT-D toggles net highlighting
hiSetBindKey( "Schematics" "Ctrl Alt Shift<Key>d" "togl_net_hilite()" ) ; Toggles net highlighting
; 5/16/22 was geHiDeleteMarker()
hiSetBindKey("Schematics" "Ctrl <Key>g" "{ MYLIB=schCreateInstForm->libraryName->value \
MYCELL=schCreateInstForm->cellName->value MYVIEW=schCreateInstForm->viewName->value \
schHiCreateInst(\"analogLib\" \"gnd\" \"symbol\") }") ; Creates a gnd instance
hiSetBindKey("Schematics" "Ctrl <Key>v" "{ MYLIB=schCreateInstForm->libraryName->value \
MYCELL=schCreateInstForm->cellName->value MYVIEW=schCreateInstForm->viewName->value \
schHiCreateInst(\"analogLib\" \"vdc\" \"symbol\") }") ; Creates a vdc instance
load "~/SKILL/utils/cpLibCell2Clipboard.il" ; ALT-SHIFT-C copies library/cell name to clipboard
hiSetBindKey( "Schematics" "Alt Shift<Key>c" "cpLibCell2Clipboard()" ) ; Copies library and cell name to clipboard
; 8/30/22
hiSetBindKey( "Schematics" "Ctrl Alt<Key>x" "desc_new_tab(0)" ) ; Descends into hierarchy in a new window
hiSetBindKey( "Schematics" "Ctrl Shift<Key>t" "desc_new_tab(1)" ) ; Descends into hierarchy in a new tab
; 9/21/22
hiSetBindKey( "Layout" "Ctrl <Key>h" "_leRotateOrFlip(\"MY\")" ) ; Flips selected objects horizontally
; 10/28/22
load "~/SKILL/utils/suffix.il" ; CTRL-ALT-E/F/G manipulate suffix on names/labels
hiSetBindKey( "Schematics" "Ctrl Alt<Key>e" "rmvSuffix()" ) ; Removes suffix from selected names/labels
hiSetBindKey( "Schematics" "Ctrl Alt<Key>f" "putSuffix()" ) ; Puts suffix onto selected names/labels
hiSetBindKey( "Schematics" "Ctrl Alt<Key>g" "getSuffix()" ) ; Gets suffix from selected name/label into SUFFIX variable
; 12/8/22
hiSetBindKey("Schematics" "Alt Shift<Key>4" "explAppendTranDiff()") ; Appends transient difference plot (Explorer)
; 3/29/23
load "~/SKILL/utils/toglOnlyInstSel.il" ; CTRL-SHIFT-I toggles selection filter for instances
hiSetBindKey("Schematics" "Ctrl Shift<Key>i" "toglOnlyInstSel()") ; Toggles selection filter for instances
; 3/31/23 Shyam Gupta on 46691233
load "~/SKILL/CCS/CCSPushViVA.il" ; CTRL-ALT-V pushes transient simulation results to ViVa
hiSetBindKey("Schematics" "Ctrl Alt<Key>v" "CCSPushViVA(\"tran\")" ) ; Pushes transient simulation results to ViVa
load "~/SKILL/CCS/CCSAbutAlignInstances.il" ; CTRL-ALT-V/CTRL-ALT-SHIFT-H abuts and aligns selected instances
hiSetBindKey( "Layout" "Ctrl Alt <Key>v" "CCSAbutAlignInstances(\"vertical\")" ) ; Abuts and aligns selected instances vertically
hiSetBindKey( "Layout" "Ctrl Alt Shift <Key>h" "CCSAbutAlignInstances(\"horizontal\")" ) ; Abuts and aligns selected instances horizontally
load "~/SKILL/utils/getAlignDir.il"
load "~/SKILL/utils/inc_spc.il" ; ALT-ScrollWheel increases/decreases spacing in Layout
hiSetBindKey("Layout" "Alt<Btn4Down>" "inc_spc(t)") ; Increases spacing with ALT Scroll Wheel Down
hiSetBindKey("Layout" "Alt<Btn5Down>" "inc_spc(nil)") ; Decreases spacing with ALT Scroll Wheel Up
; 4/5/23
hiSetBindKey( "Layout" "Ctrl Alt <Key>x" "lxHiSwap()" ) ; Swaps objects in Layout
; 4/10/23
load "~/SKILL/utils/launch_ADE_L.il" ; CTRL-ALT-SHIFT-L launches ADE-L
hiSetBindKey("Schematics" "Ctrl Alt Shift<Key>l" "launch_ADE_L()" ) ; Launches ADE-L
; 9/20/23
;load "~/SKILL/utils/disp_fet_info.il"
; 10/4/23
load "~/SKILL/CCS/CCSaddPointOPPrint.il" ; CTRL-ALT-1 prompts to click on instance to print OP parameters
hiSetBindKey("Schematics" "Ctrl Alt <Key>1" "CCSpnt()" ) ; Prompts to click on instance to print OP parameters
; 11/16/23 - instantiate title_blk with CTRL SHIFT N - which takes over openSelReadOnly and calls it..
load "~/SKILL/utils/instTitleBlk.il" ; CTRL-SHIFT-N instantiates a title block (overrides openSelReadOnly)
hiSetBindKey("Schematics" "Ctrl Shift <Key>n" "instTitleBlk()" ) ; Instantiates a title block (overrides openSelReadOnly)
; 2/15/24 - layout productivity
hiSetBindKey( "Layout" "Ctrl <Key>h" "_leRotateOrFlip(\"MY\")" ) ; Flips selected objects horizontally
hiSetBindKey( "Layout" "Ctrl <Key>u" "_leRotateOrFlip(\"MX\")" ) ; Flips selected objects vertically
load "~/SKILL/CCS/CCSeditViaRowsCols.il" ; CTRL-ALT/SHIFT/BOTH changes via rows/columns of selected vias
; 2/22/24
load "~/SKILL/CCS/CCSvxlRaiseSchWin.il" ; ALT-H raises the schematic window used as connection reference in Layout XL
; 2/25/24
load "~/SKILL/utils/toggle_group.il" ; CTRL-G toggles group/ungroup in Layout
; 9/25/24
hiSetBindKey("vivaGraph" "Shift <Key>r" "_vivaAddSubwindow(\"rectangular\")") ; add a subwindow with SHIFT+R
; 6/9/25
hiSetBindKey( "Symbol" "<Key>n" "schHiCreateNoteShape( ?shape \"line\" ?style \"solid\" ?width 0)") ; Creates a solid line note shape
; 6/13/25
hiSetBindKey("Schematics" "<Key>F5" "hiDeiconifyWindow(window(1)) && hiRaiseWindow(window(1))") ; focus CIW
; 8/11/25
hiSetBindKey("Virtuoso XL" "Ctrl Shift <Key>i" "lxHiCreateInstFromSch()") ; in layout XL - import selected from schematic
; 8/29/25
hiSetBindKey( "vivaGraph" "Shift <key>m" "vvExecuteAction(\"moveTracesNewStrip\")") ; move the selected trace to a new strip
; 12/19/25
hiSetBindKey("Schematics" "Ctrl Alt Shift <Key>x" "descend_lowest_itrnum()")
