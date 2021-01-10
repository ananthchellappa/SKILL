procedure( unqElements( l "l" )
    (let (lout elem )
        lout = list()
        foreach( elem l
            unless( member( elem lout )
                lout = append( lout list( elem ) )
            ) ; unless
        )
        lout
    ) ; let
) ; procedure
