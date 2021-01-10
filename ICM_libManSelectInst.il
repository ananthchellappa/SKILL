procedure(ICM_libManSelectInst()
	ICM_libman()
   let((inst cv refLib libCell);local variables

	if( 0 < length( geGetSelSet() ) 
	then
	   inst=car(geGetSelSet())
	   if(inst~>objType == "inst" then
	       ICM_selectLibMan(inst~>libName inst~>cellName inst~>viewName)
	       else
	    	 libCell = note_lib_cell(  )
			 if( libCell 
			 then
				libCell = parseString( libCell " " )
				while( 1 < length( libCell )
					if( ddGetObj( car( libCell) cadr( libCell ) )
					then
						ICM_selectLibMan( car(libCell) cadr(libCell) )
					)
					libCell = cddr( libCell )
					
				) ; while 1 <				
			 else
			   printf(" No instance or text selected \n")
			 ) ; if libCell
	   );if
	else
		cv = geGetWindowCellView()
		ICM_selectLibMan(cv~>libName cv~>cellName cv~>viewName)	; hit on 9/27 - do this anyways.. :)
	) ; if length
    );let
   );procedure

hiSetBindKey("Schematics" "Alt Shift<Key>s" "ICM_libManSelectInst()")
hiSetBindKey("Layout" "Alt Shift<Key>s" "ICM_libManSelectInst()")

