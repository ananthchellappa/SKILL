; load "/home/achellap/skill/CreateLibManSelInst.il"

procedure( CreateLibManSelInst()

	let( (lib cell view);local variables
		id = ddsGetLibManLCV()
		lib = car( id )
		cell = cadr( id )
		view = caddr( id )
			if( and( "" != lib , "" != cell )
			then
				if( "schematic" == hiGetCurrentWindow()~>cellView~>cellViewType
				then
					if( "" != view
					then
						schHiCreateInst( lib cell view )
					else
						schHiCreateInst( lib cell "symbol" )	; ideally would check this exists :)
					) ; if
				else
					view = "layout"
; leCreateInstLForm->cellName->value="anlg_cntl"
					hiRegTimer("leCreateInstLForm->cellName->value=cell" 10)
					hiRegTimer("leCreateInstLForm->viewName->value=view" 10)
					leHiCreateInst( hiGetCurrentWindow() )
				)
			else
				println( "Need a Lib AND a cell selected :) ")
			) ; if

	) ; lef
)
