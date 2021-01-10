; if the existing (max - min)/(#pins -1) is an integer, then we increment
; else we just make it an integer

; operates on selected set only and only hits vertical position
; x x x x x      x   x   x   x will become
; x x x x x x x x x   -- so, in thi scase, user will need a 2nd hit

procedure( symIncreasePinSpacing( dir )
   let( (cv pin urY pur pL newPl minY maxY done count offset spacing)
    	cv = geGetWindowCellView()
	    if(  cv~>mode == "r" then println("Sorry, exiting due to read-only mode") )
		pL = ();
	prog( ()
		foreach( pin geGetSelSet()	;; note that the bBox access would be
									;; different if it were cv~>terminals
		; only the pin graphics must be selected!!

; this is the part that's misbehaving - gives me a "won't run"
	     	if( neq("drawing" pin~>purpose) then
	     		println( pin~>purpose )
	     		println( "Sorry, will only work if selected objects are the pin shapes")
	     		return()
	     	)

			urY = yCoord( cadr( pin~>bBox ) )
 			if( 0 == length( pL )
				then
					minY = urY
					maxY = minY
					pL = append( pL list( pin ) )
				else
					if( urY < minY then minY = urY )
					if( urY > maxY then maxY = urY ) 
					newPl = ()
					done = 0
					foreach( p pL
						purY = yCoord( cadr( p~>bBox ) )
						if( ( ( purY < urY ) || (1 == done ) ) ; poor readability
															; really should use
															; t/nil for done ..
							then
								newPl = append( newPl list(p) )
							else
								done = 1
								newPl = append( newPl list(pin) )
								newPl = append( newPl list(p) )
						) ; if
					) ; foreach
					if( 0 == done
						then
							newPl = append( newPl list(pin) ) 
					)
					pL = newPl
			) ; if 0 ==
		) ; foreach

;println( pL~>pin~>term~>name )
		spacing = (maxY - minY) / (0.125 * (length( pL )-1) )
printf( "spacing in major grids : %f\n" spacing)
		if( (spacing - truncate(spacing) ) < 1e-3
		then
			spacing = truncate(spacing)
			if( 1== dir then
				spacing++;
			else
				if( spacing > 1 then spacing-- )
			)
		else
				spacing = truncate(spacing)
		) ; if (spacing -
printf( "New spacing in major grids : %d\n" spacing)
		count = 0
		foreach( pin pL
			urY = yCoord( cadr( pin~>bBox ) )
			offset = 0.125*spacing*count - urY + minY
			count++
			dbMoveShape( pin cv list( 0:offset "R0" 1) )
		); foreach
	); prog

   ); let

) ; procedure
