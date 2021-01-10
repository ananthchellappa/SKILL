lastVCC="VCC"
procedure( addVCC() 

; usage : click on an instance to select it; then run this.

; even better - click on an instance whose VDD/VSS are already set and you want to
; copy; then run getVDDVSS() on that one. then, come here and run it..

    schHiObjectProperty()
    hiiSetCurrentForm('schObjPropForm)
    schObjPropForm->InfoAll->user->value =  t
    schAddProp()
    hiiSetCurrentForm('schAddPropForm)
    schAddPropForm->name->value="VCC"
    schAddPropForm->type->value="netSet"
    schAddPropForm->value->value=lastVCC
    hiFormDone(schAddPropForm)
    hiiSetCurrentForm('schObjPropForm)
    schObjPropForm->VCC_dsp->value="both"
    hiFormDone(schObjPropForm)
    schObjPropForm->InfoAll->user->value =  nil

)


