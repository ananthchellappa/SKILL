awvHardCopyMenuCB()
hiiSetCurrentForm('awviHardCopyForm)
awviHardCopyForm->plotSelection->header->value =  nil
awviHardCopyForm->toFileToggle->send->value =  t
awviHardCopyForm->mailLogToggle->mail->value =  nil
awviHardCopyForm->plotterCyclic->value = "PRINTER9"
awviHardCopyForm->toFileStr->value = "~/print.ps"
hiFormDone(awviHardCopyForm)
shell "kghostview -landscape ~/print.ps &"

