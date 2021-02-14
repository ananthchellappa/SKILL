; load "/home/achellap/skill/CreateLibManSelInst.il"

procedure( CreateLibManSelInst()

	let( (lib cell view);local variables
		id = ddsGetLibManLCV()
		lib = car( id )
		cell = cadr( id )
		view = caddr( id )
			if( and( "" != lib , "" != cell )
			then
				if( "" != view
				then
					schHiCreateInst( lib cell view )
				else
					schHiCreateInst( lib cell "symbol" )	; ideally would check this exists :)
				) ; if 
			else
				println( "Need a Lib AND a cell selected :) ")
			) ; if

	) ; lef
)
