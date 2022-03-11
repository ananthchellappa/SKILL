
procedure( toggleCase(  )
    let( (cv )
        cv = geGetWindowCellView()
printf("Processing %s\n", cv~>cellName)
 		if( !( cv~>mode == "r")
 		then
 		    foreach( obj geGetSelSet()
				if( "label" == obj~>objType
				then
					if( rexMatchp( "^[A-Z]" obj~>theLabel )
					then
						obj~>theLabel = lowerCase( obj~>theLabel )
					else
						obj~>theLabel = upperCase( obj~>theLabel )
					)
				else
					if( "textDisplay" == obj~>objType && obj~>parent~>pin
					then
						if( rexMatchp( "^[A-Z]" obj~>parent~>pin~>term~>name)
						then
							obj~>parent~>pin~>term~>name = lowerCase( obj~>parent~>pin~>term~>name)
						else
							obj~>parent~>pin~>term~>name = upperCase( obj~>parent~>pin~>term~>name)
						)
					) ; textDisplay
				) ; "label"
 		    )
 		    t
 		else
 		    println("Sorry, exiting due to read-only mode")
 		    nil
 		)   ; if

    ) ; let

)   ; procedure
