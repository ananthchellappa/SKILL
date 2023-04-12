procedure( getWinByAppTypeText(text "S") ; --> window object
; Eg : getWinByAppTypeText("ssembler") or "Schemat"
    let( (wins y)
		wins=hiGetWindowList()
    	car( setof(y wins rexMatchp(text hiGetAppType(y) ) ) )
		; return the first
	)
)

