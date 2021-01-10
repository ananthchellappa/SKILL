; 7/4/2011 - added an equalization (hard) feature

;procedure( lcPinNames( lcucb all )
procedure( lcPinNames( lcucb  )
    let( (cv proc_set )
        cv = geGetWindowCellView()
printf("Processing %s\n", cv~>cellName)
    if( !( cv~>mode == "r")
        then
;			if( 1==all then proc_set = cv~>terminals else proc_set = 
            foreach( pin cv~>terminals
				pin~>name = if( 1==lcucb then lowerCase(pin~>name) else upperCase(pin~>name) )
            )
            t
        else
            println("Sorry, exiting due to read-only mode")
            nil
    )   ; if

    ) ; let

)   ; procedure
