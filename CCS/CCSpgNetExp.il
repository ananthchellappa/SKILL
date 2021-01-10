/*************************************************************************
* DISCLAIMER: The following code is provided for Cadence customers       *
* to use at their own risk. The code may require modification to         *
* satisfy the requirements of any user. The code and any modifications   *
* to the code may not be compatible with current or future versions of   *
* Cadence products. THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, *
* INCLUDING WITHOUT LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED         *
* WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.         *
*************************************************************************/
; got 8/28/16
; load "/home/achellappa/skill/CCS/CCSpgNetExp.il"
; deemed not usable : 46024614 -- use my version : MYpgNetExp.il

/* USAGE:
SKILL script CCSpgNetExp.il can create the net expression on the pin and at the same time take care of the named wire.

Load the SKILL code in CIW:
load "CCSpgNetExp.il"

This defines a procedure named CCSpgNetExpCell and it expects 4 arguments:

1. Library name
2. Cell name
3. View name
4. List of power and ground pin names on which net expression needs to be added.

And then call:
CCSpgNetExpCell("mylib" "mycell" "schematic" list("VDD" "VSS"))

To make this change on all schematics of a given library call:
CCSpgNetExpLib("mylib" list("VDD" "VSS"))

*/


procedure(CCSschNetAndTermRename(cvId oldNetname newNetName "dtt")
	let(()
		foreach( term cvId~>terminals
			if(term~>name == oldNetname then
			term~>name = newNetName ;change terminals name
			printf("\tRenamed Terminal %d->%s ---> %d->%s\n" term oldNetname term term~>name)
				); if
			) ;foreach

		foreach( net cvId~>nets
			if(net~>name == oldNetname then
				foreach( fig net~>figs
					when( fig~>objType == "label"
						fig~>theLabel = newNetName ;change the label attached with nets
					printf("\tRenamed Net->Fig->theLabel %d->%s ---> %d->%s\n" net oldNetname net fig~>theLabel)
						) ;when
					) ;foreach
				); if
		) ;foreach
	); let
); procedure

procedure(CCSpgNetExpCell(libName cellName viewName powerPinNames "tttl")
	let((cv netId netName locNet glbNet netExpr dummyNet)
		;Open schematic
		cv = dbOpenCellViewByType(libName cellName viewName "schematic" "a")
		printf("\tAll Nets in Schematic:\n\t%L\n\n" cv~>nets~>name)
		printf("\tAll Terms in Schematic:\n\t%L\n\n" cv~>nets~>term~>name)

		foreach(pwrPin powerPinNames
			if(dbFindNetByName(cv pwrPin)~>term then
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
						CCSschNetAndTermRename(cv pwrPin strcat(pwrPin "!"))
						dbSave(cv)
						t
					else
						printf("\t\tNo Terminal Net Expression Found on Net: %L\n" dbFindTermByName(cv pwrPin)~>name)
						printf("\t\tCreating New Net Expression Label %s at Net %s\n" netExpr netName)
						dbCreateTermNetExpr(netId netExpr)
						CCSschNetAndTermRename(cv pwrPin strcat(pwrPin "!"))
						dbSave(cv)
						t
					); if */
			); if

			if(and(dbFindNetByName(cv pwrPin) dbFindNetByName(cv strcat(pwrPin "!"))) then
				printf("\tNet %s and %s both Found.\n" pwrPin strcat(pwrPin "!"))
				dummyNet = dbFindNetByName(cv pwrPin)
				printf("\tRenaming Dummy Net %d->%s ---> %d->%s....\n" dummyNet dummyNet~>name dummyNet strcat(pwrPin "!"))
						CCSschNetAndTermRename(cv pwrPin strcat(pwrPin "!"))
				dbSave(cv)
				t
			); if
		); foreach

		;Run schematic check and Save
		dbSave(cv)
		t
		schVIC(cv)
		schCheck(cv)
		dbClose(cv)
	); let
); procedure

procedure(CCSpgNetExpLib(library powerPinNames "tl")
let((cellNo libName cellName viewName)
unless(libName=ddGetObj(library) error("Library %s does not exists\n" library))
cellNo = 0
foreach(cell libName~>cells
	if(exists(x cell~>views~>name (x=="schematic")) then
	cellNo = cellNo+1
	libName = library
	cellName = cell~>name
	viewName = "schematic"
	printf("%d.\tProcessing cell %s\n" cellNo cellName)
	CCSpgNetExpCell(libName cellName viewName powerPinNames)
		) ;if
	);foreach
) ;let
) ; procedure 
