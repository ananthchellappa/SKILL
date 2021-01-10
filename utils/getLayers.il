; usage
; getLayers( "myLib" "/tmp/layers.txt" )
; will generate a CSV of cellName, layers
; you then need to run a perl script to build a master device/layer table
procedure( getLayers( libName ofile )
	let( (cv sh cell dump )
		dump = outfile( ofile )
		foreach( cell ddGetObj( libName )~>cells 
			if( lindex( cell~>views~>name "layout" )
			then
				cv = dbOpenCellViewByType( libName cell~>name "layout" "maskLayout" "r" )
				fprintf( dump "%s,%s\n" cell~>name buildString( cv~>layerPurposePairs~>layerName "," )  )
			) ; if
		) ; foreach
		close( dump )
	) ; let
) ; procedure


