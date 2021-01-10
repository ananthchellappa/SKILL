; load "/home/USERNAME/skill/listInstPaths.il"


procedure( listInstPaths()
	prog( ()
		then
		if( ( (nil == geGetSelSet() ) || ( "inst" != car( geGetSelSet() )~>objType ) )
		then
		; if nothing selected, 
			println( "Select something and make sure it's an instance" )
			return()
		else
			foreach( inst geGetSelSet()
				if( ("inst" == car( geGetSelSet() )~>objType )
				then
					println( buildString( list( geGetInstHier( hiGetCurrentWindow() ) inst~>name ) "/" ) )
				)
			)
			hierPath = car( geGetSelSet() )~>theLabel
		) ; if
	) ; prog
) ; procedure
