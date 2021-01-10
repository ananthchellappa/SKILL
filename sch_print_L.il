; procedure( sch_print_L()
    shell( "rm -f ~/print.ps" )
    schHiPlot()
    hiiSetCurrentForm('schPlotSubmitForm)
    schPlotSubmitForm->plotPlotSelection->header->value =  nil
    schiPlotOptionsBtnCB()
    hiiSetCurrentForm('schPlotOptionsForm)
    schPlotOptionsForm->plotMailLogToggle->mail->value =  nil
;    schPlotOptionsForm->plotPlotterCyclic->value = "PS A4,A3 B/W"  ; thanks 6.1.6!
    schPlotOptionsForm->plotPlotterCyclic->value = "Default_Black/White(A3/A4)"
    schPlotOptionsForm->plotToFileToggle->send->value =  t
    schPlotOptionsForm->plotToFileStr->value = "~/print.ps"
    schPlotOptionsForm->plotFitToggle->fit->value =  t
    hiFormDone(schPlotOptionsForm)
    hiFormDone(schPlotSubmitForm)
    shell "gv -orientation=LANDSCAPE ~/print.ps &"
;    shell "xterm -e gs -c '<< /Orientation 3>> setpagedevice .locksafe' -f ~/print.ps &"

; )
