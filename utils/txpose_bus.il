; (string, boolean) --> string
; A, t --> A<0>
; A<0>, t --> A<1>
; A<0>, nil --> A
; A<1>, nil --> A<0>
; A<1:0>, t --> A<2:1>
; A<2:1>, nil --> A<1:0>

procedure( txpose_bus(name upDn )
	let( (namelems)
		namelems = parseString( name "<:>" )
		if( 1 == length( namelems ) 	; => "A" (as opposed to A<1> or A<1:0>
		then
		    if( upDn
			then
		        buildString( list( nth( 0 namelems ) "<0>" ) "" )
			else
				name
		    )
		else
		    if( rexMatchp( "<[0-9]+>" name ) ; => "A<0>"
		    then
				if( upDn
				then
					buildString( list( nth( 0 namelems ) "<"
					                                itos( atoi(nth( 1 namelems)) + 1 )
					                  ">" )
					           "" )
				else
					if( rexMatchp( "<0>" name ) ;
					then
						nth( 0 namelems )
					else
						buildString( list( nth( 0 namelems ) "<"
					                                itos( atoi(nth( 1 namelems)) - 1 )	; not very elegant..
					                  ">" )
									"" )
					) ; if rexM..
				)
		    else
		        if( rexMatchp( "<[0-9]+:[0-9]+>" name )
		        then
		            if( upDn
					then
 						buildString( list( nth( 0 namelems ) "<"
 						                                itos( atoi(nth( 1 namelems)) + 1 )
 						                                ":" itos( atoi(nth( 2 namelems)) + 1 ) ">" )
 						            "" )
					else
						if( rexMatchp( "<0:[0-9]+>" name ) || rexMatchp( "<[0-9]+:0>" name )
						then
							name
						else
							buildString( list( nth( 0 namelems ) "<"
 						                                itos( atoi(nth( 1 namelems)) - 1 )
 						                                ":" itos( atoi(nth( 2 namelems))  - 1 ) ">" )
 						            "" )
						) ; if rexM
					) ; if upDn
					
		        ) ; if rexMa..
		    ) ; if 
		) ; if length..

	) ; let
)
