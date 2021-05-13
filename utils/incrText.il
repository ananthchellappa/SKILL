procedure( incrText( incDecb ) ; 1 for increment, -1 for decrement (so not truly logic :)
    if( ! setof(obj geGetSelSet() obj~>objType == "label")
    then
        println( "Need a selection of text objects to proceed")
    else
        let( ( master base obj)
            master = car( geGetSelSet() )
            if( cdr( geGetSelSet() )
            then
                if( rexMatchp( "^[a-zA-Z]$" master~>theLabel )
                then
                    base = charToInt( stringToSymbol( master~>theLabel ) )
                    foreach( obj cdr( geGetSelSet() )
                        obj~>theLabel = symbolToString( intToChar( base + incDecb ) )
                        base = base + incDecb
                    ) ; foreach
                else
                    if( rexMatchp( "^[0-9]+$" master~>theLabel )
                    then
                        base = atoi( master~>theLabel )
                        foreach( obj cdr( geGetSelSet() )
                            obj~>theLabel = itos( base + incDecb )
                            base = base + incDecb
                        ) ; foreach
                    )
                ) ; if
            else
                if( rexMatchp( "^[a-zA-Z]$" master~>theLabel )
                then
                    master~>theLabel = symbolToString( intToChar( incDecb + charToInt( stringToSymbol( master~>theLabel ) ) ) )
                else
                    if( rexMatchp( "?[0-9]+$" master~>theLabel )
                    then
                        master~>theLabel = itos( atoi(master~>theLabel) + incDecb )
                    ) ; if rex
                ) ; if rex
            ) ; if cdr


        ) ; let
    ) ; if
) ; proc

