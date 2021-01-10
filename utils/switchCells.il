;; load "/home/USERNAME/SKILL/switchCells.il"
load "/home/USERNAME/SKILL/CCS/CCSchangeCells.il"
load "/home/USERNAME/SKILL/unqList.il"

; usage
; switchCells( "NAND" "NOR" "TSMC023")

procedure( switchCells( matchString substString fromLib )
	let( ( cellName newCell x)
		rexCompile( matchString )
			foreach( cellName setof( x unqList(geGetEditCellView()~>instances~>master~>cellName) rexMatchp( matchString x ) )
				newCell = rexReplace( cellName substString 0 )
				if( member( newCell ddGetObj( fromLib )~>cells~>name )
				then
					CCSchangeCells( cellName newCell ?newLib fromLib )
				)
			) ; foreach
	) ; let
) ; proc
