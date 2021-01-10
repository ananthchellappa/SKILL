; 7/4/2011 - added an equalization (hard) feature

procedure( updatePinLabels( factor )
    let( (cv max)
        cv = geGetWindowCellView()
        max = 0
printf("Processing %s\n", cv~>cellName)
    if( !( cv~>mode == "r")
        then
            foreach( shape cv~>shapes
                if( (equal("label" shape~>purpose) && equal("pin" car(shape~>lpp) ) )
                    then
                        if( (shape~>height > max )
                            max = shape~>height
                        )   ; extract maximum value
                )
            )
            foreach( shape cv~>shapes
                if( (equal("label" shape~>purpose) && equal("pin" car(shape~>lpp) ) )
                    then
                        shape~>height = factor*max
                        schSetTextDisplayBBox(shape nil)
                )
            )
            t
        else
            println("Sorry, exiting due to read-only mode")
            nil
    )   ; if

    ) ; let

)   ; procedure
