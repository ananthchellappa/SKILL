procedure( MYdescend( w_query )
	; record instance name and cellName of the instance
	; descend, then add instance name to the descend_chain list only if cellName of the window
	; w~>cellView~>cellName

	let( (w current dont_update iname icell instStuff )
		dont_update = nil
		w = hiGetCurrentWindow()
		current = w~>cellView~>cellName
		if( 1 == w_query 		; want the form to be able to pick non default view
		then
			if( 0 == length( geGetSelSet() )
				; set a flag that says don't mess with the most_recent thing - set it to "none"
				then dont_update = t
				else
					iname = car( geGetSelSet() )~>name
					icell = car( geGetSelSet() )~>cellName
			)
			CCSQueryUserSchHiDescend()
			if( ( w~>cellView~>cellName == icell && !dont_update )	; meaning we did descend using a pre-selected inst
			then
				if( nil == w~>descend_chain 
				then
					w~>descend_chain = list( iname )
				else
					w~>descend_chain = cons( iname w~>descend_chain )
				)
			else
				println( "check!")
			) ; if
		else		; means we were called by CTRL-X
			if( 0 == length( geGetSelSet() )
			then
				if( ( "none" == w~>most_recent ) || ( nil == w~>most_recent )
				then
					hiGetAttention()
					println( "Must select an instance for quick-descend unless there's history..")
				else
					if( instStuff = dbFindMemInstByName((hiGetCurrentWindow()~>cellView) w~>most_recent )
					then
						geSelectFig( car(instStuff) )
						CCSNoQueryUserSchHiDescend(-1)
						w~>descend_chain = cons( w~>most_recent w~>descend_chain )
					)
				) ; if "none..
			else
				iname = car( geGetSelSet() )~>name
				CCSNoQueryUserSchHiDescend(-1)
				if( w~>cellName == icell
				then
					if( nil == w~>descend_chain
					then
						w~>descend_chain = list( iname )
					else
						w~>descend_chain = cons( iname w~>descend_chain )
					)
				) ; if
			) ; if length(..
		) ; if
	
	) ; let
)

procedure( desc_new_tab( tab_opt )
; tab_opt 1 for new tab, 0 for new window
	let( (rv)
		rv = envGetVal("schematic" "descendCanvasType" 'string)
		if( 1 == tab_opt
		then
			envSetVal("schematic" "descendCanvasType" 'string "new tab")
		else
			envSetVal("schematic" "descendCanvasType" 'string "new window")
		)
		MYdescend(0)
		envSetVal("schematic" "descendCanvasType" 'string rv)
	)
)

procedure( descend_lowest_itrnum()
	let( (iname name_bits)
		if( 1 == length( geGetSelSet() )
		then
		    iname = car(geGetSelSet())~>name
		    if( rexMatchp(":" iname) 
		    then
		        name_bits = parseString(iname "<:>")
			CCSNoQueryUserSchHiDescend(atoi(nthelem(3 name_bits)))
		    )
		)
	)
)
