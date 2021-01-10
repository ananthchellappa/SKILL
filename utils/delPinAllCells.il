;; load "/home/USERNAME/SKILL/delPinAllCells.il"
;load "/home/USERNAME/SKILL/CCS/CCSinvokeCdfCallbacks.il"
;load "/home/USERNAME/SKILL/CCS/CCSCdfCallbackEntireLib.il"

; usage
; delPinAllCells( "myLib" "NOR*X" "pinName"  )
; will change all notes in all "schematic" views
; finger width in MX is fw
procedure( delPinAllCells( libName cellNameMatch pinName  )
	let( (cv inst prop cell x objId spec wire )
		foreach( cell setof( x ddGetObj(libName)~>cells rexMatchp( cellNameMatch x~>name ) ) 
			if( lindex( cell~>views~>name "schematic" )
			then
				printf("Operating on %s schematic\n" cell~>name )
				objId = ddGetObj( libName cell~>name "schematic" )
				spec = gdmCreateSpecFromDDID(objId)
				if( member( car( reverse( parseString( caar( setof(x gdmstatus(spec 6) rexMatchp("sch.oa gdm" car(x))) ) ) ) ) list( "gdmStateCO"  "gdmStateNone" ) )
				then
					cv = dbOpenCellViewByType( libName cell~>name "schematic" "" "a" )
					foreach( wire setof( x cv~>shapes pinName == x~>net~>term~>name )
						schDelete(wire)
					)
					if( setof( x cv~>instances pinName == x~>pin~>term~>name  )
						schDelete( car( setof( x cv~>instances pinName == x~>pin~>term~>name  )) )
					)
					schCheck( cv )
					dbSave( cv )
					dbClose( cv )
				) ; if gdmState
			) ; if
			if( lindex( cell~>views~>name "symbol" )
			then
				printf("Operating on %s - symbol\n" cell~>name )
				objId = ddGetObj( libName cell~>name "symbol" )
				spec = gdmCreateSpecFromDDID(objId)
				if( member( car( reverse( parseString( caar( setof(x gdmstatus(spec 6) rexMatchp("symbol.oa gdm" car(x))) ) ) ) ) list( "gdmStateCO"  "gdmStateNone" ) )
				then
					cv = dbOpenCellViewByType( libName cell~>name "symbol" "" "a" )
					if( setof( x cv~>shapes pinName == x~>pin~>term~>name  )
						schDelete( car( setof( x cv~>shapes pinName == x~>pin~>term~>name  )) )
					)
					schVIC( cv )
					dbSave( cv )
					dbClose( cv )
				) ; if gdmState
			) ; if
		) ; foreach
	) ; let
) ; procedure


