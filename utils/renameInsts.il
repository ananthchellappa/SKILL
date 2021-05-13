; the first selected instance is the master - lends its name to the others.. 
; if not already terminating in "A", an "A" will be appended to its name
procedure( renameInsts(    )
	if( ! setof(obj geGetSelSet() obj~>objType == "inst")
	then
		println( "Need a selection of instances to proceed")
	else
		let( ( inst master baseName index namelems)
			master = car( geGetSelSet() )
			if( rexMatchp( ">" master~>name )
			then
				namelems = parseString( master~>name "<:>" )
				index = 1
				foreach( inst cdr( geGetSelSet() )
					inst~>name = strcat( nth( 0 namelems) "<" itos( atoi(nth( 1 namelems)) + index ) ">" )
				) ; foreach
			else
				rexCompile( "A$" )
				index = 66
				baseName = rexReplace( master~>name "" 1)
				master~>name = strcat( baseName "A" )
				foreach( inst cdr( geGetSelSet() )
					inst~>name = strcat( baseName intToChar( index++ ) )
				) ; foreach
			)
		) ; let
	) ; if
) ; proc
