
procedure(cpLibCell2Clipboard()

; instance (selected) or nothing selected : clipboard will have LibName/CellName

   let((inst cv lib cell tbLib tbCell );local variables

	if( 0 < length( geGetSelSet() ) 	; nothing selected? Then use the cellName of the viewed Schematic
	then
	   inst=car(geGetSelSet())
	   if(inst~>objType == "inst" then
	    	lib = inst~>libName
			cell = inst~>cellName
	       else
			   printf(" No instance selected \n")
	   );if
	else
		cv = geGetWindowCellView()
	    	lib = cv~>libName
			cell = cv~>cellName
	) ; if length


	system( buildString( list( "echo -n " lib "/" cell " | xclip" ) "" ) )
    );let
);procedure


