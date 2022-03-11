procedure( note_lib_cell()
	let( (selObj txt cid  )
		selObj = car( geGetSelSet() )
		if( (  geGetSelSet()  && ( "label" == selObj~>objType ) )
		then
			rexCompile( "\n" )
			txt = rexReplace( selObj~>theLabel " " 0 )
			rexCompile( "[(i!)]" )
			txt = rexReplace( txt "" 0 )
			cid = ipcBeginProcess( strcat( "echo " txt " | perl -n ~/SKILL/perl/extr_lib_cell.pl" ) )
            ipcWait(cid)
			txt = ipcReadProcess( cid 30)

		) ; if
	) ; let
) ; procedure

