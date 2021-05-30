; original version schIncreasePinSpacing : only works well for the case of few pins all already aligned
; on same x-coordinate or same y-coordinate. Also, would get messed up if you have anything other than
; pins selected..  so here, the first thing we do is deselect anything other than a pin :)

; smartIncPinSpace( "+" ) ; or "-"

procedure( smartIncPinSpace( space )
	let( ( direction unitsep obj count snapSpacing newx min_x min_y sum_sq_x sum_sq_y sum_x sum_y
			x y x_p y_p x_table y_table var_x var_y aligned_x aligned_y k_scale k_x k_y
			newy firstx firsty firstxy lastxy add)
		snapSpacing	= envGetVal("schematic" "symSnapSpacing")
		; when we do the actual scaling, we'll work in units of snapSpacing
		if("+" == space then
			k_scale = 1.2
		else
			k_scale = 0.8
		)

		
; build up hashtables of the pin coordinates - on for x, one for y and values are the counts
		x_table = makeTable( "" 0 ) ; arguments are "print name" and default value
		y_table = makeTable( "" 0 )
		min_x = nil
		count = 0
		sum_sq_x = 0
		sum_sq_y = 0
		sum_x = 0
		sum_y = 0
		aligned_x = 0
		aligned_y = 0

		foreach( obj geGetSelSet() 
			if( obj~>pin 
			then
				x = xCoord( obj~>xy )
				y = yCoord( obj~>xy )
				if( ! min_x 
				then
					min_x = x
					min_y = y
				else
					min_x = min( min_x x )
					min_y = min( min_y y )
					x_table[ x ]++
					y_table[ y ]++
				)
				sum_sq_x += x*x
				sum_sq_y += y*y
				sum_x += x
				sum_y += y
				count++
			else
				geDeselectObject( obj )
			)
		)
		
		foreach( key x_table 
			if( x_table[key] > 1
				aligned_x++
			)
		)
		foreach( key y_table 
			if( y_table[key] > 1
				aligned_y++
			)
		)
		if( aligned_x == aligned_y 
		then
			; look at spreads
			var_x = ( sum_sq_x - sum_x*sum_x ) / count
			var_y = ( sum_sq_y - sum_x*sum_y ) / count
		else
			var_x = 0
			var_y = 0 ; just so this doesn't intefere with anything
		)
			
		if( ( aligned_x > aligned_y || var_x < var_y )
		then
			; means you increase y spacings
			k_y = k_scale
			k_x = 0
		else
			; increase x spacings
			k_y = 0
			k_x = k_scale
		) ; might be a way to compact this if into something more elegant
		
		foreach( obj geGetSelSet() 
			x = xCoord( obj~>xy ) - min_x
			y = yCoord( obj~>xy ) - min_y
			if( k_y > 0 && y > 0 
			then
				y_p = snapSpacing * round( k_y * y/snapSpacing )
				if( k_y > 1 && y_p == y 
					y_p += snapSpacing 
				)
				if( k_y < 1 && y_p == y
					y_p = max( 2*snapSpacing, y_p-snapSpacing)
				)
				obj~>xy = list( x + min_x, y_p + min_y)
			else
				if( k_x > 0 && x > 0 
				then
					x_p = snapSpacing * round( k_x * x/snapSpacing )
					if( k_x > 1 && x_p == x
						x_p += snapSpacing
					)
					if( k_x < 1 && x_p == x
						x_p = max( 2*snapSpacing, x_p-snapSpacing)
					)
					obj~>xy = list( x_p + min_x, y + min_y)
				
				)
			)
		
		) ; foreach

	
	); let
); procedure

