procedure( toglOnlyInstSel()
	if( member( "allSchObj" schGetEnv("schematicSelectFilter") )
	then
		schSetEnv( "schematicSelectFilter" cons( "instance" setof( x schGetEnv("schematicSelectFilter") x != "allSchObj" ) ) )
	else
		schSetEnv( "schematicSelectFilter" cons( "allSchObj" schGetEnv("schematicSelectFilter") ) )
	)
)
