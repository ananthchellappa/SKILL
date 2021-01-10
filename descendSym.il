envSetVal("schematic" "descendTarget" 'string "query user")
schHiDescendRead()
; mouseAddPt()
hiiSetCurrentForm('schDescendForm)
schDescendForm->schDescendViewNameField->value = "symbol"
if( (1 < car( geGetSelSet()~>numInst) )
    then
        hiFormDone(schDescendIterForm)
    else
        hiFormDone(schDescendForm)
)
