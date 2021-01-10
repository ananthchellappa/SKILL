; load "/home/USERNAME/skill/MYpgNetExp.il"
;  46024614 -- 

; Started with solution ID 20309633
; this one requires you to first rename your VDD! and VSS! pins to VDD and VSS - these are one time operations that are simple
; through the replace form 

; it does not rename any pins
; it deletes the net labels 
; at the end, the net expression is NOT displayed (pending SR)

/* USAGE:
SKILL script MYpgNetExp.il can create the net expression on the pin and at the same time take care of the named wire.

Load the SKILL code in CIW:
load "CCSpgNetExp.il"

This defines a procedure named MYpgNetExpCell and it expects 4 arguments:

1. Library name
2. Cell name
3. View name
4. List of power and ground pin names on which net expression needs to be added.

And then call:
MYpgNetExpCell("mylib" "mycell" "schematic" list("VDD" "VSS"))

To make this change on all schematics of a given library call:
MYpgNetExpLib("mylib" list("VDD" "VSS"))

*/

procedure( MYpgNetExpCell(libName cellName viewName powerPinNames "tttl")
	let((cv netId netName locNet glbNet netExpr dummyNet)
		;Open schematic
		cv = dbOpenCellViewByType(libName cellName viewName "schematic" "a")
		printf("\tAll Nets in Schematic:\n\t%L\n\n" cv~>nets~>name)
		printf("\tAll Terms in Schematic:\n\t%L\n\n" cv~>nets~>term~>name)

		foreach(pwrPin powerPinNames

			foreach( net cv~>nets
				if(net~>name == pwrPin then
					foreach( fig net~>figs
						when( fig~>objType == "label"
							dbDeleteObject(fig)
							) ;when
						) ;foreach
					); if
			) ;foreach


			if( dbFindNetByName(cv pwrPin)~>term then
				netId = dbFindTermByName(cv pwrPin)
				netName = netId~>name
				locNet = dbFindNetByName(cv pwrPin)
				glbNet = dbFindNetByName(cv strcat(pwrPin "!"))
	
				printf("\tFound Power Pin Net: %L->%L\n" netId pwrPin)

				if(and(locNet glbNet) then
					printf("\t\tFound Global Power Pin Net: %L->%L\n" glbNet glbNet~>name)
					warn("\t\tGlobal Power Pin Net %L will short with Net %L\n" glbNet~>name pwrPin)
					netExpr = strcat( "[@" pwrPin ":%:" glbNet~>name "]" )
				else
				netExpr = strcat( "[@" pwrPin ":%:" pwrPin "!]" )

				); if

				if(dbGetTermNetExpr(dbFindTermByName(cv pwrPin)) then
					printf("\t\tFound Terminal Net Expression: %L\n" dbGetTermNetExpr(netId))
					printf("\t\tReplacing Old Net Expression Label %s to New Net Expression Label %s\n" dbGetTermNetExpr(netId) netExpr)
					dbDeleteObject(glbNet)
					dbReplaceTermNetExpr(netId netExpr)
					t
				else
					printf("\t\tNo Terminal Net Expression Found on Net: %L\n" dbFindTermByName(cv pwrPin)~>name)
					printf("\t\tCreating New Net Expression Label %s at Net %s\n" netExpr netName)
; 					dbCreateTermNetExpr(netId netExpr)
	; below : Pragati's suggestion - 46024614 - didn't help - still no display of the net expression.. (was typo issue cdr iso cadr
	; 9/7 -- works fine
					foreach(fig netId~>pins~>fig
						schCreateNetExpression(cv netExpr fig car(fig~>xy):cadr(fig~>xy)+0.05 "centerCenter" "R0" "fixed" 0.0625)
					)

					t
				); if */
			); if

		); foreach

		;Run schematic check and Save
		schCheck(cv)
		dbSave(cv)
		dbClose(cv)
	); let
); procedure

procedure(MYpgNetExpLib(library powerPinNames "tl")
	prog( (cellNo libName cellName viewName pin)
		foreach( pin powerPinNames 
			if( rexMatchp( " " pin ) then
				println( "Please check your list again - spaces not permitted");
				nil
				return()
			)
		) ; foreach
		unless(libName=ddGetObj(library) error("Library %s does not exists\n" library))
		cellNo = 0
		foreach(cell libName~>cells
			if(exists(x cell~>views~>name (x=="schematic")) then
				cellNo = cellNo + 1
				libName = library
				cellName = cell~>name
				viewName = "schematic"
				printf("%d.\tProcessing cell %s\n" cellNo cellName)
				MYpgNetExpCell(libName cellName viewName powerPinNames)
			) ;if
		);foreach
	);prog
) ; procedure 
