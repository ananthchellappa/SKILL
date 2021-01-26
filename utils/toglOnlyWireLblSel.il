procedure( toglOnlyWireLblSel()
	if( member( "allSchObj" schGetEnv("schematicSelectFilter") )
	then
		schSetEnv( "schematicSelectFilter" cons( "wireName" setof( x schGetEnv("schematicSelectFilter") x != "allSchObj" ) ) )
	else
		schSetEnv( "schematicSelectFilter" cons( "allSchObj" schGetEnv("schematicSelectFilter") ) )
	)
)
