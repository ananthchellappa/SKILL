procedure(MYappendDCSignal()

 let((session)

  session=sevSession(hiGetCurrentWindow())
  eval(sevWindow(session)->hiForm)->artistPlottingMode->value="Append"  ; this sets the plotting mode on the ADE window
  sevDirectPlot(session 'asiiPlotDCCB)

 )

)

