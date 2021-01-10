; intention - caller will check if something is selected or not. If not,
; then call this.. 

procedure( updateTemp( direction )	; boolean
	let( (sess win TEMP points point next limit)
		points = list( -40, 0, 27, 100, 125 )	; more elegant than a bunch of if's :)
		win = hiGetCurrentWindow()
		sess = sevSession( win )
		if( sess
		then
			sess = asiGetCurrentSession()
			TEMP = atof( asiGetTemperature( sess ) )
			if( direction
			then	; user wants to increase temperature
				limit = car( last( points ) )
				next = limit
				prog( ()
					foreach( point reverse( points )
						if( TEMP >= point && TEMP < limit
						then
							asiSetTemperature( sess sprintf( NULL "%.1f" next*1.0 ) )
							return()
						else
							next = point
						)
					) ; foreach
				) ; prog
			else
				limit = nthelem( 1 points )
				next = limit
				prog( ()
					foreach( point  points 
						if( TEMP <= point && TEMP > limit
						then
							asiSetTemperature( sess sprintf( NULL "%.1f" next*1.0 ) )
							return()
						else
							next = point
						)
					) ; foreach
				) ; prog
			) ; if direction

		) ; if sess
	); let
)
