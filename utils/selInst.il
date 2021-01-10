procedure( selInst(  instName  )
	let( ( inst )
		foreach( inst geGetEditCellView()~>instances
			if( instName == inst~>name
				geDeselectAll()
				geSelectFig( inst )
			)
		) ; foreach 
	) ; let
) ; proc
