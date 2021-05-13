; load "/home/achellap/skill/copyResVal.il"

; the first selected instance is the master - lends its "res" value (o~>res)
; to the others
procedure( copyResVal(    )
	if( ! setof(obj geGetSelSet() obj~>objType == "inst")
	then
		println( "Need a selection of instances to proceed")
	else
		let( ( inst master )
			master = car( geGetSelSet() )
			foreach( inst cdr( geGetSelSet() )
				if( and( "analogLib" == inst~>libName, "res" == inst~>cellName )
				then
					inst~>r = master~>res
				)
			) ; foreach
		) ; let
	) ; if
) ; proc
; hiSetBindKey("Schematics" "Ctrl Alt<Key>r" "copyResVal()")
