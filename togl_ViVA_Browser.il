procedure( togl_ViVA_Browser()
	let( ( win nwin cmd) ; local variables
		win = hiGetCurrentWindow()
		nwin = cadr(parseString(sprintf(nil "%L" win ) ":"))
		cmd = buildString( list( "_deUpdateWindowMenu('__vvWindowMenu" nwin " " nwin ")" ) "" )
		hiEnqueueCmd(cmd)

			; "AssistSlider109->browser->checked=!AssistSlider109->browser->checked"
		cmd = buildString( list( "AssistSlider" nwin "->browser->checked=!AssistSlider" nwin "->browser->checked" ) "" )
		hiEnqueueCmd(cmd)
			; hiSetCurrentWindow(win) ; has no effect :)
	) ; let
)
