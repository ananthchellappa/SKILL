procedure(MYappendAllSignal()

 let((session)

  session=sevSession(hiGetCurrentWindow())
  eval(sevWindow(session)->hiForm)->artistPlottingMode->value="Append"  ; this sets the plotting mode on the ADE window
  sevDirectPlot(session 'asiiPlotTranSignalCB)

; 1/25/17
astiSelectItemForm->ahiIncludeAsBundle->value= nil

  _astiSelectAllIteratedCB
 )

)
