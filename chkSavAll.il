procedure( chkSavAll( library ) )
	lib = ddGetObj(library)
	cellNo = 0
	foreach(cell libName~>cells
		if(exists(x cell~>views~>name (x=="schematic")) then
			cellNo = cellNo + 1
			libName = lib~>name
			cellName = cell~>name
			viewName = "schematic"
	        cv = dbOpenCellViewByType(libName cellName viewName "schematic" "a")
	        schCheck(cv)
	        dbSave(cv)

		) ;if
	);foreach
); proc
