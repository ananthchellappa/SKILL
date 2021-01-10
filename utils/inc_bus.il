procedure( inc_bus(name bigger ) 
	namelems = parseString( name "<:>" )
	if( 1 == length( namelems )
	then
	    if( 1 == bigger
		then
	        buildString( list( nth( 0 namelems ) "<1:0>" ) "" )
		else
			name
	    )
	else
	    if( 1 == bigger
	    then
	        buildString( list( nth( 0 namelems ) "<"
	                                        itos( atoi(nth( 1 namelems)) + 1 )
	                                        ":" nth( 2 namelems) ">" )
	                                "" )
	    else
	        if( 1 == ( atoi(nth( 1 namelems) ) - atoi(nth(2 namelems) ) )
	        then
	            nth( 0 namelems )
	        else
	            buildString( list( nth( 0 namelems ) "<"
	                                            itos( atoi(nth( 1 namelems)) - 1 )
	                                            ":" nth( 2 namelems) ">" )
	                                    "" )
	        ) ; if
	    ) ; if factor
	)


)
