procedure( getPlotsAsText()
		; create a text note containing the names of the waveforms currently displayed, one per line..
		; get the names of the existing plots.. assume ordinal number in list *is* strip #
		let( ( note i Lw j)
			note = ""
			foreach( j awvGetOnSubwindowList( awvGetCurrentWindow() )
				Lw = awvGetWaveList( awvGetCurrentWindow() ?subwindow j )
				i=1
				foreach( x unqElements( cadr(Lw) )
					note = strcat( note sprintf(nil "%L\n" famGetExpr(x) ) )
				       ) ; foreach x
			       ) ; foreach j
		   ) ; let
		schHiCreateNoteLabel( ?text note )
	 )

	load "/home/USERNAME/skill/unqElements.il" ; tweeks wasn't cutting it — wasn't getting right order :(
			; note, you get the waveforms uing getPlotsAsText()
			procedure( plotTextWaves()
				; get the names of the existing plots.. assume ordinal number in list *is* strip #
				let( ( selObj i )
					selObj = car( geGetSelSet() )
					if( !( (nil == geGetSelSet() ) || ( "label" != selObj~>objType ) )
						then
						i = 1
						foreach( x unqElements( parseString( selObj~>theLabel "\n" ) )
							awvPlotExpression( awvGetCurrentWindow() sprintf(nil "%L" x ) nil ?stripNumber list(i++) ?lineThickness list("Thick") )
						       ) ; foreach x
					  ); if
				   ) ; let
				)
