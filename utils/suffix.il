SUFFIX=0

procedure( putSuffix() 
    let( (obj elems)
        if( "r" == geGetWindowCellView()~>mode
        then
            println("No action : read-only cellview")
        else
			if( not(boundp('SUFFIX) || not(stringp(SUFFIX)) )
			then
				println("No action : please set SUFFIX to a string")
			else
				unless( rexMatchp( "^_" SUFFIX )
					SUFFIX = strcat( "_" SUFFIX)
				)
	            foreach( obj geGetSelSet()
	                if( "label" == obj~>objType
	                    if( rexMatchp( "<" obj~>theLabel )	; a bus<2:0> 
						then
							elems = parseString( obj~>theLabel "<" )
							if( not(rexMatchp( strcat(SUFFIX "$") car(elems) ) )
							then ; doesn't have the suffix already
								obj~>theLabel = strcat( car(elems) SUFFIX "<" cadr(elems) )							
							)
						else
							if( not(rexMatchp( strcat(SUFFIX "$") obj~>theLabel ) )
							then
								obj~>theLabel = strcat( obj~>theLabel SUFFIX )
							)
						)
	                )
				) ; foreach
			) ;if boundp
		) ; if
	); let
)

procedure( rmvSuffix()
	let( (obj pat)
		if( not(boundp('SUFFIX) || not(stringp(SUFFIX)) )
		then
			println("No action : please set SUFFIX to a string")
		else
			unless( rexMatchp( "^_" SUFFIX )
				SUFFIX = strcat( "_" SUFFIX)
			)
	        foreach( obj geGetSelSet()
	            if( "label" == obj~>objType
	                if( rexMatchp( "<" obj~>theLabel )	; a bus<2:0> 
					then
						pat = pcreCompile( strcat(SUFFIX "<") )
						obj~>theLabel = pcreReplace( pat obj~>theLabel "<" 1 )
					else
						pat = pcreCompile( strcat(SUFFIX "$") )
						obj~>theLabel = pcreReplace( pat obj~>theLabel "" 1 )
					)
	            ) ; if
			) ; foreach
		) ;if boundp
	
	) ; let
)

procedure( getSuffix()
	let( (obj pat)
	    foreach( obj geGetSelSet()
	        if( "label" == obj~>objType
	            if( rexMatchp( "<" obj~>theLabel )	; a bus<2:0> 
				then
					pat = pcreCompile( "(_[^_]+)<" )
					if( pcreExecute( pat obj~>theLabel)
						SUFFIX = pcreSubstitute( "\\1")
					)
				else
					pat = pcreCompile( "(_[^_]+)$" )
					if( pcreExecute( pat obj~>theLabel)
						SUFFIX = pcreSubstitute( "\\1")
					)
				)
	        ) ; if
		) ; foreach
	) ; let
)
