cv = geGetWindowCellView()
printf("Processing %s\n", cv~>cellName)
(if !( cv~>mode == "r")
    then
        foreach( shape cv~>shapes
            if( (equal("label" shape~>purpose) && equal("pin" car(shape~>lpp) ) )
                then
                    shape~>height = 1.1*shape~>height
            )
        )
    else
        println("Sorry, exiting due to read-only mode")
)
