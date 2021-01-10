procedure( inc_wire_inst( factor ) 
    let( (inst wire namelems saved_sel nw bigger pcv np opname newobs npname dir xy orient)
        if( "r" == geGetWindowCellView()~>mode
        then
            println("No action : read-only cellview")
        else
			if( factor > 1.0 then bigger = 1 else bigger = 0 )
			rexCompile( " +" )
            foreach( obj geGetSelSet()

				if( "inst" == obj~>objType 
				then
					obj~>name = inc_bus( obj~>name bigger )
					saved_sel = append( saved_sel list( obj ) )
				)
				if( "term" == obj~>owner->objType
				then
					pcv = dbOpenCellViewByType( "basic" obj~>parent~>cellName "symbol" "" 'r)
					opname = obj->owner->name
					npname = rexReplace( buildString(list( "temp_" inc_bus(opname bigger ) "") ) "" 0 ) ; not sure why I get the "temp_ xxx"
					dir = obj->owner->direction
					xy = obj->parent->xy
					orient = obj->parent->orient
					schDelete( obj->parent )
					np = schCreatePin( geGetWindowCellView() pcv npname dir nil xy  orient	)
					np~>pin->term~>name = inc_bus(opname bigger )
					saved_sel = append( saved_sel list( car( np->children) ) )  ; keeping fingers crossed there - for the label :)
				)
				if( "label" == obj~>objType
					obj~>theLabel = inc_bus( obj~>theLabel bigger )
					saved_sel = append( saved_sel list( obj ) )
				)

                if( ("line" == obj~>objType) || ( "path" == obj~>objType )
				then
					saved_sel = append( saved_sel list( obj ) )
                    if( and( ( "line" == obj~>objType) (factor > 1.0) )
                        CCSchangeWireWidth( ?width 0.02 ?wires list(obj) )
                    ) ; if
                    if( "path" == obj~>objType
                        if( 0.02 >= obj~>width && factor < 1.0
                        then
                            CCSchangeWireWidth( ?width 0 ?wires list(obj) )
                        else
                            nw = obj~>width / 0.0125
                            if( factor > 1.0
                            then
                                nw = 0.0125 * (nw + 1)
                            else
                                nw = 0.0125 * (nw - 1)
                            ) ; if factor
                            CCSchangeWireWidth( ?width nw ?wires list(obj) )
                        )
                    )
                ) ; if line/wire
            ) ; foreach obj
            ; now, recreate the sel set..
			foreach( obj saved_sel geSelectObject(obj) )
        ) ; if readonly
    ) ; let
) ; proc


