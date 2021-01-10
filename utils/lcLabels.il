; 7/30/2016 - added an equalization (hard) feature

procedure( lcLabels(  )
    let( (cv )
        cv = geGetWindowCellView()
printf("Processing %s\n", cv~>cellName)
    if( !( cv~>mode == "r")
        then
            foreach( obj geGetSelSet()
				if( "label" == obj~>objType
					then
						obj~>theLabel = lowerCase( obj~>theLabel )
				)
            )
            t
        else
            println("Sorry, exiting due to read-only mode")
            nil
    )   ; if

    ) ; let

)   ; procedure
