procedure(CCSUserPostInstallTrigger_Megha( args )
let( ( )
hiRegTimer("deToggleAssistantVisibility(\"OI Assistant\" )" 1)
hiRegTimer("deToggleAssistantVisibility(\"Tree Assistant\")" 1)
);let
);proc

;deRegUserTriggers( "maskLayout" nil nil 'CCSUserPostInstallTrigger_Megha)
;deRegUserTriggers( "maskLayoutXL" nil nil 'CCSUserPostInstallTrigger_Megha)
deRegUserTriggers( "schematic" nil nil 'CCSUserPostInstallTrigger_Megha)
deRegUserTriggers( "schematicXL" nil nil 'CCSUserPostInstallTrigger_Megha)

procedure(CCSHideToolbar(args)
hiHideToolbar(deFindToolbar("File" hiGetSessionWindow(args->window)))
hiHideToolbar(deFindToolbar("Create" hiGetSessionWindow(args->window)))
hiHideToolbar(deFindToolbar("Edit" hiGetSessionWindow(args->window)))
hiHideToolbar(deFindToolbar("View" hiGetSessionWindow(args->window)))
hiHideToolbar(deFindToolbar("Bookmarks" hiGetSessionWindow(args->window)))
hiHideToolbar(deFindToolbar("Search" hiGetSessionWindow(args->window)))
hiHideToolbar(deFindToolbar("Select" hiGetSessionWindow(args->window)))
hiHideToolbar(deFindToolbar("Go" hiGetSessionWindow(args->window)))
hiHideToolbar(deFindToolbar("Workspaces" hiGetSessionWindow(args->window)))
);proc

;deRegUserTriggers("maskLayout" nil nil 'CCSHideToolbar)
;deRegUserTriggers("maskLayoutXL" nil nil 'CCSHideToolbar)
deRegUserTriggers("schematic" nil nil 'CCSHideToolbar)
deRegUserTriggers("schematicXL" nil nil 'CCSHideToolbar)
