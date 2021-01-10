schInitAllIcons()

procedure( buildACMenu()
	l_ac_rnd_2_line = hiCreateMenuItem( ?name 'l_ac_rnd_2_line ?itemText "Round Pins 2 Lines" ?callback "roundPinsToLine()" )
	l_ac_sq_2_line = hiCreateMenuItem( ?name 'l_ac_sq_2_line ?itemText "Square Pins 2 Lines" ?callback "squarePinsToLine()" )
	l_ac_arrows = hiCreateMenuItem( ?name 'l_ac_arrows ?itemText "Add Arrows for Counter-Intuitive Pins" ?callback "arrows()" )
	hiCreatePulldownMenu( 'ACmenu "AC Utils" list( l_ac_rnd_2_line l_ac_sq_2_line l_ac_arrows ) )
;	hiInsertBannerMenu( hiGetCurrentWindow() ACmenu 12)

) ; procedure

procedure( disableACMenu( menu window)
	hiDisableMenuItem( menu 'l_ac_rnd_2_line window)
	hiDisableMenuItem( menu 'l_ac_sq_2_line window)
	hiDisableMenuItem( menu 'l_ac_arrows window)
)

procedure( enableACMenu( menu window )
	hiEnableMenuItem( menu 'l_ac_rnd_2_line window)
	hiEnableMenuItem( menu 'l_ac_sq_2_line window)
	hiEnableMenuItem( menu 'l_ac_arrows window)
)

ACMenu = buildACMenu()

schRegisterFixedMenu( "symbol" ACMenu 'disableACMenu 'enableACMenu)
