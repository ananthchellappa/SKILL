; load "/home/achellap/skill/subJumpBack.il"

procedure( subJumpBack()
	let( (i times )
		times = length( parseString( hierPath "/" ) )
		
		for( i 1 times-1 schHiReturn() )
		MYReturn()
		
	) ; let
)

