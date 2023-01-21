; use a bindkey to select all of the same libName,cellName as the selected instance
; nothing selected? Then use selection in the library manager

procedure( selSimilar( )
	let( (cv inst sought id)
		cv = geGetEditCellView(getCurrentWindow())
		if( 0 < length( geGetSelSet() )
		then
			lib = car(geGetSelSet() )~>libName
			cell = car(geGetSelSet() )~>cellName
		else
			id = ddsGetLibManLCV()
			lib = car( id )
			cell = cadr( id )
		)
		foreach( inst cv~>instances
			if( and(inst~>libName == lib, if( "" != cell then inst~>cellName == cell else t ) )
			then
				geSelectFig( inst )
			)
		)
	); let
) ; procedure
