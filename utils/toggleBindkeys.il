standard_bks = nil

procedure( toggleBindkeys()

	if( standard_bks then
		standard_bks = nil
		load( buildString( list(logpath "custom_bks.il" ) "/" ) )
		println( "Now using C U S T O M bindkeys" )
	else
		standard_bks = t
		CCSexportAllBindKeys( buildString( list(logpath "custom_bks.il" ) "/" ) )
		load( buildString( list(logpath "std_bks.il" ) "/" ) )
		println( "Now using DEFAULT bindkeys" )
	)
)
