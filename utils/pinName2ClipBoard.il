; meant to capture the pin name .. use CTRL SHIFT C
; please select the name (not the pin) and then run..

procedure( pinName2ClipBoard(  )
	let( ( o )
		o = car(geGetSelSet())
		if( "textDisplay" == o~>objType
		then
			system( buildString( list( "echo -n '" o->owner->name "' | ~/bin/xclip") "" ) )
		else
			if( "label" == o~>objType
				system( buildString( list( "echo -n '" o->theLabel "' | ~/bin/xclip") "" ) )
			)
		) ; if
	)
) ; procedure
