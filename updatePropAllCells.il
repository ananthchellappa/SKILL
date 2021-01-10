load "/home/achellappa/skill/CCS/CCSinvokeCdfCallbacks.il"
load "/home/achellappa/skill/CCS/CCSCdfCallbackEntireLib.il"

; usage
; updatePropAllCells( "myLib" "NMout" " )
; will change all notes in all "schematic" views
; finger width in MX is fw
procedure( updatePropAllCells( libName cellNameMatch instName propName propVal )
	let( (cv inst prop cell x objId spec )
		foreach( cell setof( x ddGetObj(libName)~>cells rexMatchp( cellNameMatch x~>name ) ) 
			if( lindex( cell~>views~>name "schematic" )
			then
				printf("Operating on %s\n" cell~>name )
				objId = ddGetObj( libName cell~>name "schematic" )
				spec = gdmCreateSpecFromDDID(objId)
				if( member( cadr( parseString( caar( reverse( gdmstatus( spec 6 ) ) ) ) ) list( "gdmStateCO"  "gdmStateNone" ) )
				then
					cv = dbOpenCellViewByType( libName cell~>name "schematic" "" "a" )
					inst = car( dbFindMemInstByName(cv instName ) )
					prop = setof( x inst~>prop propName==x~>name)
					prop~>value = propVal
	;				CCSinvokeCdfCallbacks( cv )
					schCheck( cv )
					dbSave( cv )
					dbClose( cv )
				) ; if gdmState
			) ; if
		) ; foreach
	) ; let
) ; procedure


