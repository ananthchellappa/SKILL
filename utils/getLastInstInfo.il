procedure( getLastInstInfo()
; println("getLastInstInfo called")
;	if( hiIsFormDisplayed( schCreateInstForm)
;	then
;	println( "seen")
		if( "noConn" != schCreateInstForm->cellName->value
		then
			MYLIB = schCreateInstForm->libraryName->value
			MYCELL = schCreateInstForm->cellName->value
			MYVIEW = schCreateInstForm->viewName->value
		) ; if noConn	
;	) ; if

)
