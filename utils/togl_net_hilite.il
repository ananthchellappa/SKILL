procedure( togl_net_hilite()
	if( schViewMenu->NetHighlights->checked == t then
	            schViewMenu->NetHighlights->checked=nil
	            printf("Disabling net highlighting")

	else
	            schViewMenu->NetHighlights->checked=t
	            printf("Enabling net highlighting")
	); if

); proc
