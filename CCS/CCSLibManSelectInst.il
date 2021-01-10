procedure(CCSLibManSelectInst()

   let((inst cv refLib);local variables

	if( 0 < length( geGetSelSet() ) 
	then
	   inst=car(geGetSelSet())
	   if(inst~>objType == "inst" then
	       ddsSetLibManLCV(inst~>libName inst~>cellName inst~>viewName)
	       else
			   printf(" No instance selected \n")
	   );if
	else
		cv = geGetWindowCellView()
		ddsSetLibManLCV(cv~>libName cv~>cellName cv~>viewName)	; hit on 9/27 - do this anyways.. :)
		if( rexMatchp( "_sim$" cv~>cellName)
		; means it's something like DUT_sim so now we want to instantiate DUT! :)
		then
			if( rexMatchp( "_[Ss]im$" cv~>libName )
			then
				rexCompile( "_[Ss]im$" )
				refLib = rexReplace( cv~>libName "" 0)
				schHiCreateInst( ?libraryName refLib
					?cellName rexReplace( cv~>cellName "" 0) ?viewName "symbol" )
			else
				rexCompile( "_sim$" )
				schHiCreateInst( ?libraryName cv~>libName
					?cellName rexReplace( cv~>cellName "" 0) ?viewName "symbol" )
			)
		) ; if rexM..
	) ; if length
    );let
   );procedure

hiSetBindKey("Schematics" "Ctrl Alt<Key>s" "CCSLibManSelectInst()")
hiSetBindKey("Layout" "Ctrl Alt<Key>s" "CCSLibManSelectInst()")
