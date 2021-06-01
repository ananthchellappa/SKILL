procedure(CCSLibManSelectInst()
	ddsOpenLibManager() 	; Added 1/10/19
   let((inst cv refLib);local variables

	if( 0 < length( geGetSelSet() ) 
	then
	   inst=car(geGetSelSet())
	   if(inst~>objType == "inst" then
	       ddsSetLibManLCV(inst~>libName inst~>cellName inst~>viewName)
	       else
	    	 libCell = note_lib_cell(  )
			 if( libCell 
			 then
				libCell = parseString( libCell " " )
				while( 1 < length( libCell )
					if( ddGetObj( car( libCell) cadr( libCell ) )
					then
						ddsSetLibManLCV( car(libCell) cadr(libCell) )
					)
					libCell = cddr( libCell )
					
				) ; while 1 <				
			 else
			   printf(" No instance or text selected \n")
			 ) ; if libCell
	   )
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
