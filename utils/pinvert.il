procedure( pinvert( sel_only )
    let( (cv proc_set )
        cv = geGetWindowCellView()
printf("Processing %s\n", cv~>cellName)
    if( !( cv~>mode == "r")
        then
			if( 1 == sel_only
			then
				proc_set = geGetSelSet()~>pin~>term
			else
				proc_set = cv~>terminals
			)
 			foreach( pin proc_set
				if( "input" ==  pin~>direction
					then
						pin~>direction = "output"
					else
						if( "output" == pin~>direction
							then pin~>direction = "input" )
				) ; if
 			) ; foreach
            t
        else
            println("Sorry, exiting due to read-only mode")
            nil
    )   ; if

    ) ; let

)   ; procedure
