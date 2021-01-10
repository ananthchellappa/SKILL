; original ver Pankaj Gautam - doesn't work - shifts all objects same amount
; also didn't account for -ve numbers in the coordinates..
; new version - infer orientation - use first and last item in selected list to
; calculate distance, number of objects and distance are all you need
; note that objects MUST be selected in proper order!!! very critical!!!

; how? If abs(x separation ) > abs( y separation) then you want to stretch horizontally



procedure(schIncreasePinSpacing( space )
	let( ( direction unitsep obj count snapSpacing newx newy firstx firsty firstxy lastxy add)
        firstxy = car( geGetSelSet() )~>xy
        lastxy = car( reverse(geGetSelSet() ) )~>xy
		snapSpacing	= envGetVal("schematic" "symSnapSpacing")
        if( (abs( car(firstxy) - car( lastxy ) ) > abs( cadr(firstxy) - cadr(lastxy) ) )
        then
            direction  = "hor"
            unitsep = abs( round( (car(firstxy) - car( lastxy ) ) /
                (snapSpacing * ( length( geGetSelSet() ) - 1 ) ) 
                            ) ) ; round, abs
            if( ( car( firstxy) < car( lastxy ) )
            then
                add = 1.0
            else
                add = -1.0
            ) ; if
        else
            direction = "ver"
            unitsep = abs( round( (cadr(firstxy) - cadr(lastxy) ) /
                (snapSpacing * ( length( geGetSelSet() ) - 1 ) )
                            ) ); round, abs
            if( ( cadr( firstxy) < cadr( lastxy ) )
            then
                add = 1.0
            else
                add = -1.0
            ) ; if
        ) ; else
        count = 0
; 		objXy		= car(geGetSelSet)~>xy
; 		objOrient	= car(selObjs)~>orient

        firstx = car( firstxy )
        firsty = cadr( firstxy )
        foreach( obj geGetSelSet() 
	        if(direction == "hor" then
	            if("+" == space then
	            	newx	= firstx + (unitsep + 1)*snapSpacing* add * count
	            ); if
	            if("-" == space then
	            	newx	= firstx + (unitsep - 1)*snapSpacing* add * count
	            ); if
                obj~>xy = list( newx firsty )
	        ); if
	        if(direction == "ver" then
	            if("+" == space then
	            	newy	= firsty + (unitsep + 1)*snapSpacing* add * count
	            ); if
	            if("-" == space then
	            	newy	= firsty + (unitsep - 1)*snapSpacing* add * count
	            ); if
                obj~>xy = list( firstx newy )
	        ); if
            count++
        ) ; foreach
	); let
); procedure

; schIncreasePinSpacing( "+" )
