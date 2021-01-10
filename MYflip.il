procedure( MYflip( hVB ) 
	let( (sense)
		if( 1 == hVB
		then
			sense = "sideways"
		else
			sense = "upsideDown"
		)
		if(  !(nil == hiGetCurrentCmd( hiGetCurrentWindow() ) )
		then
			schSetEnv( sense t ) 
			println( "Lame action" )
		else
			schSetEnv( sense t )
			hiRegTimer( "preXY( car( car( geGetSelSet() )~>bBox ) )" 1 )
			schHiMove()
		) ; if	
	)
)
