procedure( txpose_inst_label( upDn ) 
    let( (inst wire namelems saved_sel nw bigger pcv np opname newobs npname dir xy orient)
        if( "r" == geGetWindowCellView()~>mode
        then
            println("No action : read-only cellview")
        else
			rexCompile( " +" )
            foreach( obj geGetSelSet()

				if( "inst" == obj~>objType 
				then
					obj~>name = txpose_bus( obj~>name upDn )
					saved_sel = append( saved_sel list( obj ) )
				)
				if( "term" == obj~>owner->objType
				then
					pcv = dbOpenCellViewByType( "basic" obj~>parent~>cellName "symbol" "" 'r)
					opname = obj->owner->name
					npname = rexReplace( buildString(list( "temp_" txpose_bus(opname upDn ) "") ) "" 0 ) ; not sure why I get the "temp_ xxx"
					dir = obj->owner->direction
					xy = obj->parent->xy
					orient = obj->parent->orient
					schDelete( obj->parent )
					np = schCreatePin( geGetWindowCellView() pcv npname dir nil xy  orient	)
					np~>pin->term~>name = txpose_bus(opname upDn )
					saved_sel = append( saved_sel list( car( np->children) ) )  ; keeping fingers crossed there - for the label :)
				)
				if( "label" == obj~>objType
					obj~>theLabel = txpose_bus( obj~>theLabel upDn )
					saved_sel = append( saved_sel list( obj ) )
				)

            ) ; foreach obj
            ; now, recreate the sel set..
			foreach( obj saved_sel geSelectObject(obj) )
        ) ; if readonly
    ) ; let
) ; proc


