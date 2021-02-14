; you select an instance and some wire labels
; then, it run, it will look at the name of the instance
; if the name is xSOMETHING, then it will append _SOMETHING to
; each label ... intelligently :)
; xSOMETHING --> label_SOMETHING
; x_SOMETHING --> label_SOMETHING
; label<1:0> --> label_SOMETHING<1:O>
procedure( tag_labels( )
	let( ( pcre pat name tag inst )
		if( "r" == geGetWindowCellView()~>mode
		then
			println("No action : read-only cellview")
		else
			foreach( obj geGetSelSet()
				if( "inst" == obj~>objType
				then
					name = obj~>name
				)
			) ; foreach obj
			pcre = pcreCompile( "x_?(.+)")
			if( pcreExecute( pcre name ) && ( length(geGetSelSet() ) > 1 )
			then
				tag = pcreSubstitute( "\\1" )
				pat = pcreCompile( "(<.+>)?$" )
				foreach( obj geGetSelSet()
					if( "label" == obj~>objType
					then
						pcreExecute( pat obj~>theLabel )
						obj~>theLabel = pcreReplace( pat obj~>theLabel strcat( "_" tag pcreSubstitute("\\1") ) 1)
					)
				) ; for
			else
				println("Either no label selected or no instance named xSOMETHING selected")
			) ; if matched by rexExecute
		) ; if readonly
	);let
) ; proc
