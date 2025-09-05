load "/home/USERNAME/SKILL/getRightMost.il"

; usage
; addInstToSchematic( lib cell view instMasterID ?doChekSav t)
; instMasterID usually created using dbOpenCellViewByType(mylib cell "symbol" "schematicSymbol" "r")

procedure( addInstToSchematic( libName cellName viewName instMasterID @key (doChkSav nil) ( notIfEmpty t) )
    let( (cv bb_RM )
        cv = dbOpenCellViewByType( libName cellName viewName "" "a" )
        if( ( cv~>instances || not(notIfEmpty) )
        then
    	    bb_RM = getRightMost(cv)
    	    schCreateInst(cv instMasterID nil list(0.0625*(ceiling (2+xCoord(bb_RM))/0.0625) 0.0625*round(yCoord(bb_RM)/0.0625) ) "R0")
    	    if( doChkSav schCheck( cv ) )
    	    dbSave( cv )
    	    dbClose( cv )
        )
    ) ; let
) ; procedure
