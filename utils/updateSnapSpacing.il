procedure( updateSnapSpacing( factor )

    let( (snap)
	; help from Bhupendra Kumar
	hiRegTimer("
	    hiiSetCurrentForm('schDisplayOptionsForm)
	    snap = schDisplayOptionsForm->snapSpacing->value
	    schDisplayOptionsForm->snapSpacing->value = snap*factor
	    hiFormDone(schDisplayOptionsForm)" 5
		)
	schHiDisplayOptions()

    )   ; let

)   ; procedure
