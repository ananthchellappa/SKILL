; load "/home/USERNAME/SKILL/zoomText.il"

procedure( zoomText()
	prog( ()
		if( ( (nil == geGetSelSet() ) || ( "label" != car( geGetSelSet() )~>objType ) )
		then
		; if nothing selected, 
			;if( length( hierPath ) > 0
			if( hierPath != "" 
			then
				schHiCreateNoteLabel( ?text hierPath )
			else
				println( "Select something and make sure it's a text label" )
			)
		else
			hierPath = car( geGetSelSet() )~>theLabel
			geDeselectAll()
			hierDescend( parseString( hierPath "/" ) )
		) ; if
	) ; prog
) ; procedure
