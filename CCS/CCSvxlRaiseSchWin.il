; Subrata G 46770331
procedure(CCSvxlRaiseSchWin()
	let(( layWin schWin )
		layWin=hiGetCurrentWindow()

		schWin=car(setof(x hiGetWindowList() (x~>cellView~>libName== lxGetSource(layWin)~>libName)&&(x~>cellView~>cellName== lxGetSource(layWin)~>cellName) &&(x~>cellView~>viewName== lxGetSource(layWin)~>viewName)))

		hiDeiconifyWindow(schWin)
		hiRaiseWindow(schWin)

	)
)

hiSetBindKey("Layout" "Alt <Key>h" "CCSvxlRaiseSchWin()" )
