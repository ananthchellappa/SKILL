procedure( addVDDVSS() 

; usage : click on an instance to select it; then run this.

; even better - click on an instance whose VDD/VSS are already set and you want to
; copy; then run getVDDVSS() on that one. then, come here and run it..

    schHiObjectProperty()
    hiiSetCurrentForm('schObjPropForm)
    schObjPropForm->InfoAll->user->value =  t
    schAddProp()
    hiiSetCurrentForm('schAddPropForm)
    schAddPropForm->name->value="VDD"
    schAddPropForm->type->value="netSet"
    schAddPropForm->value->value=lastVDD
    hiFormDone(schAddPropForm)
    schAddPropForm->name->value="VSS"
    schAddPropForm->type->value="netSet"
    schAddPropForm->value->value=lastVSS
    hiFormDone(schAddPropForm)
    hiiSetCurrentForm('schObjPropForm)
    schObjPropForm->VDD_dsp->value="both"
    schObjPropForm->VSS_dsp->value="both"
    hiFormDone(schObjPropForm)

)


procedure( setVDDVSS()

    schHiObjectProperty()
    schObjPropForm->VDD->value=lastVDD
    schObjPropForm->VSS->value=lastVSS
    hiFormDone(schObjPropForm)

)
