schHiDescendRead()
; mouseAddPt()
hiiSetCurrentForm('schDescendForm)
if( (1 < car( geGetSelSet()~>numInst) )
    then
        hiFormDone(schDescendIterForm)
    else
        hiFormDone(schDescendForm)
)
