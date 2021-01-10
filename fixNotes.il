; usage
; fixNotes( "myLib" "4 um" "5 um" )
; will change all notes in all "schematic" views
procedure( fixNotes( libName cellNameMatch match replace  )
	let( (cv sh cell i )
		foreach( cell setof( x ddGetObj(libName)~>cells rexMatchp( cellNameMatch x~>name ) ) 
			rexCompile( match )
			if( lindex( cell~>views~>name "schematic" )
			then
				printf("Operating on %s\n" cell~>name )
				cv = dbOpenCellViewByType( libName cell~>name "schematic" "" "a" )
				i = 1
				foreach( sh setof( sh cv~>shapes "label" == sh~>objType )
					if( "text" == car( sh~>lpp )	; ("text" "drawing")
					then
						sh~>theLabel = rexReplace( sh~>theLabel replace 0 )
					)
				) ; foreach
				schCheck( cv )
				dbSave( cv )
				dbClose( cv )
			) ; if
		) ; foreach
	) ; let
) ; procedure


