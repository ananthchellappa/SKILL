procedure( delVDD() 

; usage : click on an instance to select it; then run this.

; even better - click on an instance whose VDD/VSS are already set and you want to
; copy; then run getVDDVSS() on that one. then, come here and run it..

    schHiObjectProperty()
    hiiSetCurrentForm('schObjPropForm)
    schObjPropForm->InfoAll->user->value =  t
    schDelProp()
    hiiSetCurrentForm('schDelPropForm)
    schDelPropForm->name->value= '( "VDD" )
    hiFormDone(schDelPropForm)
    schObjPropForm->InfoAll->user->value =  nil

    hiFormDone(schObjPropForm)

)


