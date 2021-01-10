load "/home/USERNAME/SKILL/unqList.il"

procedure( rePlotOverlay()
	; get the names of the existing plots.. assume ordinal number in list *is* strip #
	let( ( i Lw )
		Lw = awvGetWaveNameList( awvGetCurrentWindow() ?subwindow 1 )
		i = 1
		foreach( x unqList( cadr(Lw) ) awvPlotExpression( awvGetCurrentWindow() x nil ?stripNumber list(i++) ?lineThickness list("Medium") ) )
	) ; let
)

