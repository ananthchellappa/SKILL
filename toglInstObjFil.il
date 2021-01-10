procedure( toglInstObjFil()
	foreach( item schGetEnv("schematicSelectFilter"  )
		if( "allInstObj" == item
			schSetEnv("schematicSelectFilter" '("allSchObj" "instancePin") )
		)
		if( "instancePin" == item
			schSetEnv("schematicSelectFilter" '("allSchObj" "allInstObj") )
		)
	) ; foreach
)


hiSetBindKey("Schematics" "Ctrl <Key>p" "toglInstObjFil()")
