load "/home/USERNAME/SKILL/utils/unqElements.il" ; tweeks wasn't cutting it ? wasn't getting right order :(
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
		);if
	);let
)
