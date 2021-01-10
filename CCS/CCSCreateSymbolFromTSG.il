/*************************************************************************
 * DISCLAIMER: The following code is provided for Cadence customers       *
 * to use at their own risk. The code may require modification to         *
 * satisfy the requirements of any user. The code and any modifications   *
 * to the code may not be compatible with current or future versions of   *
 * Cadence products. THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, *
 * INCLUDING WITHOUT LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED         *
 * WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.         *
 *************************************************************************/

procedure(CCSGetSigDirAndWrite(direction filePointer termList)
	if(member(direction termList~>direction) != nil then
		if(or(direction == "input" direction == "output") then
			fprintf(filePointer "\t%s(" direction)
		else
			fprintf(filePointer "\tio(")
		); if
		foreach(term termList
			if(term~>direction == direction then
				fprintf(filePointer " \"%s\"" term~>name)
			); if
		); foreach
		fprintf(filePointer " )\n")
	); if
); procedure


procedure(CCSCreateSymbolFromTSG(libName cellName viewName @optional (Side "t") (pOrder "D") "tttt")
	let((cvId tsgFile myPort termList rmCommand srcPortOrder)
		unless(ddGetObj(libName cellName viewName)
			error("CCSCreateSymbolFromTSG: %s Cell View for %s->%s not found\n" viewName libName cellName)
			exit(0)
		); unless
		
		printf("\nCCSCreateSymbolFromTSG: Making Symbol view of cell %s->%s\n" libName cellName)
		cvId	= dbOpenCellViewByType(libName cellName viewName)
		tsgFile	= strcat(libName "_" cellName "_" viewName ".tsg")
		myPort	= outfile(tsgFile "w")
		termList=cvId~>nets~>term

		foreach(srcProp cvId~>prop
			if(srcProp~>name == "portOrder" then
				srcPortOrder = srcProp~>value
			); if
		); foreach

		fprintf(myPort "defcell(\"%s\"\n" cellName)
		
		CCSGetSigDirAndWrite("input" myPort termList)
		CCSGetSigDirAndWrite("output" myPort termList)
		CCSGetSigDirAndWrite("inputOutput" myPort termList)
		;CCSGetSigDirAndWrite("switch" myPort termList)
		;CCSGetSigDirAndWrite("jumper" myPort termList)
		;CCSGetSigDirAndWrite("tristate" myPort termList)
		;CCSGetSigDirAndWrite("unused" myPort termList)
		
		fprintf(myPort "	defsymbol(\n")
		fprintf(myPort "		symbolProps(\n")
		fprintf(myPort "			vendorName = \"\"\n")
		fprintf(myPort "			partName = \"%s\"\n" cellName)
		fprintf(myPort "			timeVal = time(\"%s\")\n" getCurrentTime())
		;fprintf(myPort "			portOrder = %L\n" srcPortOrder)
		fprintf(myPort "		); symbolProps\n")

		fprintf(myPort "		symbolParam(\n")
		fprintf(myPort "			wireSpacing  = 0.125000\n")
		fprintf(myPort "			wireLength   = 0.125000\n")
		fprintf(myPort "			labelHeight  = 0.062500\n")
		fprintf(myPort "			vSideLength  = 0.000000\n")
		fprintf(myPort "			hSideLength  = 0.000000\n")
		fprintf(myPort "			origin       = topLeftPin\n")
		fprintf(myPort "			pinConnector = \"block\"\n")  ;; other values square, circle
; 		fprintf(myPort "			pinConnector = \"square\"\n")  ;; other values block, circle
		fprintf(myPort "		); symbolParam\n")

		fprintf(myPort "		pinLocSpec(\n")
		
		case(Side 
			("left"
				fprintf(myPort "			leftPins( ")
				printf("CCSCreateSymbolFromTSG: \n")
				if(pOrder == "A" || pOrder == nil then
					for(i 0 length(srcPortOrder)
						printf("                        Creating Pin %L\n" nth(i srcPortOrder))
						if(nth(i srcPortOrder) != nil then
							fprintf(myPort "\"%s\" " nth(i srcPortOrder))
						); if
					); for
				else
					for(i 0 length(srcPortOrder)
						printf("                        Creating Pin %L\n" nth(i reverse(srcPortOrder)))
						if(nth(i reverse(srcPortOrder)) != nil then
							fprintf(myPort "\"%s\" " nth(i reverse(srcPortOrder)))
						);
					); for
				); if
			); left
		
			("right"
				fprintf(myPort "			rightPins( ")
				printf("CCSCreateSymbolFromTSG: \n")
				if(pOrder == "A" || pOrder == nil then
					for(i 0 length(srcPortOrder)
						printf("                        Creating Pin %L\n" nth(i srcPortOrder))
						if(nth(i srcPortOrder) != nil then
							fprintf(myPort "\"%s\" " nth(i srcPortOrder))
						); if
					); for
				else
					for(i 0 length(srcPortOrder)
						printf("                        Creating Pin %L\n" nth(i reverse(srcPortOrder)))
						if(nth(i reverse(srcPortOrder)) != nil then
							fprintf(myPort "\"%s\" " nth(i reverse(srcPortOrder)))
						); if
					); for
				); if
			);right
		
			("top"
				fprintf(myPort "			topPins( ")
				printf("CCSCreateSymbolFromTSG: \n")
				if(pOrder == "A" || pOrder == nil then
					for(i 0 length(srcPortOrder)
						printf("                        Creating Pin %L\n" nth(i srcPortOrder))
						if(nth(i srcPortOrder) != nil then
							fprintf(myPort "\"%s\" " nth(i srcPortOrder))
						); if
					); for
				else
					for(i 0 length(srcPortOrder)
						printf("                        Creating Pin %L\n" nth(i reverse(srcPortOrder)))
						if(nth(i reverse(srcPortOrder)) != nil then
							fprintf(myPort "\"%s\" " nth(i reverse(srcPortOrder)))
						); if
					); for
				); if
			);top
		
			("bottom"
				fprintf(myPort "			bottomPins( ")
				printf("CCSCreateSymbolFromTSG: \n")
				if(pOrder == "A" || pOrder == nil then
					for(i 0 length(srcPortOrder)
						printf("                        Creating Pin %L\n" nth(i srcPortOrder))
						if(nth(i srcPortOrder) != nil then
							fprintf(myPort "\"%s\" " nth(i srcPortOrder))
						); if
					); foreach
				else
					for(i 0 length(srcPortOrder)
						printf("                        Creating Pin %L\n" nth(i reverse(srcPortOrder)))
						if(nth(i reverse(srcPortOrder)) != nil then
							fprintf(myPort "\"%s\" " nth(i reverse(srcPortOrder)))
						); if
					); for
				); if
			); bottom
	
			(t
				fprintf(myPort "			leftPins( ")
				foreach(term termList
					if(term~>direction == "input" then
						fprintf(myPort " \"%s\"" term~>name)
					); if
				); foreach
				fprintf(myPort ")\n")
			
				fprintf(myPort "			rightPins( ")
				foreach(term termList
					if(term~>direction == "output" then
						fprintf(myPort " \"%s\"" term~>name)
					); if
				); foreach
		
			);t
		
		);case
		
		fprintf(myPort ")\n")
		fprintf(myPort "		); pinLocSpec\n")
	
		fprintf(myPort "	); defsymbol\n")
		fprintf(myPort "); defcell\n")

		close(myPort)
		tsg(libName strcat("./" libName "_" cellName "_" viewName ".tsg") prependInstallPath("samples/symbolGen/default.tsg"))
; above gives shaped pins - shape indicates I, O, I/O
; below gives the default square pins
;        tsg(libName strcat("./" libName "_" cellName "_" viewName ".tsg") prependInstallPath("samples/symbolGen/package.tsg"))
		rmCommand = strcat("rm -rf ./" libName "_" cellName "_" viewName ".tsg")
		printf("\nCCSCreateSymbolFromTSG: Removing \"%s\"\n\n" rmCommand)
		system(rmCommand)
		t
		CCSsyncPortOrder(libName cellName viewName)
		t
		dbClose(cvId)
	); let
); procedure

procedure(CCSsyncPortOrder(libName cellName viewName "ttt")
	let((cellId cv_verilog cv_symbol pinlist_ver pinlist_sym)
		cellId = ddGetObj(libName cellName)

		if(exists(x cellId~>views~>name (x=="symbol")) && exists(y cellId~>views~>name (y==viewName)) then
			printf("CCSsyncPortOrder: symbol View and %s view are present\n\n" viewName)
			cv_verilog	= dbOpenCellViewByType(libName cellName viewName "" "r")
			pinlist_ver	= cv_verilog~>portOrder
			cv_symbol	= dbOpenCellViewByType(libName cellName "symbol" "" "a")
			pinlist_sym	= cv_symbol~>portOrder
			printf("CCSsyncPortOrder: portOrder of %s->%s->%s\n" libName cellName viewName)
			printf("                  %L\n\n" cv_verilog~>portOrder)

			printf("CCSsyncPortOrder: portOrder of %s->%s->%s\n" cv_symbol~>libName cv_symbol~>cellName cv_symbol~>viewName)
			printf("                  %L\n\n" cv_symbol~>portOrder)
			if(pinlist_ver!=pinlist_sym then
				printf("CCSsyncPortOrder: Synchronizing portorder of %s cell's symbol view as per portorder of verilog view \n\n" cellName) 
				schEditPinOrder(cv_symbol pinlist_ver nil)
				dbSave(cv_symbol)
				printf("\nCCSsyncPortOrder: portOrder of %s->%s->%s\n" cv_symbol~>libName cv_symbol~>cellName cv_symbol~>viewName)
				printf("                  %L\n\n" cv_symbol~>portOrder)
				dbClose(cv_symbol)
				dbClose(cv_verilog)
			else
				printf("CCSsyncPortOrder: %s cell's symbol view and verilog view has got same portorder, no changes done\n" cellName) 
			) ;if
		else
			printf("CCSsyncPortOrder: %s cell doesn't have either symbol or verilog view, going to examine next cell\n" cellName~>name)
		) ;if
	) ;let
) ;procedure

;CCSCreateSymbolFromTSG("Symbol_Creation" "parallel_crc_ccitt" "verilog" "bottom")
;CCSCreateSymbolFromTSG("Symbol_Creation" "parallel_crc_ccitt" "verilog")
;CCSCreateSymbolFromTSG("Symbol_Creation" "trial_symgen" "pinout" "right" "D")
