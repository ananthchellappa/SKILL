procedure( fixPartName( )
	let( (cv label x )
		cv = geGetEditCellView()
		foreach( label  setof( x cv~>shapes x~>objType == "label") 
			if( "[@partName]" == label~>theLabel
			then
				label~>theLabel = "[@cellName]"
			) ; if
		) ; foreach
	) ; let

) ; proc
