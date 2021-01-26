procedure( toglOnlyWireLblSel()
    hiRegTimer("
        hiiSetCurrentForm('schSchSelectForm)
        if( schSchSelectForm->allNone->all->value
        then
            schSchSelectForm->allNone->none->value = t
            schSchSelectForm->objects->wireName->value = t
        else
            schSchSelectForm->allNone->all->value = t
        )
        hiFormDone(schSchSelectForm)" 5
    )
    schSetSelectOptions()
)
