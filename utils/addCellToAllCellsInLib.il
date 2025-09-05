; load "/home/USERNAME/SKILL/utils/addInstToSchematic.il"

procedure( addCellToAllCellsInLib( editLibName libName cellName @key (doChkSav nil ) ( notIfEmpty t) )
    let( ( cell imID ) 
        foreach( cell ddGetObj(editLibName)~>cells
            if( lindex( cell~>views~>name "schematic" )
            then
                imID = dbOpenCellViewByType(libName cellName "symbol" "schematicSymbol" "r")
                printf("Operating on %s\n" cell~>name )
                objId = ddGetObj( editLibName cell~>name "schematic" )
                spec = gdmCreateSpecFromDDID(objId)
                if( not(gdmstatus(spec 6)) || member(  car( reverse( parseString( caar( setof(x gdmstatus(spec 6) rexMatchp("sch.oa gdm" car(x))) ) ) ) )  list( "gdmStateCO"  "gdmStateNone" ) )
                then
                    addInstToSchematic( editLibName cell~>name "schematic" imID ?doChkSav doChkSav ?notIfEmpty notIfEmpty)
                )
            )
        ); foreach
    ); let
)
