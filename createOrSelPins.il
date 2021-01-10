; if selected object is a label, then use the text to create a pin with that name,
; else, select all pin objects (overloading CTRL-SHIFT-P

; inputCVId = dbOpenCellViewByType( "basic" "ipin" "symbol" "" 'r )
; pinId = schCreatePin( cvId inputCVId "I1" "input" nil 0:0 "R0" )

procedure( createOrSelPins(  )
	let( ( o )
		if( ( length( geGetSelSet() ) > 0 )
		then
			o = car(geGetSelSet())
			schDeselectAllFig()
			if( "label" == o~>objType
				schHiCreatePin( ?terminalName o~>theLabel  )
			)
		else
			schHiSelectByProperty( "select" "pinName" "==" "*" )
		); if
	)
) ; procedure
