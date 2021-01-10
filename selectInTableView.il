procedure( selectInTableView()

	let( (inst cv nwin cmd combo);local variables

		unless(and(cv = geGetEditRep() cv~>cellViewType== "schematic") error("Current design window is not schematic"))

		unless(and( length(geGetSelSet()) == 1 car(geGetSelSet())~>objType == "inst")
		  error("Either selected object is not instance or none/multiple objects are selected!")
		)
		inst=car(geGetSelSet())
		_cn = inst~>cellName
		printf("\nCellName: %L\n" _cn)

		foreach( win hiGetWindowList() 
			if( hiGetAppType( win) == "Cadence Hierarchy Editor"
			then
				nwin = cadr(parseString(sprintf(nil "%L" win ) ":"))
				win->hedViewTab->value = "0"
				_hedSetColumnHidden( win->hedPartsTable 0 0)
				_hedSortByColumn( win->hedPartsTable 2 0)

				combo = sprintf(nil "%L" car(setof(x evalstring(sprintf(nil "win->hiToolbars->hedToolbar_win%s" nwin))->? rexMatchp("SearchCombo" sprintf(nil "%L" x)))))
;_seeHiTbSetMatchTypeOption(window(18)->hiToolbars->hedToolbar_win18->hedSearchCombo_1 "exactly")
				cmd = buildString( list("_seeHiTbSetMatchTypeOption(window(" nwin ")->hiToolbars->hedToolbar_win" nwin "->" combo " \"exactly\" )" ) "" ) ; cmd = bu..
				println(cmd)
				hiEnqueueCmd(cmd)
				hiSetCurrentWindow(win)
;_seeHiTbSetMatchCaseOption(window(18)->hiToolbars->hedToolbar_win18->hedSearchCombo_1 "sensitive")
				cmd = buildString( list("_seeHiTbSetMatchTypeOption(window(" nwin ")->hiToolbars->hedToolbar_win" nwin "->" combo " \"sensitive\" )" ) "" ) ; cmd = bu..
				println(cmd)
				hiEnqueueCmd(cmd)
				hiSetCurrentWindow(win)

				;_seeHiTbRun(window(8)->hiToolbars->hedToolbar_win8->hedSearchCombo_1 "DTYPER")
				cmd = buildString( list("_seeHiTbRun(window(" nwin ")->hiToolbars->hedToolbar_win" nwin "->" combo " _cn )" ) "" ) ; cmd = bu..
				println(cmd)
				hiEnqueueCmd(cmd)
				hiSetCurrentWindow(win)
				;hiFlush()
				;_seeHiTbSelect(window(8)->hiToolbars->hedToolbar_win8->hedSearchCombo_1 1 1)
				cmd = buildString( list("_seeHiTbSelect(window(" nwin ")->hiToolbars->hedToolbar_win" nwin "->" combo " 1 1)" ) "" ) ; cmd = bu..
				println(cmd)
				hiEnqueueCmd( cmd)
			)
		) ; foreach
	) ; let
)
