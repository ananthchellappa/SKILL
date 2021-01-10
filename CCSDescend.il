procedure(CCSNoQueryUserSchHiDescend( itrNum )
    if( 0 > itrNum    ; meaning -1 was received
    then
        envSetVal("schematic" "descendTarget" 'string "use viewNameList")
        if( (1 < car( geGetSelSet()~>numInst) )
        then
            hiRegTimer("hiFormDone(schDescendIterForm)" 8)
            hiRegTimer("hiiSetCurrentForm('schDescendIterForm)" 5)
        )
	    schHiDescendRead()
    else
        hiRegTimer("hiFormDone(schDescendIterForm)" 10)
        CCSQueryUserSchHiDescend()
	hiRegTimer("hiiSetCurrentForm('schDescendIterForm)" 2)
    ) ; if
)

procedure(CCSQueryUserSchHiDescend()
envSetVal("schematic" "descendTarget" 'string "query user")
hiRegTimer("schDescendIterForm->schIterNumField->value = itrNum" 2) 
schHiDescendRead()
)

procedure( hierDescend(instList)
    let((cv instName x inst prsOp itrName itrNum l r)
        foreach(ele instList
            prsOp = parseString(ele "<>") ; a<2> --> "a" "2"
            if( (length(prsOp) > 1)
            then
                itrName = strcat(car(prsOp) "<") ; searching for "a<" is more efficient
                itrNum = atoi( cadr(prsOp ) )       ; "2" --> 2
                cv = geGetEditCellView()
                foreach( xx cv~>instances
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
                                CCSNoQueryUserSchHiDescend(itrNum)
                            else
                                if( (r >= itrNum) && (l <= itrNum)
                                    then
                                    geSelectFig(xx)     ; poorly named <0:7>
                                    CCSNoQueryUserSchHiDescend(itrNum)
                                ) ; if (r >=
                            ) ; if (1 >=
                        else
                            if( ( xx~>name == ele )
                                then
                                geSelectFig(xx)
                                CCSNoQueryUserSchHiDescend(-1)
                            ) ; if (xx
                        ) ; if (3
                    ) ; if rex
                ) ; foreach xx
            else
                x=dbFindAnyInstByName(geGetEditCellView()  ele)
                geSelectFig(x)
                CCSNoQueryUserSchHiDescend(-1)
            ) ; if
        ) ; foreach
    ) ; let
)

