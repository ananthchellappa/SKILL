; Pragati 46026542

procedure(CCSCreateSymbolMenu()
	if(boundp('CCSCreateSymbolMenu)
		then CCSCreateSymbolMenu
		else
			hiCreatePulldownMenu(
				'ACMenu
				"AC Utils"

				list(
					hiCreateMenuItem( ?name 'l_ac_rnd_2_line ?itemText "Round Pins 2 Lines" ?callback "roundPinsToLine()" )
					hiCreateMenuItem( ?name 'l_ac_sq_2_line ?itemText "Square Pins 2 Lines" ?callback "squarePinsToLine()" )
					hiCreateMenuItem( ?name 'l_ac_arrows ?itemText "Add Arrows for Counter-Intuitive Pins" ?callback "arrows()" )
					hiCreateMenuItem( ?name 'l_brwse_fl_nodes ?itemText "Browse Floating Nodes" ?callback "fl_nodes_start()" )
					hiCreateMenuItem( ?name 'l_list_pins ?itemText "List ins" ?callback "list_pins()" )
				    )
				)
		  )
	 )

procedure(CCSUserPostInstallTrigger(args)

		hiInsertBannerMenu(
			args->window
			CCSCreateSymbolMenu()
			length(hiGetBannerMenus(args->window))
			)

	 ) ; procedure

	deRegUserTriggers("schematicSymbol" nil nil 'CCSUserPostInstallTrigger)
	deRegUserTriggers("schematic" nil nil 'CCSUserPostInstallTrigger)
