; 11/17 -- we want to Not return to top if the node is at the 

; this is intended for use with the output of something like HSIM
procedure(CCSclip()
cid = ipcBeginProcess("~/bin/myXclip")
hiRegTimer("CLIPDATA = ipcReadProcess( cid )" 5)
ipcWaitForProcess(cid 1)
)

hiSetBindKey("Schematics" "Alt<Key>h" "CCSclip() hiRegTimer(\"zoomNetVA(CLIPDATA)\" 10)")

procedure( zoomNetVA(CLIPDATA @optional (zoom 't) )
    let(( cid text node nodePath instList xx fig prsOp itrName itrNum l r curPath oneAbove )

;		println("Here's the text : ")
		println(CLIPDATA)
		schDeselectAllFig()

        nodePath = parseString(CLIPDATA "./\n")
        node = car(reverse(nodePath))
        instList = reverse(cdr(reverse(nodePath)))
		
		instPath = buildString( append( list("") instList ) "/" )
;		println( instPath )
		
; here's where we need more intelligence - if the instPath contains the current path,
; then, don't return to top.. so, need to regex hacks..

		curPath = geGetInstHier( hiGetCurrentWindow() )
		if(	curPath != instPath
		then
			if( rexMatchp( curPath instPath )	; that is current path is a substring of..
			then
				rexCompile( strcat(curPath "/" ) )
				instList = parseString( rexReplace( instPath  "" 1 ) "/" ) 
			else
			; check if we can get there by just popping back up one..
				oneAbove = buildString( reverse( cdr( reverse( parseString( curPath "/" )  ) ) ) "/" )
				if( rexMatchp( oneAbove instPath )
				then
					rexCompile( strcat( oneAbove "/" ) )
					instList = parseString( rexReplace( instPath  "" 1 ) "/" )
					schHiReturn()
				else
 					if( (geGetWindowCellView() != geGetTopLevelCellView() )
 					        schHiReturnToTop()
 					) ; if
				) ; if rexMatch upToHere
			) ; if rexMatch..
			hierDescend( instList )
		)	; 11/17/16


        prsOp = parseString(node "<>") ; a<2> --> "a" "2"
        if( (length(prsOp) > 1)
        then
            itrName = strcat(car(prsOp) "<") ; searching for "a<" is more efficient
            itrNum = atoi( cadr(prsOp ) )       ; "2" --> 2
            cv = geGetEditCellView()
            foreach( xx cv~>nets
                if( rexMatchp(itrName xx~>name)
                then
                    prsOp = parseString( xx~>name "<:>") ; b<4:0> --> "b" "4" "0"
                    if( (3 == length(prsOp) )
                    then
                    l = atoi( cadr(prsOp) )
                    r = atoi( caddr(prsOp) )
                        if( (l >= itrNum) && (r <= itrNum)
                        then
                            fig = car(dbFindNetByName(geGetEditCellView() xx~>name)~>figs)
                            geSelectObject(fig)
                        else
                            if( (r >= itrNum) && (l <= itrNum)
                                then
                                        ; poorly named <0:7>
                                fig = car(dbFindNetByName(geGetEditCellView() xx~>name)~>figs)
                                geSelectObject(fig)
                            ) ; if (r >=
                        ) ; if (1 >=
                    else
                        if( ( xx~>name == node )
                            then
                            fig = car(dbFindNetByName(geGetEditCellView() node)~>figs)
                            geSelectObject(fig)
                        ) ; if (xx
                    ) ; if (3
                ) ; if rex
            ) ; foreach xx
        else
            fig = car(dbFindNetByName(geGetEditCellView() node)~>figs)
;            println("not arrayed")
            geSelectObject(fig)
        ) ; if
        
;		schHiZoomToSelect() is an option
		schZoomFit( 1.0 0.9 )
        hiPan( hiGetCurrentWindow() centerBox(car(geGetSelSet())~>bBox))
		if( zoom
		then
        	hiZoomRelativeScale( hiGetCurrentWindow() 3.0)
		)
		geDeleteAllProbe(getCurrentWindow() t)
;		hiRegTimer( "geEnterAddNetProbe( hiGetCurrentWindow() list( \"y5\" \"drawing\") )" 20 )
;		geSetProbeUserLPP( list( "y5" "drawing") )
		geAddNetProbe( hiGetCurrentWindow() list( "y5" "drawing") nil t)
		
    ) ; let
)



