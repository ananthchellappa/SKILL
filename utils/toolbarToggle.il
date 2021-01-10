procedure( toolbarToggle()
    if( 0==toggler then
        toggler=1
		_deHideAllToolbars()
    else
        toggler=0
		_deShowAllToolbars()
    )

)

hiSetBindKey("Schematics" "Ctrl <Key>F2" "toolbarToggle()")
hiSetBindKey("vivaGraph" "Ctrl<Key>F2" "toolbarToggle()")
