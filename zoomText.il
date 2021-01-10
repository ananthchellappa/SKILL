; load "/home/achellappa/skill/zoomText.il"


procedure( zoomText()
	prog( ()
		if( ( (nil == geGetSelSet() ) || ( "label" != car( geGetSelSet() )~>objType ) )
		then
		; if nothing selected, 
			println( "Select something and make sure it's a text label" )
			return()
		else
			hierPath = car( geGetSelSet() )~>theLabel
			geDeselectAll()
			hierDescend( parseString( hierPath "/" ) )
		) ; if
	) ; prog
) ; procedure
