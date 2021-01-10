; was out of touch with skill when I did this
; had forgotten about xCoord and yCoord
; load "/home/achellappa/skill/arrows.il"

procedure( arrows(  )
    let( (cv win pllx purx lllx lurx line xL yL )
        cv = geGetWindowCellView()
		win = hiGetCurrentWindow()
printf("Processing %s\n", cv~>cellName)
    if( !( cv~>mode == "r")
        then
			hiGetCurrentWindow()~>fullSelectionMode="enclosedAndCrossed"
            foreach( pin cv~>terminals
				if( "output" ==  pin~>direction
					then
						purx = caadar( pin~>pins~>fig~>bBox )
						lllx = caaaar( pin~>pins~>fig~>children~>bBox )
						if( purx < lllx
							then 
								printf("Hitting output pin : %s\n", pin~>name )
								; car( cdadar --> pury
								; cadaar --> plly
								geSelectArea( win list( 
									list( (3*purx + lllx)/4.0 car(cdadar( pin~>pins~>fig~>bBox ) )
										)
									list( (purx + lllx)/2.0 cadaar(pin~>pins~>fig~>bBox ) ) 
										)
									"rectangle" )
								line = car(geGetSelSet() )
								yL = yCoord(car(line~>bBox))
								if( yL == yCoord(cadr( line~>bBox) ) 
									  ; lly = ury => horizontal
									then
										xL = xCoord(car(line~>bBox))
										dbCreateLine( cv list( 231 "drawing") 
											list( xL+0.25:yL xL+0.0625:yL xL+0.125:yL+0.0625
												  xL:yL xL+0.125:yL-0.0625 xL+0.0625:yL )
										)
										dbDeleteObject( line )
								)
						)
				) ; if
				if( "input" ==  pin~>direction
					then		; you just have to suffer by experimenting with a geGetSelSet and figure it out :(
						pllx = caaar( pin~>pins~>fig~>bBox )
						lurx = car( cadaar( pin~>pins~>fig~>children~>bBox ) )
						if( pllx > lurx
							then 
								printf("Hitting input pin : %s\n", pin~>name )
 								geSelectArea( win list(
 									list( (3*pllx + lurx)/4.0 car(cdadar( pin~>pins~>fig~>bBox ) )
 										)
 									list( (pllx + lurx)/2.0 cadaar(pin~>pins~>fig~>bBox ) )
 										)
 									"rectangle" )
								line = car(geGetSelSet() )
								yL = yCoord(car(line~>bBox))
								if( yL == yCoord(cadr( line~>bBox) ) 
									  ; lly = ury => horizontal
									then
										xL = xCoord(car(line~>bBox))
										dbCreateLine( cv list( 231 "drawing") 
											list( xL+0.25:yL xL+0.0625:yL xL+0.125:yL+0.0625
												  xL:yL xL+0.125:yL-0.0625 xL+0.0625:yL )
										)
										dbDeleteObject( line )
								)
 						)
				) ; if
            ) ; foreach
            t
        else
            println("Sorry, exiting due to read-only mode")
            nil
    )   ; if

    ) ; let

	hiGetCurrentWindow()~>fullSelectionMode="enclosed"

)   ; procedure
