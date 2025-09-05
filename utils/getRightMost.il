procedure( getRightMost( cv)
	let( (justStarted x_RM y_RM obj x_UR)
		justStarted = t
		x_RM = 0
		y_RM = 0
		foreach( obj append(cv~>instances cv~>shapes)
		    x_UR = xCoord(cadr(obj~>bBox))
		    if( justStarted
		    then
		        x_RM = x_UR
				justStarted = nil
		    else
		        if( x_UR > x_RM
		        then
		            x_RM = x_UR
		            y_RM = yCoord(cadr(obj~>bBox))
		        )
		    )
		)
		x_RM:y_RM
	)
)
