procedure(CCSschIncreasePinSpacing(direction space "t")
	let((selObjs)
		selObjs		= geGetSelSet()
		snapSpacing	= envGetVal("schematic" "symSnapSpacing")
		objXy		= car(selObjs)~>xy
		objOrient	= car(selObjs)~>orient
		objMag		= car(selObjs)~>mag
		if(direction == "hor" then
			if(space == "+" then
				newXy	= list(snapSpacing 0)
			); if
			if(space == "-" then
				newXy	= list(-snapSpacing 0)
			); if
		); if
		if(direction == "ver" then
			if(space == "+" then
				newXy	= list(0 snapSpacing)
			); if
			if(space == "-" then
				newXy	= list(0 -snapSpacing)
			); if
		); if
		newTransForm	= list(newXy "R0")
		printf("\nOld Transform	= %L\n" car(geGetSelSet())~>transform)
		schStretch(selObjs newTransForm)
		printf("Now Transform	= %L\n\n" car(geGetSelSet())~>transform)
	); let
); procedure

;CCSschIncreasePinSpacing("hor" "-")
;hiSetBindKey("Schematics" "Ctrl<Key>Right" "CCSschIncreasePinSpacing(\"hor\" \"+\")")
;hiSetBindKey("Schematics" "Ctrl<Key>Left" "CCSschIncreasePinSpacing(\"hor\" \"-\")")
;hiSetBindKey("Schematics" "Ctrl<Key>Up" "CCSschIncreasePinSpacing(\"ver\" \"+\")")
;hiSetBindKey("Schematics" "Ctrl<Key>Down" "CCSschIncreasePinSpacing(\"ver\" \"-\")")
