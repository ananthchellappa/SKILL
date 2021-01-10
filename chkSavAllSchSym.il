; usage
; chkSavAllSchSym( "myLib" "AND5V" )
; will change all notes in all "schematic" views
procedure( chkSavAllSchSym( libName cellNameMatch  )
	let( (cv sh cell )
		foreach( cell ddGetObj( libName )~>cells 
			if( rexMatchp( cellNameMatch cell~>name )
			then
				if( lindex( cell~>views~>name "schematic" )
				then
					printf("Operating on schematic of %s\n" cell~>name )
					cv = dbOpenCellViewByType( libName cell~>name "schematic" "" "a" )
					schCheck( cv )
					dbSave( cv )
					dbClose( cv )
				) ; if
				if( lindex( cell~>views~>name "symbol" )
				then
					printf("Operating on symbol of %s\n" cell~>name )
					cv = dbOpenCellViewByType( libName cell~>name "symbol" "" "a" )
					schVIC( cv )
					dbSave( cv )
					dbClose( cv )
				) ; if
			) ; if rexM..
		) ; foreach
	) ; let
) ; procedure


