; this is intended for use with the output of something like HSIM
procedure(CCSclip()
cid = ipcBeginProcess("~/bin/myXclip")
hiRegTimer("CLIPDATA = ipcReadProcess( cid )" 5)
ipcWaitForProcess(cid 1)
)

hiSetBindKey("Schematics" "Alt<Key>h" "CCSclip() hiRegTimer(\"zoomNetVA(CLIPDATA)\" 10)")
; hiSetBindKey("Schematics" "<Key>F10" "CCSclip() hiRegTimer(\"zoomNetVA(CLIPDATA)\" 10)")

procedure( zoomNetVA(CLIPDATA)
    let(( cid text node nodePath instList xx fig prsOp itrName itrNum l r)
        if( (geGetWindowCellView() != geGetTopLevelCellView() )
                schHiReturnToTop()
        ) ; if
/*
;         cid = ipcBeginProcess("xclip -o")
;         cid = ipcBeginProcess("xclip -o")
; that is 
; xclip -o | perl -p -e 's/\\//g;s/VT\("\/([^"]+)"\)/$1/;s/\//./g;'
; from look at the IPC skill reference
;         ipcWaitForProcess(cid)
;         text = ipcReadProcess(cid 1)
; ; from Vikas
; hiRegTimer("text = ipcReadProcess( cid )" 10)
; ipcWaitForProcess(cid 1)
*/
        println("Here's the text : ")
        println(CLIPDATA)

        nodePath = parseString(CLIPDATA "./\n")
        node = car(reverse(nodePath))
        instList = reverse(cdr(reverse(nodePath)))
        hierDescend( instList )

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
            println("not arrayed")
            geSelectObject(fig)
        ) ; if
        

        hiPan( hiGetCurrentWindow() centerBox(car(geGetSelSet())~>bBox))
        hiZoomRelativeScale( hiGetCurrentWindow() 3.0)
    ) ; let
)



