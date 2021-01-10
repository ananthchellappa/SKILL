procedure(MYappendSignal()

 let((session)

  session=sevSession(hiGetCurrentWindow())
  eval(sevWindow(session)->hiForm)->artistPlottingMode->value="Append"  ; this sets the plotting mode on the ADE window
  sevDirectPlot(session 'asiiPlotTranSignalCB)

 )

)

; Abhay Apte

procedure(plotbus()
     ;  Call the esc function earlier ,this is done because
     ; after we ok the form this function does not work
     ; So we call it earlier
    hiRegTimer("astiCancelSelect(hiGetCurrentWindow())" 10)

     ; Set context to the UI which shows bus signals
    hiiSetCurrentForm('astiSelectItemForm)

     ;Select all members of the bus
    _astiSelectAllIteratedCB()

     ; Ok the form after selection
    hiFormDone(astiSelectItemForm)
)

hiSetBindKey("Schematics" "Alt<Key>a" "plotbus()")
