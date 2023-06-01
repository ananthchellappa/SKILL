
; works for ADE-L/Assembler Debug env. For Explorer, needs 
; rdbSetCurrentDirectory(axlGetWindowSession(win) finalPath
procedure(CCSPushViVA(result)
  let((win sess hierL res resDir finalPath)
	win=hiGetCurrentWindow()
	unless(rexMatchp("chematic" hiGetAppType(win))
	   error("\nCurrent window is not schematic application ...\n")
	) ;unless
	sess = asiGetSession(win)
	if( "spectre" == sevSession(win)~>simulator
	then
		hierL = geGetInstHier()
	else
		hierL = strcat( "/" geGetTopLevelCellView(win)~>cellName geGetInstHier())
	)
	when(result=="tran"
		res = "tran-tran"
	) ;when
	resDir = asiGetResultsPsfDir(sess)
	finalPath = strcat(resDir "/" res hierL)
	if( car(geGetSelSet())~>objType == "inst"
	then
		finalPath = strcat( finalPath "/" car(geGetSelSet()~>name) )
		println(finalPath)
	)
	rdbSetCurrentDirectory( symbolToString(sevSession(hiGetCurrentWindow())) finalPath)
  ) ;let
) ;proc
; hiSetBindKey("Schematics" "Ctrl Alt<Key>v" "CCSPushViVA(\"tran\")" )
