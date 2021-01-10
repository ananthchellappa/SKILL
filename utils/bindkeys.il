toggler=0
sch_grid_togl=0
tb_toggle=0
load_all_bindkeys=t ; if you are someone else, then change this :)

load("/home/USERNAME/SKILL/toglInstObjFil.il")
load("/home/USERNAME/SKILL/CCS/CCSToggleSelectMode.il")
load("/home/USERNAME/SKILL/CCS/CCSsuppressDispForm.il")
load("/home/USERNAME/SKILL/killPinAnnotate.il")
;load("/home/USERNAME/SKILL/toolbarToggle.il") ; 7/12/18
load("/home/USERNAME/SKILL/CCS/LSW.il")
load("/home/USERNAME/SKILL/sch_grid_togl.il")
load("/home/USERNAME/SKILL/CCS/CCSchangeWireWidth.il")
load("/home/USERNAME/SKILL/CCS/CCSExportOutputs.il")
load("/home/USERNAME/SKILL/vivaGridToggle.il")
load("/home/USERNAME/SKILL/CCS/CCSrectSelect.il")
load("/home/USERNAME/SKILL/CCS/CCSOffCdsTermNetNames.il")
load("/home/USERNAME/SKILL/CCS/CCSSnapToGrid.il") ; Sameer
; load("/home/USERNAME/SKILL/CCS/CSComposerGridSnap.il")
load("/home/USERNAME/SKILL/hiSelectSymPins.il")
load("/home/USERNAME/SKILL/updatePinLabels.il")
load("/home/USERNAME/SKILL/MYappendSignal.il")
load("/home/USERNAME/SKILL/MYappendAllSignal.il")
load("/home/USERNAME/SKILL/updateSnapSpacing.il")

load("/home/USERNAME/SKILL/CCSDescend.il")
; 6/27/18
load("/home/USERNAME/SKILL/newDescend.il")

load("/home/USERNAME/SKILL/CCSkey.il")
load("/home/USERNAME/SKILL/CCSrestoreDefaultWireColors.il")
load("/home/USERNAME/SKILL/awvGrid.il")
load("/home/USERNAME/SKILL/applify.il")
; load("/home/USERNAME/SKILL/sch_print_L.il")
load("/home/USERNAME/SKILL/MYappendDCSignal.il")
load("/home/USERNAME/SKILL/MYdescend.il")
load("/home/USERNAME/SKILL/hiReturn.il")

load("/home/USERNAME/SKILL/CCS/CCSMarkerForm.il")

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
load("/home/USERNAME/SKILL/CCS/CCSLibManSelectInst.il")
; contains Ctrl Alt<key>s

; load("/home/USERNAME/SKILL/CCS/CheckNetSet.il")
load("/home/USERNAME/SKILL/schIncreasePinSpacing.il")


; 4/22/2014 atl v chelsea : grid
hiSetBindKey("Schematics" "Ctrl<Key>F10" "sch_grid_togl()")

; load("/home/USERNAME/SKILL/addVDDVSS.il")
; load("/home/USERNAME/SKILL/getVDDVSS.il")
; load("/home/USERNAME/SKILL/addVCC.il")
; load("/home/USERNAME/SKILL/delVDD.il")
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

; ; load("/home/USERNAME/SKILL/MYdescend.il") 6/22/2011

; rendered obsolte by Vikas Agarwal
; hiSetBindKey("Schematics" "Alt<Key>h" "zoomNet()")
; load("/home/USERNAME/SKILL/zoomNet.il")

; one that Dan Pickens brushed off :

; hiSetBindKey("awv" "<Key>d" "awvCrossHairDeleteList(awvGetCurrentWindow() 1 list(\"A\" \"B\"))")

; finally - long overdue - to prevent AWD from trying to update a window I was resizing..
; hiSetBindKey("awv" "Alt<Key>d" "graphicsOff()")
; hiSetBindKey("awv" "Alt<Key>e" "graphicsOn()")


; from Doug W 4/24/13 - how to cycle through fonts on selected set using Shift-scrollUp
hiSetBindKey("Schematics" "Shift<Btn4Down>" 
"mapcar(lambda((obj) obj->font = or(cadr(member(obj->font '( \"fixed\"   \"roman\"  \"stick\" ))) \"fixed\")) setof(obj geGetSelSet() obj->objType == \"label\") )")


; for Vikas
load("/home/USERNAME/SKILL/CCS/zoom_kais.il")
; 1/31/2013 - moved zoomInst here after glitch today.. need CCSclip
load("/home/USERNAME/SKILL/zoomInst.il")


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

; hiSetBindKey("Schematics" "<Key>1" "load(\"/home/USERNAME/SKILL/op_info.il\")")
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
; ; hiSetBindKey("Schematics" "Ctrl<Key>4" "load(\"/home/USERNAME/SKILL/direct_plot.il\")")
hiSetBindKey("Schematics" "Ctrl<Key>4" "MYappendSignal()")
hiSetBindKey("Schematics" "Shift<Key>4" "MYappendAllSignal()")

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

; hiSetBindKey("Schematics" "<Key>6" "load(\"/home/USERNAME/SKILL/annotOp.il\")")
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
hiSetBindKey("Schematics" "Alt<Key>b" "load(\"/home/USERNAME/SKILL/sch_print.il\")")
hiSetBindKey("Schematics" "Ctrl<Key>b" "load(\"/home/USERNAME/SKILL/sch_print_L.il\")")
; hiSetBindKey("Schematics" "Ctrl<Key>b" "sch_print_L()")
hiSetBindKey("Schematics" "Alt<Key>r" "{CCSrestoreDefaultWireColors() schZoomFit(1.0 0.9)}")


hiSetBindKey("Schematics" "<Key>e"  "MYdescend(1)")
hiSetBindKey("Schematics" "Ctrl<Key>x" "MYdescend(0)")
; worked with Sanjeev of CCS
; hiSetBindKey("Schematics" "Ctrl<Key>x" "load(\"/home/USERNAME/SKILL/descendSchNew.il\")")
; hiSetBindKey("Schematics" "Alt<Key>x" "load(\"/home/USERNAME/SKILL/descendSch.il\")")
; above now used for full path hierarchical descending..

; hiSetBindKey("Schematics" "Alt<Key>d" "zoomInst()")
; 1/31/2013 :(
hiSetBindKey("Schematics" "Alt<Key>d" "CCSclip() hiRegTimer(\"zoomInst(CLIPDATA)\" 10)")

hiSetBindKey("Schematics" "Alt<Key>x" "hierDescend(parseString(hierPath \"/\"))")
hiSetBindKey("Schematics" "Ctrl<Key>y" "load(\"/home/USERNAME/SKILL/descendSym.il\")")
hiSetBindKey("Schematics" "Alt<Key>e" "{hierPath=geGetInstHier(hiGetCurrentWindow()) schHiReturnToTop()}")
hiSetBindKey("Schematics" "Alt<Key>g" "CCSSnapToGrid()")
hiSetBindKey("Symbol" "Alt<Key>g" "CCSSnapToGrid()")
hiSetBindKey("Schematics" "Ctrl<Key>e" "MYReturn()")
hiSetBindKey("Schematics" "Ctrl<Key>v" "load(\"/home/USERNAME/SKILL/descendVA.il\")")
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
; "load(\"/home/USERNAME/SKILL/result_plot_mform.il\")")
; eliminated that file load thing on 1/31/2013
hiSetBindKey("Schematics" "<Key>j" "_noiseSummaryPrintMenuCB('((noise noise) (pnoise pnoise)) sevSession(hiGetCurrentWindow())" )
; "load(\"/home/USERNAME/SKILL/noise_info.il\")")
; eliminated that file load thing on 1/31/2013
hiSetBindKey("Schematics" "Alt<Key>c" "sevOpenCalculator()")
; hiSetBindKey("awv" "Alt<Key>s" "awviSwitchAxisModeCB()" )
hiSetBindKey("Schematics" "Ctrl<Key>2" "schHiChangeEditMode(\"a\")")
hiSetBindKey("Schematics" "Ctrl Shift<Key>2" "schHiChangeEditMode(\"r\")")
hiSetBindKey("Layout" "Ctrl<Key>2" "_leChangeEditMode(\"a\")")
hiSetBindKey("Symbol" "Ctrl<Key>2" "schHiChangeEditMode(\"a\")")
hiSetBindKey("Schematics" "Alt<Key>f" "schHiFind()")
hiSetBindKey("Symbol" "Alt<Key>f" "schHiFind()")
hiSetBindKey("Schematics" "Alt<Key>i" "load(\"/home/USERNAME/SKILL/findInst.il\")")
hiSetBindKey("Schematics" "Alt<Key>n" "load(\"/home/USERNAME/SKILL/findNet.il\")")
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
; ; ; hiSetBindKey("awv" "Ctrl<Key>e" "load(\"/home/USERNAME/SKILL/awv_print.il\")") ; removed 11/7/2012
; hiSetBindKey("awv" "Ctrl<Key>b"
; "load(\"/home/USERNAME/SKILL/awv_print_gv.il")")
; hiSetBindKey("awv" "Ctrl<Key>e" "load(\"/home/USERNAME/SKILL/awv_print_gv_L.il\")")
; hiSetBindKey("awv" "Ctrl<Key>x" "load(\"/home/USERNAME/SKILL/awv_x_log.il\")")
; ; ; hiSetBindKey("awv" "Ctrl<Key>t" "load(\"/home/USERNAME/SKILL/awv_x_auto.il\")") ; 11/14/2012
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
load("/home/USERNAME/SKILL/CCS/CCSpbSchObjProp.il")

; 7/26/16 from Likesh Sahoo - select all of a wire with only one segment already selected
hiSetBindKey( "Schematics" "Ctrl Alt<Key>w" "geSelectFigs( car(geGetSelSet()~>net~>figs) )" )

load("/home/USERNAME/SKILL/lcPinNames.il")
hiSetBindKey( "Schematics" "Ctrl Alt<Key>5" "lcPinNames( 1 )" )
hiSetBindKey( "Symbol" "Ctrl Alt<Key>5" "lcPinNames( 1 )" )
load("/home/USERNAME/SKILL/lcLabels.il")
hiSetBindKey( "Schematics" "Ctrl Alt<Key>6" "lcLabels( )" )
; 8/1/16
load("/home/USERNAME/SKILL/symIncreasePinSpacing.il")
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
load( "/home/USERNAME/SKILL/pinName2ClipBoard.il" )
hiSetBindKey( "Schematics" "Ctrl Shift<Key>c" "pinName2ClipBoard()" )

; 9/5/16 , 10/3/16
load "/home/USERNAME/SKILL/createOrSelPins.il"
hiSetBindKey( "Schematics" "Ctrl Shift<Key>p" "createOrSelPins()" )
hiSetBindKey( "Symbol" "Ctrl Shift<Key>p" "schHiSelectByProperty( \"select\" \"pinName\" \"==\" \"*\" )" )

load( "/home/USERNAME/SKILL/horizontalize.il" )
hiSetBindKey( "Symbol" "Ctrl Shift<Key>h" "horizontalize()" )
hiSetBindKey( "Schematics" "Ctrl Shift<Key>h" "horizontalize()" )

load( "/home/USERNAME/SKILL/roundPinsToLine.il" )
load( "/home/USERNAME/SKILL/squarePinsToLine.il" )
load( "/home/USERNAME/SKILL/arrows.il" )

; 9/9/16
load "/home/USERNAME/SKILL/zoomText.il"
hiSetBindKey( "Schematics" "Ctrl Alt<Key>d" "zoomText()" )

; 9/12/16
load "/home/USERNAME/SKILL/toglImportSplitRseg.il"

; 9/30/16; 10/7/16
load "/home/USERNAME/SKILL/MYflip.il"
hiSetBindKey( "Schematics" "Ctrl <Key>h" "MYflip(1)" )
hiSetBindKey( "Schematics" "Ctrl <Key>u" "MYflip(0)" )
hiSetBindKey( "Symbol" "Ctrl <Key>h" "MYflip(1)" )
hiSetBindKey( "Symbol" "Ctrl <Key>u" "MYflip(0)" )

; 10/3/16
load "/home/USERNAME/SKILL/selSimilar.il"
hiSetBindKey( "Schematics" "Ctrl Alt<Key>h" "selSimilar()" )
hiSetBindKey( "Layout" "Ctrl Alt<Key>h" "selSimilar()" )

; 10/7/16
load("/home/USERNAME/SKILL/inc_bus.il")
load("/home/USERNAME/SKILL/inc_wire_inst.il")

load("/home/USERNAME/SKILL/fl_nodes.il")
load("/home/USERNAME/SKILL/getWinNum.il")

; 11/29/16 after Bhupendra Kumar helped out..
load "/home/USERNAME/SKILL/selectInTableView.il"
hiSetBindKey( "Schematics" "Ctrl <Key>i" "selectInTableView()" )

; 1/26/17
load "/home/USERNAME/SKILL/listInstPaths.il"
hiSetBindKey( "Schematics" "Ctrl Alt<Key>l" "listInstPaths()" )

; 2/8/17
load "/home/USERNAME/SKILL/toglInstMstrDisplay.il"
hiSetBindKey( "Layout" "Ctrl Alt<Key>d" "toglInstMstrDisplay()" )

; 2/15/17
load "/home/USERNAME/SKILL/setInstNamePrefix.il"

; 3/1/17
load "/home/USERNAME/SKILL/removeColors.il"
hiSetBindKey( "Schematics" "<Key>F7" "removeColors()" )
hiSetBindKey( "Schematics" "Ctrl <Key>F7" "geResetCellView(deGetCellView())" )

; 3/14/17
hiSetBindKey( "Schematics" "Alt <Key>Q" "schHiSelectByProperty(\"select\")" )

; 3/21/17
load "/home/USERNAME/SKILL/fixPartName.il"
hiSetBindKey( "Symbol" "Ctrl Alt<Key>C" "fixPartName()" )

; 4/3/17
load "/home/USERNAME/SKILL/openSelReadOnly.il"

; 5/18/17
hiSetBindKey("Schematics" "Alt Shift<Key>h" "heHiEditConfig()")

; 11/11/17
hiSetBindKey( "Schematics" "Ctrl <Key>c" "schHiCreateNoteShape( ?shape \"ellipse\" ?style \"dashed\")" )

; 1/3/17
hiSetBindKey("Layout" "Alt <Key>v" "pteSetVisible(\"Vias\" !pteIsVisible(\"Vias\" \"Objects\") \"Objects\")" )

; 3/20/18
hiSetBindKey("Schematics" "Alt Shift<Key>d" "MYappendTranDiff()")

; 5/2/18
load "/home/USERNAME/SKILL/renameInsts.il"
hiSetBindKey("Schematics" "Ctrl Alt<Key>i" "renameInsts()")

;7/30/18
load "/home/USERNAME/SKILL/txpose_bus.il"
load "/home/USERNAME/SKILL/txpose_inst_label.il"
; 1/11/20
;hiSetBindKey("Schematics" "Alt Shift<Btn4Down>" "txpose_inst_label('t)")
;hiSetBindKey("Schematics" "Alt Shift<Btn5Down>" "txpose_inst_label(nil)")

; 7/12/18
hiSetBindKey( "Schematics" "Shift <Key>r" "schHiCreateNoteShape( ?shape \"rectangle\" ?style \"solid\")" )
hiSetBindKey( "Schematics" "Shift <Key>q" "schHiCreateNoteShape( ?shape \"polygon\" ?style \"solid\")" )

; 6/1/16 and 7/12/18
hiSetBindKey( "Schematics" "<Key>n" "schHiCreateNoteShape( ?shape \"line\" ?style \"solid\" ?width 0)")

; 7/26/18
hiSetBindKey("Schematics" "Alt Shift <Key>q" "load( \"/home/USERNAME/SKILL/sch_prop_all_sel.il\" )" )
hiSetBindKey("Schematics" "<Key>q" "load( \"/home/USERNAME/SKILL/sch_prop_only_current.il\" )" )

; 8/25/18
load "/home/USERNAME/SKILL/CreateLibManSelInst.il"
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
load "/home/USERNAME/SKILL/getLastInstInfo.il"

; 9/16/18
load "/home/USERNAME/SKILL/subJumpBack.il"
hiSetBindKey( "Schematics" "Ctrl Alt <Key>e" "subJumpBack()" )

; 9/19/18
load "/home/USERNAME/SKILL/libManSelectTB.il"
; contains CTRL-ALT-T to locate testbench

; 09/28/18
load "/home/USERNAME/SKILL/copyResVal.il"
hiSetBindKey("Schematics" "Ctrl Alt<Key>r" "copyResVal()")

;10/31/18
hiSetBindKey("vivaGraph" "Ctrl<Key>d" "and(setq(sessionName awvGetCurrentWindow()->vivaSession) awvCloseWindow(awvGetCurrentWindow()))")

;11/09/18
hiSetBindKey("Schematics" "Ctrl Shift<Key>o" "{selectResults('dcOpInfo) report(?output \"param.txt\" ?format \"spice\")}")

;12/20/18 ; 01/23/19
load "/home/USERNAME/SKILL/genNetlist.il"
hiSetBindKey("Schematics" "Alt Shift<Key>n" "genNetlist()")

;01/02/19
hiSetBindKey("Schematics" "Alt Shift<Key>l" "ddsOpenLibManager()")

;01/21/19
hiSetBindKey("Schematics" "Ctrl Alt <Key>q" "sevQuit(sevSession(hiGetCurrentWindow()) )")

;02/18/19
load "/home/USERNAME/SKILL/incrText.il"
hiSetBindKey( "Schematics" "Ctrl <Key>PageUp" "incrText( 1 )" )
hiSetBindKey( "Schematics" "Ctrl <Key>PageDown" "incrText( -1 )" )

;03/10/19
load "/home/USERNAME/SKILL/loadLatestRun.il"
hiSetBindKey( "Schematics" "Ctrl Shift<Key>R" "loadLatestRun()" )

;07/01/19
load "/home/USERNAME/SKILL/togl_ViVA_Browser.il"
hiSetBindKey("vivaGraph" "Ctrl<Key>b" "togl_ViVA_Browser()")

;07/09/19
load "/home/USERNAME/SKILL/rePlotOverlay.il"
hiSetBindKey("Schematics" "Alt Shift <Key>p" "rePlotOverlay()")

; 7/31/19 -- THanks Edwin of Perforce (IC Manage )
load "/home/USERNAME/SKILL/ICM_libManSelectInst.il"

; 10/9/19
load "/home/USERNAME/SKILL/putViewName.il" 
hiSetBindKey( "Schematics" "Ctrl Shift<Key>s" "putViewName()" )

; 1/11/20
load "/home/USERNAME/SKILL/proc_alt_sh_scroll.il"
load "/home/USERNAME/SKILL/updateTemp.il"
hiSetBindKey("Schematics" "Alt Shift<Btn4Down>" "proc_alt_sh_scroll_up()")
hiSetBindKey("Schematics" "Alt Shift<Btn5Down>" "proc_alt_sh_scroll_down()")

; 2/7/20
; load "/home/USERNAME/SKILL/viva_condense.il"	; don't know what this does seems useless :)
; hiSetBindKey("vivaGraph" "Alt Shift<Key>e" "viva_condense()")

; 3/11/2020
load "/home/USERNAME/SKILL/list_pins.il"

; 8/6/2020
hiSetBindKey("vivaGraph" "Alt Shift<Key>s" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"moveTracesNewStrip\")")

; 8/9/2020
load "/home/USERNAME/SKILL/getPlotsAsText.il"
hiSetBindKey("Schematics" "Alt Shift<Key>w" "getPlotsAsText()")
load "/home/USERNAME/SKILL/plotTextWaves.il"
hiSetBindKey("Schematics" "Ctrl Shift<Key>w" "plotTextWaves()")

hiSetBindKey("Schematics" "Alt <Key>s" "_schHiSave()")
