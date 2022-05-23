; load "/home/achellap/skill/libManSelectTB.il"

procedure(libManSelectTB()

; intended to take the user to the test-bench in PROJ_TB when the current library is PROJ_SOMETHING

   let((inst cv lib cell tbLib tbCell );local variables
	ddsOpenLibManager() 
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

	rexCompile( "_[^_]+$" )
	tbLib = rexReplace( lib "_TB" 0)
	tbCell = concat( cell "_tb" )

	ddsSetLibManLCV(tbLib tbCell )
    );let
);procedure


hiSetBindKey("Schematics" "Ctrl Alt<Key>t" "libManSelectTB()")
