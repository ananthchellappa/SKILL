shell "rm -f ~/print.ps"
schHiPlot()
hiiSetCurrentForm('schPlotSubmitForm)
hiFormDone(schPlotSubmitForm)
shell "kghostview ~/print.ps &"
