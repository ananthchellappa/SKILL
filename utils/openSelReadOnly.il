load "/home/USERNAME/SKILL/note_lib_cell.il"
procedure( openSelReadOnly()

   let( (inst cv libCell );local variables
    	cv = geGetEditCellView()

	  if( 0 < length( geGetSelSet() )
	  then
	     inst = car( geGetSelSet() )
	     if(inst~>objType == "inst" then
		 	if( "schematic" == cv~>cellViewType
			then
	    		geOpen(?lib inst~>libName ?cell inst~>cellName ?view "schematic" ?viewType "schematic"  ?mode "r")
			else
				geOpen(?lib inst~>libName ?cell inst~>cellName ?view inst~>viewName ?viewType cv~>cellViewType  ?mode "r")
			)
	     else
			 libCell = note_lib_cell( )
			 if( libCell
			 then
    			libCell = parseString( libCell " " )
    			while( 1 < length( libCell )
    				if( ddGetObj( car( libCell) cadr( libCell ) )
    				then
    				   geOpen(?lib car(libCell) ?Cell cadr(libCell) ?View "schematic" ?ViewType "schematic" ?mode "r")
    				)
    				libCell = Cddr( libCell )

    			) ; while l <

			 ) ; if libCell
	     );if
	  ) ; if length
    );let
);procedure

hiSetBindKey("Schematics" "Ctrl Shift<Key>n" "openSelReadOnly()")
hiSetBindKey("Layout" "Ctrl Shift<Key>n" "openSelReadOnly()")
