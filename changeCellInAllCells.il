;; load "/home/USERNAME/SKILL/changeCellInAllCells.il"

; usage
; changeCellInAllCells( "myLib" "DFF" "nmos" "nmos4" ?oldLib "analogLib" ?newLib "ahdlLib" ?doChkSav t)

procedure( changeCellInAllCells( libName cellNameMatch cellName newCell @key oldLib newLib (doChkSav nil) )
	let( (cv inst prop cell x objId spec )
		foreach( cell setof( x ddGetObj(libName)~>cells rexMatchp( cellNameMatch x~>name ) ) 
			if( lindex( cell~>views~>name "schematic" )
			then
				printf("Operating on %s\n" cell~>name )
				objId = ddGetObj( libName cell~>name "schematic" )
				spec = gdmCreateSpecFromDDID(objId)
				if( member(  car( reverse( parseString( caar( setof(x gdmstatus(spec 6) rexMatchp("sch.oa gdm" car(x))) ) ) ) )  list( "gdmStateCO"  "gdmStateNone" ) )
				then
					cv = dbOpenCellViewByType( libName cell~>name "schematic" "" "a" )
					if( and( boundp('oldLib) , boundp('newLib) )
					then
						CCSchangeCells( cellName newCell ?oldLib oldLib ?newLib newLib ?cv cv )
					else
						if( boundp('oldLib)
						then
							CCSchangeCells( cellName newCell ?oldLib oldLib ?cv cv )
						)
						if( boundp('newLib)
						then
							CCSchangeCells( cellName newCell ?newLib newLib ?cv cv )
						)
					) ; boundp	
					if( doChkSav
					then
						schCheck( cv )
						dbSave( cv )
					)
					dbClose( cv )									
				) ; if gdmState
			) ; if
		) ; foreach
	) ; let
) ; procedure


