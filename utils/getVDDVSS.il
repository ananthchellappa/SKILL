procedure( getVDDVSS()

; usage : set a bindkey such as Ctrl Shift<Key>G to run this
; select an instance whose VDD and VSS properties you want to capture..

    let( (s)

        s=geGetSelSet()

        foreach( prop car(s~>prop)

            if( equal("VDD" prop~>name) 
                then
                    lastVDD = prop~>value
            ) ; if

            if( equal("VSS" prop~>name) 
                then
                    lastVSS = prop~>value
            ) ; if

        ) ; foreach

    ) ; let
) ; proc

procedure( getVCC()

; usage : set a bindkey such as Ctrl Shift<Key>G to run this
; select an instance whose VDD and VSS properties you want to capture..

    let( (s)

        s=geGetSelSet()

        foreach( prop car(s~>prop)

            if( equal("VCC" prop~>name) 
                then
                    lastVCC = prop~>value
            ) ; if


        ) ; foreach

    ) ; let
) ; proc
