toggler=0
sch_grid_togl=0
tb_toggle=0
load_all_bindkeys=t ; if you are someone else, then change this :)
simCellTbl = makeTable( "" nil )


load("~/SKILL/utils/toglInstObjFil.il")
load("~/SKILL/CCS/CCSToggleSelectMode.il")
load("~/SKILL/CCS/CCSsuppressDispForm.il")
load("~/SKILL/utils/killPinAnnotate.il")
;load("~/SKILL/utils/toolbarToggle.il") ; 7/12/18
load("~/SKILL/CCS/LSW.il")
load("~/SKILL/utils/sch_grid_togl.il")
load("~/SKILL/CCS/CCSchangeWireWidth.il")
load("~/SKILL/CCS/CCSExportOutputs.il")
load("~/SKILL/utils/vivaGridToggle.il")
load("~/SKILL/CCS/CCSrectSelect.il")
load("~/SKILL/CCS/CCSOffCdsTermNetNames.il")
load("~/SKILL/CCS/CCSSnapToGrid.il") ; Sameer
; load("~/SKILL/CCS/CSComposerGridSnap.il")
load("~/SKILL/utils/hiSelectSymPins.il")
load("~/SKILL/utils/updatePinLabels.il")
load("~/SKILL/utils/MYappendSignal.il")
load("~/SKILL/utils/MYappendAllSignal.il")
load("~/SKILL/utils/updateSnapSpacing.il")

load("~/SKILL/utils/CCSDescend.il")
; 6/27/18
load("~/SKILL/utils/newDescend.il")

load("~/SKILL/utils/CCSkey.il")
load("~/SKILL/utils/CCSrestoreDefaultWireColors.il")
load("~/SKILL/utils/awvGrid.il")
load("~/SKILL/utils/applify.il")
; load("~/SKILL/utils/sch_print_L.il")
load("~/SKILL/utils/MYappendDCSignal.il")
load("~/SKILL/utils/MYdescend.il")
load("~/SKILL/utils/hiReturn.il")

load("~/SKILL/CCS/CCSMarkerForm.il")

; 11/16/16
hiSetBindKey("Schematics" "Ctrl<Key>7" "MYappendDCSignal()")

; 7/19/16
hiSetBindKey("Layout" "Alt <Key>1" "pteSetVisible(\"MET1 drawing\" !pteIsVisible(\"MET1 drawing\" \"Layers\") \"Layers\")" )
hiSetBindKey("Layout" "Alt <Key>2" "pteSetVisible(\"MET2 drawing\" !pteIsVisible(\"MET2 drawing\" \"Layers\") \"Layers\")" )
hiSetBindKey("Layout" "Alt <Key>3" "pteSetVisible(\"MET3 drawing\" !pteIsVisible(\"MET3 drawing\" \"Layers\") \"Layers\")" )
hiSetBindKey("Layout" "Alt <Key>4" "pteSetVisible(\"MET4 drawing\" !pteIsVisible(\"MET4 drawing\" \"Layers\") \"Layers\")" )
hiSetBindKey("Layout" "Alt <Key>t" "pteSetVisible(\"TEXT drawing\" !pteIsVisible(\"TEXT drawing\" \"Layers\") \"Layers\")" )
hiSetBindKey("Layout" "Alt <Key>0" "pteToggleAllVisible( \"Layers\" hiGetCurrentWindow() )" )
hiSetBindKey("Layout" "Alt <Key>9" "pteToggleAllVisible( \"Objects\" hiGetCurrentWindow() )" )
hiSetBindKey("Layout" "Alt <Key>p" "pteSetVisible(\"POLY drawing\" !pteIsVisible(\"POLY drawing\" \"Layers\") \"Layers\")" )
;10/17/17
hiSetBindKey("Layout" "Alt <Key>a" "pteSetVisible(\"PACT drawing\" !pteIsVisible(\"PACT drawing\" \"Layers\") \"Layers\")" )




; 7/15/16 ; upgraded 9/12/18 scroll down ; thanks Parul Sharma
; hiSetBindKey("Schematics" "Ctrl<Key>n" "schHiCreateInst(\"basic\" \"noConn\" \"symbol\")")


; 7/5/16 Likesh Sahoo
load("~/SKILL/CCS/CCSLibManSelectInst.il")
; contains Ctrl Alt<key>s

; load("~/SKILL/CCS/CheckNetSet.il")
load("~/SKILL/utils/schIncreasePinSpacing.il")


; 4/22/2014 atl v chelsea : grid
hiSetBindKey("Schematics" "Ctrl<Key>F10" "sch_grid_togl()")

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
hiSetBindKey("Schematics" "Shift <Key>w" "schHiCreateWire(schGetEnv(\"defWideWireWidth\"))")

; 5/21/16
;;;;;hiSetBindKey("vivaGraph" "Ctrl<Key>d" "_vivaDeleteAll()") ; reassigned - since Cadence already gives you 'e' for this

; 5/20/16
hiSetBindKey("Schematics" "Alt <Key>2" "schHiOpenSymbolOrSchematicView(geGetEditCellView() hiGetCurrentWindow())")
hiSetBindKey("Symbol" "Alt <Key>2" "schHiOpenSymbolOrSchematicView(geGetEditCellView() hiGetCurrentWindow())")
; 5/17/16
hiSetBindKey("Schematics" "Ctrl <Key>F1" "deToggleAssistants()")
; 7/12/18 -- didn't know they had put this in
hiSetBindKey("Schematics" "Ctrl <Key>F2" "deToggleToolbars()")
hiSetBindKey("vivaGraph" "Ctrl<Key>F2" "deToggleToolbars()")
; also, ViVa actions are not captured to CIW!!

hiSetBindKey("Schematics" "Ctrl<Key>+" "schIncreasePinSpacing(\"+\")") ; 10/19/2013
hiSetBindKey("Schematics" "Ctrl<Key>-" "schIncreasePinSpacing(\"-\")") ; 10/19/2013
hiSetBindKey("Schematics" "Ctrl<Key>KP_Add" "schIncreasePinSpacing(\"+\")") ; 10/19/2013
hiSetBindKey("Schematics" "Ctrl<Key>KP_Subtract" "schIncreasePinSpacing(\"-\")") ; 10/19/2013

hiSetBindKey("Schematics" "Ctrl<Key>q" "CCSAddCustomOutputs()") ; 9/9/2013 Praveena Vejandla

hiSetBindKey("vivaGraph" "Ctrl<Key>g" "vivaGridToggle()")
hiSetBindKey("vivaGraph" "Alt<Key>e" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"graphPrint\")")

hiSetBindKey("Schematics" "Alt<Key>z" "CCSrectSelect()")    ; ankush gupta
; hiSetBindKey("Schematics" "Alt<Key>q" "CCSOffCdsTermNetNames()")    ; sameer
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
"mapcar(lambda((obj) obj->font = or(cadr(member(obj->font '( \"fixed\"   \"roman\"  \"stick\" ))) \"fixed\")) setof(obj geGetSelSet() obj->objType == \"label\") )")


; for Vikas
load("~/SKILL/CCS/zoom_kais.il")
; 1/31/2013 - moved zoomInst here after glitch today.. need CCSclip
load("~/SKILL/utils/zoomInst.il")


; 8/23/2013
hiSetBindKey("Symbol" "Ctrl <Key>l" "squarePinsToLine()")
hiSetBindKey("Symbol" "Ctrl <Key>p" "hiSelectSymPins()")

; 10/19/2012
hiSetBindKey("Symbol" "Ctrl Alt<Key>a" "applify()")

; 10/4/2012 9/18/18 Sameer Garg - not Escape, use Escape EF
;hiSetBindKey("Schematics" "<Key>Escape EF" "{getLastInstInfo() hiFormCancel(geCommonFindMarkerForm) hiFormCancel(schObjPropForm) cancelEnterFun()}")
hiSetBindKey("Schematics" "<Key>Escape EF" "{getLastInstInfo() cancelEnterFun()}")

; move in the Calculator buffer - only tested in IC5.. 11/23/2012
; hiSetBindKey("awv" "<Btn4Down>" "_dwtCalCalcInput( 'up )")
; hiSetBindKey("awv" "<Btn5Down>" "_dwtCalCalcInput( 'dwn )")

; 11/14/2012
; hiSetBindKey("awv" "Ctrl<Key>d" "{drLoadDrf(buildString( list( pwd() \"display.drf_L1\") \"/\" )  ) awvRedrawWindowMenuCB()}" )
; hiSetBindKey("awv" "Ctrl<Key>t" "{drLoadDrf(buildString( list( pwd() \"display.drf_thickLine\") \"/\" )  ) awvRedrawWindowMenuCB()}" )

; 9/27/12; 2/14/17 changed from L1 to dashed
hiSetBindKey("Schematics" "Ctrl<Key>d" "{drLoadDrf(buildString( list( pwd() \"display.drf_dashed\") \"/\" )  ) hiRedraw()}" )
hiSetBindKey("Schematics" "Ctrl<Key>t" "{drLoadDrf(buildString( list( pwd() \"display.drf_thickLine\") \"/\" )  ) hiRedraw()}" )
; 11/4/14
hiSetBindKey("Schematics" "Ctrl<Key>l" "{drLoadDrf(buildString( list( pwd() \"display.drf_pwrplot\") \"/\" )  ) hiRedraw()}" )
hiSetBindKey("Layout" "Ctrl<Key>l" "{drLoadDrf(buildString( list( pwd() \"display.drf_pwrplot\") \"/\" )  ) hiRedraw()}" )

; 2/15/17
hiSetBindKey("Schematics" "Ctrl Shift<Key>b" "{drLoadDrf(buildString( list( pwd() \"display.drf_blink\") \"/\" )  ) hiRedraw()}" )
hiSetBindKey("Layout" "Ctrl Shift<Key>b" "{drLoadDrf(buildString( list( pwd() \"display.drf_blink\") \"/\" )  ) hiRedraw()}" )

; increase/ decrease wire thickness with ALT - scrollwheel
; hiSetBindKey("Schematics" "Alt<Btn4Down>" "geGetSelSet()~>width = car(geGetSelSet()~>width)*1.25")
; hiSetBindKey("Schematics" "Alt<Btn5Down>" "geGetSelSet()~>width = car(geGetSelSet()~>width)*0.8")
hiSetBindKey("Schematics" "Alt<Btn4Down>" "inc_wire_inst(1.25)")
hiSetBindKey("Schematics" "Alt<Btn5Down>" "inc_wire_inst(0.8)")


hiSetBindKey("Schematics" "Ctrl<Key>r" "schHiReplace()")
hiSetBindKey("Symbol" "Ctrl<Key>r" "schHiReplace()")

; hiSetBindKey("Schematics" "<Key>1" "load(\"~/SKILL/utils/op_info.il\")")
; what served me so well for so long:)
hiSetBindKey("Schematics" "<Key>1" "sevPrintResults(sevSession(hiGetCurrentWindow()) 'dcOpPoints)")
hiSetBindKey("Schematics" "<Key>2" "CCSkey() awviPUpdateMenuCB()")
; 10/2/18
hiSetBindKey("Schematics" "<Key>3" "{CCSkey() if( rexMatchp( \"Results\" hiGetWindowName( hiGetCurrentWindow() ) ) awviClosePrintWindowMenuCB() )}")
hiSetBindKey("Schematics" "Alt<Key>s" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"splitStrip\")")

; moving to 6.1.6
; hiSetBindKey("Schematics" "<Key>-" "_dwtCalCalcInput( 'subtract )")
hiSetBindKey("Schematics" "<Key>-" "calCalcInput( 'subtract )")

hiSetBindKey("Schematics" "<Key>4" "_vivaStartSelectSignalMode( \"VT\" )")
hiSetBindKey("Schematics" "<Key>7" "_vivaStartSelectSignalMode( \"VS\" )")
hiSetBindKey("Schematics" "Alt<Key>4" "_vivaStartSelectSignalMode( \"IT\" )")
hiSetBindKey("Schematics" "Alt<Key>7" "_vivaStartSelectSignalMode( \"IS\" )")

; hiSetBindKey("Schematics" "Ctrl<Key>4" "_amsaDirectPlot( sevSession(hiGetCurrentWindow()) 'asiiPlotTranSignalCB)")
; after de post aus Andrew Beckett
; ; hiSetBindKey("Schematics" "Ctrl<Key>4" "load(\"~/SKILL/utils/direct_plot.il\")")
hiSetBindKey("Schematics" "Ctrl<Key>4" "MYappendSignal()")
hiSetBindKey("Schematics" "Shift<Key>4" "explAppendSignal()")	; 12/8/22

; Checking for ver 6
if( rexMatchp( "IC6" cadr(parseString(getVersion(t))) )
    then
hiSetBindKey("Schematics" "<Key>5" "_vvCalculatorPlot(_vivaGetSessionName())" )
hiSetBindKey("vivaGraph" "<Key>5" "_vvCalculatorPlot(_vivaGetSessionName())" )
hiSetBindKey("Schematics" "Shift<Key>Up" "schHiFontUpdate(?increase t)")
hiSetBindKey("Schematics" "Shift<Key>Down" "schHiFontUpdate(?increase nil)")
hiSetBindKey("Symbol" "Shift<Key>Up" "schHiFontUpdate(?increase t)")
hiSetBindKey("Symbol" "Shift<Key>Down" "schHiFontUpdate(?increase nil)")
    else
hiSetBindKey("Schematics" "<Key>5" "_dwtCaliPlotCB( ?erase nil )" )
hiSetBindKey("Schematics" "Shift<Key>Up" "geGetSelSet()~>height = car(geGetSelSet()~>height)*1.25")
hiSetBindKey("Schematics" "Shift<Key>Down" "geGetSelSet()~>height = car(geGetSelSet()~>height)*0.8")
hiSetBindKey("Symbol" "Shift<Key>Up" "geGetSelSet()~>height = car(geGetSelSet()~>height)*1.25")
hiSetBindKey("Symbol" "Shift<Key>Down" "geGetSelSet()~>height = car(geGetSelSet()~>height)*0.8")
) ; if

; hiSetBindKey("Schematics" "<Key>6" "load(\"~/SKILL/utils/annotOp.il\")")
hiSetBindKey("Schematics" "<Key>6" "sevAnnotateResults(sevSession(hiGetCurrentWindow()) 'dcOpPoints)")
hiSetBindKey("Schematics" "Alt<Key>6" "sevAnnotateResults(sevSession(hiGetCurrentWindow()) 'dcNodeVoltages)")
; may 7 2014 after using isr6 for the first time 
; hiSetBindKey("Schematics" "Ctrl<Key>6" "sevAnnotateResults(sevSession(hiGetCurrentWindow()) 'defaults)")
hiSetBindKey("Schematics" "Ctrl<Key>6" "killPinAnnotate()")
hiSetBindKey("Schematics" "<Key>9" "geEnterAddNetProbe()")
hiSetBindKey("Layout" "<Key>9" "leHiMarkNet()")
;hiSetBindKey("Schematics" "<Key>0" "geDeleteAllProbe(getCurrentWindow() t)")
; 12/16/19
hiSetBindKey("Schematics" "<Key>0" "{geDeleteAllProbe(getCurrentWindow() t) geDeleteAllHilightSet( geGetWindowCellView() )}")
hiSetBindKey("Layout" "<Key>0" "leHiUnmarkNetAll()")
hiSetBindKey("Schematics" "<Key>8" "geDeleteNetProbe()")
hiSetBindKey("Layout" "<Key>8" "leHiUnmarkNet()")
hiSetBindKey("Layout" "Alt<Key>x" "lxHiProbe()")
hiSetBindKey("Schematics" "Ctrl<Key>w" "hiCloseWindow(getCurrentWindow())")
hiSetBindKey("Schematics" "Alt<Key>w" "sevOpenPlotWindow(sevSession(getCurrentWindow()))" )
hiSetBindKey("Schematics" "Alt<Key>b" "load(\"~/SKILL/utils/sch_print.il\")")
hiSetBindKey("Schematics" "Ctrl<Key>b" "load(\"~/SKILL/utils/sch_print_L.il\")")
; hiSetBindKey("Schematics" "Ctrl<Key>b" "sch_print_L()")
hiSetBindKey("Schematics" "Alt<Key>r" "{CCSrestoreDefaultWireColors() schZoomFit(1.0 0.9)}")


hiSetBindKey("Schematics" "<Key>e"  "MYdescend(1)")
hiSetBindKey("Schematics" "Ctrl<Key>x" "MYdescend(0)")
; worked with Sanjeev of CCS
; hiSetBindKey("Schematics" "Ctrl<Key>x" "load(\"~/SKILL/utils/descendSchNew.il\")")
; hiSetBindKey("Schematics" "Alt<Key>x" "load(\"~/SKILL/utils/descendSch.il\")")
; above now used for full path hierarchical descending..

; hiSetBindKey("Schematics" "Alt<Key>d" "zoomInst()")
; 1/31/2013 :(
hiSetBindKey("Schematics" "Alt<Key>d" "CCSclip() hiRegTimer(\"zoomInst(CLIPDATA)\" 10)")

hiSetBindKey("Schematics" "Alt<Key>x" "hierDescend(parseString(hierPath \"/\"))")
hiSetBindKey("Schematics" "Ctrl<Key>y" "load(\"~/SKILL/utils/descendSym.il\")")
hiSetBindKey("Schematics" "Alt<Key>e" "{hierPath=geGetInstHier(hiGetCurrentWindow()) schHiReturnToTop()}")
hiSetBindKey("Schematics" "Alt<Key>g" "CCSSnapToGrid()")
hiSetBindKey("Symbol" "Alt<Key>g" "CCSSnapToGrid()")
hiSetBindKey("Schematics" "Ctrl<Key>e" "MYReturn()")
hiSetBindKey("Schematics" "Ctrl<Key>v" "load(\"~/SKILL/utils/descendVA.il\")")
;hiSetBindKey("Schematics" "<Key>j" "sevPrintResults('sevSession1 'dcOpPoints)")
hiSetBindKey("Schematics" "Ctrl<Key>Up" "updatePinLabels(1.2)")
hiSetBindKey("Schematics" "Ctrl<Key>Down" "updatePinLabels(0.8)")
hiSetBindKey("Schematics" "Alt<Key>Up" "updateSnapSpacing(2)")
hiSetBindKey("Schematics" "Alt<Key>Down" "updateSnapSpacing(0.5)")
hiSetBindKey("Symbol" "Alt<Key>Up" "updateSnapSpacing(2)")
hiSetBindKey("Symbol" "Alt<Key>Down" "updateSnapSpacing(0.5)")
hiSetBindKey("Symbol" "Ctrl<Key>Up" "updatePinLabels(1.25)")
hiSetBindKey("Symbol" "Ctrl<Key>Down" "updatePinLabels(0.8)")
hiSetBindKey("Symbol" "Alt<Key>e" "{hierPath=geGetInstHier(hiGetCurrentWindow()) schHiReturnToTop()}")

hiSetBindKey("Schematics" "<Key>k" "sevDirectPlot(sevSession(hiGetCurrentWindow()) 'asiDirectPlotResultsMenuCB)")
; "load(\"~/SKILL/utils/result_plot_mform.il\")")
; eliminated that file load thing on 1/31/2013
hiSetBindKey("Schematics" "<Key>j" "_noiseSummaryPrintMenuCB('((noise noise) (pnoise pnoise)) sevSession(hiGetCurrentWindow())" )
; "load(\"~/SKILL/utils/noise_info.il\")")
; eliminated that file load thing on 1/31/2013
hiSetBindKey("Schematics" "Alt<Key>c" "sevOpenCalculator()")
; hiSetBindKey("awv" "Alt<Key>s" "awviSwitchAxisModeCB()" )
hiSetBindKey("Schematics" "Ctrl<Key>2" "schHiChangeEditMode(\"a\")")
hiSetBindKey("Schematics" "Ctrl Shift<Key>2" "schHiChangeEditMode(\"r\")")
hiSetBindKey("Layout" "Ctrl<Key>2" "_leChangeEditMode(\"a\")")
hiSetBindKey("Symbol" "Ctrl<Key>2" "schHiChangeEditMode(\"a\")")
hiSetBindKey("Schematics" "Alt<Key>f" "schHiFind()")
hiSetBindKey("Symbol" "Alt<Key>f" "schHiFind()")
hiSetBindKey("Schematics" "Alt<Key>i" "load(\"~/SKILL/utils/findInst.il\")")
hiSetBindKey("Schematics" "Alt<Key>n" "load(\"~/SKILL/utils/findNet.il\")")
hiSetBindKey("Symbol" "Ctrl<Key>w" "hiCloseWindow(getCurrentWindow())")
hiSetBindKey("Symbol" "Shift<Key>x" "schHiVICAndSave()")
hiSetBindKey("Symbol" "Ctrl<Key>e" "MYReturn()")
; hiSetBindKey("awv" "<Key>u" "awvUpdateWindowMenuCB()")
; hiSetBindKey("awv" "Ctrl<Key>u" "awvUndoMenuCB()")
; hiSetBindKey("awv" "<Key>5" "_dwtCaliPlotCB( ?erase nil )" )
; hiSetBindKey("awv" "<Key>r" "{ awvResetWindowMenuCB() awviSwitchAxisModeCB()}")
; ;hiSetBindKey("awv" "Ctrl<Key>x" "awvXAxisMenuCB()")
; hiSetBindKey("awv" "Ctrl<Key>w" "awvCloseWindowMenuCB()")
; hiSetBindKey("awv" "Ctrl<Key>o" "awvAxesOptionMenuCB()")
hiSetBindKey("Show File" "Ctrl<Key>w" "hiEditFileQuitTrigger(-1 0)")
hiSetBindKey("Schematics" "<Key>t" "_noiseSummaryPrintMenuCB('((noise noise) (pnoise pnoise)) 'sevSession1)")
; hiSetBindKey("awv" "Ctrl<Key>g" "myAwvToggleGrid()")
; hiSetBindKey("awv" "<Key>s" "awvSubwindowMenuCB()")
; ; ; hiSetBindKey("awv" "Ctrl<Key>e" "load(\"~/SKILL/utils/awv_print.il\")") ; removed 11/7/2012
; hiSetBindKey("awv" "Ctrl<Key>b"
; "load(\"~/SKILL/utils/awv_print_gv.il")")
; hiSetBindKey("awv" "Ctrl<Key>e" "load(\"~/SKILL/utils/awv_print_gv_L.il\")")
; hiSetBindKey("awv" "Ctrl<Key>x" "load(\"~/SKILL/utils/awv_x_log.il\")")
; ; ; hiSetBindKey("awv" "Ctrl<Key>t" "load(\"~/SKILL/utils/awv_x_auto.il\")") ; 11/14/2012
; hiSetBindKey("awv" "<Key>c" "sevOpenCalculator()")

hiSetBindKey("Read veriloga" "Ctrl<Key>w" "schHdlCloseWindow( getCurrentWindow() nil)")
hiSetBindKey("Read veriloga" "Ctrl<Key>e" "schHDLReturn()")

hiSetBindKey("Verilog-AMS" "Ctrl<Key>w" "schHdlCloseWindow( getCurrentWindow() nil)")
hiSetBindKey("Verilog-AMS" "Ctrl<Key>e" "schHDLReturn()")

hiSetBindKey("systemVerilog" "Ctrl<Key>e" "schHDLReturn()")

; hiSetBindKey("Command Interpreter" "Alt<Key>l" "mxOpenLibManager")
hiSetBindKey("Read HDL" "Ctrl<Key>w" "schHdlCloseWindow( getCurrentWindow() nil)")
; hiSetBindKey("analogArtist-Simulation" "<Key>c" "sevOpenCalculator()")
; above doesn't work

; Mark Summers 
hiSetBindKey("Schematics" "<Key>q" "hiSetFormSize(schObjPropForm list(500 1000)) schHiObjectProperty()")

; Sanjeev - to ensure that IC6 behaves like IC5 - my follow on email to 42806692
hiSetBindKey("Schematics" "None<Btn1Down>(2)" "schExtendSelectPt()")

; property form from S Pradeep Raja
load("~/SKILL/CCS/CCSpbSchObjProp.il")

; 7/26/16 from Likesh Sahoo - select all of a wire with only one segment already selected
hiSetBindKey( "Schematics" "Ctrl Alt<Key>w" "geSelectFigs( car(geGetSelSet()~>net~>figs) )" )

load("~/SKILL/utils/lcPinNames.il")
hiSetBindKey( "Schematics" "Ctrl Alt<Key>5" "lcPinNames( 1 )" )
hiSetBindKey( "Symbol" "Ctrl Alt<Key>5" "lcPinNames( 1 )" )
load("~/SKILL/utils/lcLabels.il")
hiSetBindKey( "Schematics" "Ctrl Alt<Key>6" "lcLabels( )" )
; 8/1/16
load("~/SKILL/utils/symIncreasePinSpacing.il")
hiSetBindKey("Symbol" "Ctrl<Key>+" "symIncreasePinSpacing(1)") 
hiSetBindKey("Symbol" "Ctrl<Key>-" "symIncreasePinSpacing(-1)")
hiSetBindKey("Symbol" "Ctrl<Key>KP_Add" "symIncreasePinSpacing(1)") 
hiSetBindKey("Symbol" "Ctrl<Key>KP_Subtract" "symIncreasePinSpacing(-1)") 

hiSetBindKey( "Schematics" "Ctrl Shift<Key>s" "saved_sel = geGetSelSet()" )
hiSetBindKey( "Schematics" "Ctrl Shift<Key>l" "foreach( obj saved_sel geSelectObject(obj) )" )

; 9/1/16
; hiSetBindKey( "Schematics" "Ctrl Shift<Key>x" "geHiDeleteAllMarker()" )
; 10/28/17
hiSetBindKey( "Schematics" "Ctrl Shift<Key>x" "geDeleteAllMarker( geGetEditCellView())" )

; 9/3/16
load( "~/SKILL/utils/pinName2ClipBoard.il" )
hiSetBindKey( "Schematics" "Ctrl Shift<Key>c" "pinName2ClipBoard()" )

; 9/5/16 , 10/3/16
load "~/SKILL/utils/createOrSelPins.il"
hiSetBindKey( "Schematics" "Ctrl Shift<Key>p" "createOrSelPins()" )
hiSetBindKey( "Symbol" "Ctrl Shift<Key>p" "schHiSelectByProperty( \"select\" \"pinName\" \"==\" \"*\" )" )

load( "~/SKILL/utils/horizontalize.il" )
hiSetBindKey( "Symbol" "Ctrl Shift<Key>h" "horizontalize()" )
hiSetBindKey( "Schematics" "Ctrl Shift<Key>h" "horizontalize()" )

load( "~/SKILL/utils/roundPinsToLine.il" )
load( "~/SKILL/utils/squarePinsToLine.il" )
load( "~/SKILL/utils/arrows.il" )

; 9/9/16
load "~/SKILL/utils/zoomText.il"
hiSetBindKey( "Schematics" "Ctrl Alt<Key>d" "zoomText()" )

; 9/12/16
load "~/SKILL/utils/toglImportSplitRseg.il"

; 9/30/16; 10/7/16
load "~/SKILL/utils/MYflip.il"
hiSetBindKey( "Schematics" "Ctrl <Key>h" "MYflip(1)" )
hiSetBindKey( "Schematics" "Ctrl <Key>u" "MYflip(0)" )
hiSetBindKey( "Symbol" "Ctrl <Key>h" "MYflip(1)" )
hiSetBindKey( "Symbol" "Ctrl <Key>u" "MYflip(0)" )

; 10/3/16
load "~/SKILL/utils/selSimilar.il"
hiSetBindKey( "Schematics" "Ctrl Alt<Key>h" "selSimilar()" )
hiSetBindKey( "Layout" "Ctrl Alt<Key>h" "selSimilar()" )

; 10/7/16
load("~/SKILL/utils/inc_bus.il")
load("~/SKILL/utils/inc_wire_inst.il")

load("~/SKILL/utils/fl_nodes.il")
load("~/SKILL/utils/getWinNum.il")

; 11/29/16 after Bhupendra Kumar helped out..
load "~/SKILL/utils/selectInTableView.il"
hiSetBindKey( "Schematics" "Ctrl <Key>i" "heHiEditConfig() selectInTableView()" )


; 1/26/17
load "~/SKILL/utils/listInstPaths.il"
hiSetBindKey( "Schematics" "Ctrl Alt<Key>l" "listInstPaths()" )

; 2/8/17
load "~/SKILL/utils/toglInstMstrDisplay.il"
hiSetBindKey( "Layout" "Ctrl Alt<Key>d" "toglInstMstrDisplay()" )

; 2/15/17
load "~/SKILL/utils/setInstNamePrefix.il"

; 3/1/17
load "~/SKILL/utils/removeColors.il"
hiSetBindKey( "Schematics" "<Key>F7" "removeColors()" )
hiSetBindKey( "Schematics" "Ctrl <Key>F7" "geResetCellView(deGetCellView())" )

; 3/14/17
hiSetBindKey( "Schematics" "Alt <Key>Q" "schHiSelectByProperty(\"select\")" )

; 3/21/17
load "~/SKILL/utils/fixPartName.il"
hiSetBindKey( "Symbol" "Ctrl Alt<Key>C" "fixPartName()" )

; 4/3/17
load "~/SKILL/utils/openSelReadOnly.il" ; Ctrl Shift<Key>n

; 5/18/17
hiSetBindKey("Schematics" "Alt Shift<Key>h" "heHiEditConfig()")

; 11/11/17
hiSetBindKey( "Schematics" "Ctrl <Key>c" "schHiCreateNoteShape( ?shape \"ellipse\" ?style \"dashed\")" )

; 1/3/17
hiSetBindKey("Layout" "Alt <Key>v" "pteSetVisible(\"Vias\" !pteIsVisible(\"Vias\" \"Objects\") \"Objects\")" )

; 3/20/18
hiSetBindKey("Schematics" "Alt Shift<Key>d" "MYappendTranDiff()")

; 5/2/18
load "~/SKILL/utils/renameInsts.il"
hiSetBindKey("Schematics" "Ctrl Alt<Key>i" "renameInsts()")

;7/30/18
load "~/SKILL/utils/txpose_bus.il"
load "~/SKILL/utils/txpose_inst_label.il"
; 1/11/20
;hiSetBindKey("Schematics" "Alt Shift<Btn4Down>" "txpose_inst_label('t)")
;hiSetBindKey("Schematics" "Alt Shift<Btn5Down>" "txpose_inst_label(nil)")

; 7/12/18
hiSetBindKey( "Schematics" "Shift <Key>r" "schHiCreateNoteShape( ?shape \"rectangle\" ?style \"solid\")" )
hiSetBindKey( "Schematics" "Shift <Key>q" "schHiCreateNoteShape( ?shape \"polygon\" ?style \"solid\")" )

; 6/1/16 and 7/12/18
hiSetBindKey( "Schematics" "<Key>n" "schHiCreateNoteShape( ?shape \"line\" ?style \"solid\" ?width 0)")

; 7/26/18
hiSetBindKey("Schematics" "Alt Shift <Key>q" "load( \"~/SKILL/utils/sch_prop_all_sel.il\" )" )
hiSetBindKey("Schematics" "<Key>q" "load( \"~/SKILL/utils/sch_prop_only_current.il\" )" )

; 8/25/18
load "~/SKILL/utils/CreateLibManSelInst.il"
hiSetBindKey("Schematics" "Ctrl Alt <Key>n" "CreateLibManSelInst()" )
; 8/13/19
hiSetBindKey("Layout" "Ctrl Alt <Key>n" "CreateLibManSelInst()" )

MYLIB= ""
MYCELL= ""
MYVIEW= ""
	
if( load_all_bindkeys 
then
	println("Loading additional bindkeys")
	; 9/12/18 ; Parul Sharma
	hiSetBindKey("Schematics" "Ctrl <Key>n" "{ MYLIB=schCreateInstForm->libraryName->value \
	MYCELL=schCreateInstForm->cellName->value MYVIEW=schCreateInstForm->viewName->value \
	schHiCreateInst(\"basic\" \"noConn\" \"symbol\") }")


	hiSetBindKey("Schematics" "<Key>i" "{ if( MYLIB && MYCELL && MYVIEW then \
	if( MYCELL != \"noConn\" then \
	println(\"Not noConn\") \
	schCreateInstForm->libraryName->value=MYLIB \
	schCreateInstForm->cellName->value=MYCELL \
	schCreateInstForm->viewName->value=MYVIEW schHiCreateInst() else schHiCreateInst() \
	) ) }" \
	)
	; one has to use the Ctrl-n bindkey after the first 'i' bindkey usage until I figure out a better way :)
)

; 9/14/18 thanks Sameer Garg
load "~/SKILL/utils/getLastInstInfo.il"

; 9/16/18
load "~/SKILL/utils/subJumpBack.il"
hiSetBindKey( "Schematics" "Ctrl Alt <Key>e" "subJumpBack()" )

; 9/19/18
load "~/SKILL/utils/libManSelectTB.il"
; contains CTRL-ALT-T to locate testbench

; 09/28/18
load "~/SKILL/utils/copyResVal.il"
hiSetBindKey("Schematics" "Ctrl Alt<Key>r" "copyResVal()")

;10/31/18
hiSetBindKey("vivaGraph" "Ctrl<Key>d" "and(setq(sessionName awvGetCurrentWindow()->vivaSession) awvCloseWindow(awvGetCurrentWindow()))")

;11/09/18
hiSetBindKey("Schematics" "Ctrl Shift<Key>o" "{selectResults('dcOpInfo) report(?output \"param.txt\" ?format \"spice\")}")

;12/20/18 ; 01/23/19
load "~/SKILL/utils/genNetlist.il"
hiSetBindKey("Schematics" "Alt Shift<Key>n" "genNetlist()")

;01/02/19
hiSetBindKey("Schematics" "Alt Shift<Key>l" "ddsOpenLibManager()")

;01/21/19
hiSetBindKey("Schematics" "Ctrl Alt <Key>q" "sevQuit(sevSession(hiGetCurrentWindow()) )")

;02/18/19
load "~/SKILL/utils/incrText.il"
hiSetBindKey( "Schematics" "Ctrl <Key>PageUp" "incrText( 1 )" )
hiSetBindKey( "Schematics" "Ctrl <Key>PageDown" "incrText( -1 )" )

;03/10/19
load "~/SKILL/utils/loadLatestRun.il"
hiSetBindKey( "Schematics" "Ctrl Shift<Key>R" "loadLatestRun()" )

;07/01/19
load "~/SKILL/utils/togl_ViVA_Browser.il"
hiSetBindKey("vivaGraph" "Ctrl<Key>b" "togl_ViVA_Browser()")

;07/09/19
load "~/SKILL/utils/rePlotOverlay.il"
hiSetBindKey("Schematics" "Alt Shift <Key>p" "rePlotOverlay()")

; 7/31/19 -- THanks Edwin of Perforce (IC Manage )
load "~/SKILL/utils/ICM_libManSelectInst.il"

; 10/9/19
load "~/SKILL/utils/putViewName.il" 
hiSetBindKey( "Schematics" "Ctrl Shift<Key>s" "putViewName()" )

; 1/11/20
load "~/SKILL/utils/proc_alt_sh_scroll.il"
load "~/SKILL/utils/updateTemp.il"
hiSetBindKey("Schematics" "Alt Shift<Btn4Down>" "proc_alt_sh_scroll_up()")
hiSetBindKey("Schematics" "Alt Shift<Btn5Down>" "proc_alt_sh_scroll_down()")

; 2/7/20
; load "~/SKILL/utils/viva_condense.il"	; don't know what this does seems useless :)
; hiSetBindKey("vivaGraph" "Alt Shift<Key>e" "viva_condense()")

; 3/11/2020
load "~/SKILL/utils/list_pins.il"

; 8/6/2020
hiSetBindKey("vivaGraph" "Alt Shift<Key>s" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"moveTracesNewStrip\")")

; 8/9/2020
load "~/SKILL/utils/getPlotsAsText.il"
hiSetBindKey("Schematics" "Alt Shift<Key>w" "getPlotsAsText()")
load "~/SKILL/utils/plotTextWaves.il"
hiSetBindKey("Schematics" "Ctrl Shift<Key>w" "plotTextWaves()")

hiSetBindKey("Schematics" "Alt <Key>s" "_schHiSave()")

load "~/SKILL/utils/tag_labels.il"
hiSetBindKey("Schematics" "Ctrl Alt<Key>_" "tag_labels()") ; ; underscore meaningful name nets side by side test-bench helper

load "~/SKILL/utils/toglOnlyWireLblSel.il"
hiSetBindKey("Schematics" "Ctrl Shift<Key>w" "toglOnlyWireLblSel()")

load "~/SKILL/utils/HEDoffTopCellGlobalBindings.il"
hiSetBindKey("Cadence Hierarchy Editor" "Ctrl <Key>1" "HEDoffTopCellGlobalBindings()" )
hiSetBindKey("Schematics" "Ctrl <Key>1" "HEDoffTopCellGlobalBindings()" )

load "~/SKILL/utils/smartIncPinSpace.il"
hiSetBindKey("Schematics" "Ctrl Shift<Key>]" "smartIncPinSpace(\"+\")") ; 5/30/21
hiSetBindKey("Schematics" "Ctrl Shift<Key>[" "smartIncPinSpace(\"-\")") ; 5/30/21

hiSetBindKey( "vivaGraph" "Ctrl Shift<Key>d" "awvDeleteSubwindow( awvGetCurrentWindow() )")

; 9/2/21
load "~/SKILL/utils/delDashEllipse.il"
hiSetBindKey( "Schematics" "Ctrl Shift<Key>d" "delDashEllipse() ")

; 9/29/21
hiSetBindKey( "Schematics" "Ctrl Alt Shift<Key>r" "sevRunEngine( sevSession(hiGetCurrentWindow() ) )")

; 3/10/22
load "~/SKILL/utils/toggleCase.il"
hiSetBindKey( "Schematics" "Ctrl Alt<Key>c" "toggleCase()" )

; 3/28/22 after Lalit tells me they did modify to ignore the don't-confirm setting between ISR16 and 23
hiSetBindKey("vivaGraph" "<Key>e" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"deleteObjects\") ")

; 4/12/22 toggle net highlighting
load "~/SKILL/utils/togl_net_hilite.il"
hiSetBindKey( "Schematics" "Ctrl Alt Shift<Key>d" "togl_net_hilite()" )

; 5/16/22  was geHiDeleteMarker()
hiSetBindKey("Schematics" "Ctrl <Key>g" "{ MYLIB=schCreateInstForm->libraryName->value \
MYCELL=schCreateInstForm->cellName->value MYVIEW=schCreateInstForm->viewName->value \
schHiCreateInst(\"analogLib\" \"gnd\" \"symbol\") }")

hiSetBindKey("Schematics" "Ctrl <Key>v" "{ MYLIB=schCreateInstForm->libraryName->value \
MYCELL=schCreateInstForm->cellName->value MYVIEW=schCreateInstForm->viewName->value \
schHiCreateInst(\"analogLib\" \"vdc\" \"symbol\") }")

load "~/SKILL/utils/cpLibCell2Clipboard.il"
hiSetBindKey( "Schematics" "Alt Shift<Key>c" "cpLibCell2Clipboard()" )

; 8/30/22 
hiSetBindKey( "Schematics" "Ctrl Alt<Key>x" "desc_new_tab(0)" ) ; new window
hiSetBindKey( "Schematics" "Ctrl Shift<Key>t" "desc_new_tab(1)" ) ; new tab

; 9/21/22
hiSetBindKey( "Layout" "Ctrl <Key>h" "_leRotateOrFlip(\"MY\")" ) ; flip horizontal

; 10/28/22
load "~/SKILL/utils/suffix.il"
hiSetBindKey( "Schematics" "Ctrl Alt<Key>e" "rmvSuffix()" ) ; remove suffix
hiSetBindKey( "Schematics" "Ctrl Alt<Key>f" "putSuffix()" ) ; put suffix
hiSetBindKey( "Schematics" "Ctrl Alt<Key>g" "getSuffix()" ) ; get suffix --> SUFFIX variable

; 12/8/22
hiSetBindKey("Schematics" "Alt Shift<Key>4" "explAppendTranDiff()") ; to be used with Explorer (MYappendSignal.il)

; 3/29/23
load "~/SKILL/utils/toglOnlyInstSel.il"
hiSetBindKey("Schematics" "Ctrl Shift<Key>i" "toglOnlyInstSel()")

; 3/31/23 Shyam Gupta on 46691233
load "~/SKILL/CCS/CCSPushViVA.il"
hiSetBindKey("Schematics" "Ctrl Alt<Key>v" "CCSPushViVA(\"tran\")" )
load "~/SKILL/CCS/CCSAbutAlignInstances.il"
hiSetBindKey( "Layout" "Ctrl Alt <Key>v" "CCSAbutAlignInstances(\"vertical\")" )
hiSetBindKey( "Layout" "Ctrl Alt Shift <Key>h" "CCSAbutAlignInstances(\"horizontal\")" )
load "~/SKILL/utils/getAlignDir.il"
load "~/SKILL/utils/inc_spc.il"

hiSetBindKey("Layout" "Alt<Btn4Down>" "inc_spc(t)")
hiSetBindKey("Layout" "Alt<Btn5Down>" "inc_spc(nil)")

; 4/5/23
hiSetBindKey( "Layout" "Ctrl Alt <Key>x" "lxHiSwap()" )

; 4/10/23
load "~/SKILL/utils/launch_ADE_L.il"
hiSetBindKey("Schematics" "Ctrl Alt Shift<Key>l" "launch_ADE_L()" )

; 9/20/23
;load "~/SKILL/utils/disp_fet_info.il"
; 10/4/23
load "~/SKILL/CCS/CCSaddPointOPPrint.il"
hiSetBindKey("Schematics" "Ctrl Alt <Key>1" "CCSpnt()" )

; 11/16/23 - instantiate title_blk with CTRL SHIFT N - which takes over openSelReadOnly and calls it..
load "~/SKILL/utils/instTitleBlk.il" 
hiSetBindKey("Schematics" "Ctrl Shift <Key>n" "instTitleBlk()" )

; 2/15/24 - layout productivity
hiSetBindKey( "Layout" "Ctrl <Key>h" "_leRotateOrFlip(\"MY\")" )
hiSetBindKey( "Layout" "Ctrl <Key>u" "_leRotateOrFlip(\"MX\")" )
load "~/SKILL/CCS/CCSeditViaRowsCols.il" # CTRL ALT/SHIFT/both mouse scroll wheel change via size

; 2/22/24
load "~/SKILL/CCS/CCSvxlRaiseSchWin.il" ; raise schematic window used as conn reference in layout XL ALT-H

; 2/25/24
load "~/SKILL/utils/toggle_group.il" ; toggle group/ungroup with CTRL G

; 9/25/24
hiSetBindKey("vivaGraph" "Shift <Key>r" "_vivaAddSubwindow(\"rectangular\")") ; add a subwindow with SHIFT+R
