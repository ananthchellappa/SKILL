load "/home/achellappa/skill/CCS/CCSinvokeCdfCallbacks.il"
load "/home/achellappa/skill/CCS/CCSCdfCallbackEntireLib.il"

; usage
; updateInstNameAllCells( "myLib" "NOR*X" "NM23" "NMdrive" )
; will change all notes in all "schematic" views
; finger width in MX is fw
procedure( updateInstNameAllCells( libName cellNameMatch instName newName )
	let( (cv inst prop cell x objId spec )
		foreach( cell setof( x ddGetObj(libName)~>cells rexMatchp( cellNameMatch x~>name ) ) 
			if( lindex( cell~>views~>name "schematic" )
			then
				printf("Operating on %s\n" cell~>name )
				objId = ddGetObj( libName cell~>name "schematic" )
				spec = gdmCreateSpecFromDDID(objId)
				if( member( car( reverse( parseString( caar( setof(x gdmstatus(spec 6) rexMatchp("sch.oa gdm" car(x))) ) ) ) ) list( "gdmStateCO"  "gdmStateNone" ) )
				then
					cv = dbOpenCellViewByType( libName cell~>name "schematic" "" "a" )
					inst = car( dbFindMemInstByName(cv instName ) )
					inst~>name = newName
					schCheck( cv )
					dbSave( cv )
					dbClose( cv )
				) ; if gdmState
			) ; if
		) ; foreach
	) ; let
) ; procedure


