; this is intended for use with the output of something like HSIM
; updated to Vikas' style on 1/31/2013 - not working the way it used to :(
; then worked perfectly :)
procedure( zoomInst(CLIPDATA)
    let(( cid text inst instPath instList itrName itrNum l r prsOp )
        if( (geGetWindowCellView() != geGetTopLevelCellView() )
                schHiReturnToTop()
        ) ; if
; ; ;         cid = ipcBeginProcess("xclip -o")
; ;         cid = ipcBeginProcess("~/bin/myXclip")
; ; ; trial and tribulation - \\ gets you one past cadence, you need one
; ; ; more to get past perl
; ;         ipcWaitForProcess(cid)
; ; ; from look at the IPC skill reference
; ;         text = ipcReadProcess(cid 1)
; ;         println(text)
        instPath = parseString(CLIPDATA ".")    ; typically what sim output is..
        inst = car(reverse(instPath))
        instList = reverse(cdr(reverse(instPath)))
        hierDescend( instList )

        prsOp = parseString(inst "<>") ; a<2> --> "a" "2"
        if( (length(prsOp) > 1)
        then
            itrName = strcat(car(prsOp) "<") ; searching for "a<" is more efficient
            itrNum = atoi( cadr(prsOp ) )       ; "2" --> 2
            foreach( xx geGetEditCellView()~>instances
                if( rexMatchp(itrName xx~>name)
                then
                    prsOp = parseString( xx~>name "<:>") ; b<4:0> --> "b" "4" "0"
                    if( (3 == length(prsOp) )
                    then
                    l = atoi( cadr(prsOp) )
                    r = atoi( caddr(prsOp) )
                        if( (l >= itrNum) && (r <= itrNum)
                        then
                            geSelectFig(xx)
                        else
                            if( (r >= itrNum) && (l <= itrNum)
                                then
                                geSelectFig(xx)     ; poorly named <0:7>
                            ) ; if (r >=
                        ) ; if (1 >=
                    else
                        if( ( xx~>name == ele )
                            then
                            geSelectFig(xx)
                        ) ; if (xx
                    ) ; if (3
                ) ; if rex
            ) ; foreach xx
        else
            geSelectObject( dbFindAnyInstByName(geGetEditCellView() inst) ) 
        ) ; if


        hiPan( hiGetCurrentWindow() centerBox(car(geGetSelSet())~>bBox))
        hiZoomRelativeScale( hiGetCurrentWindow() 3.0)
    ) ; let
)
