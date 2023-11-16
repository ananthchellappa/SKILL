procedure( instTitleBlk()

	if( 0 < length( geGetSelSet() )
	then
		openSelReadOnly()
	else
		MYLIB=schCreateInstForm->libraryName->value
		MYCELL=schCreateInstForm->cellName->value
		MYVIEW=schCreateInstForm->viewName->value
		schHiCreateInst(geGetEditCellView()~>libName "title_blk" "symbol")
	)
)
