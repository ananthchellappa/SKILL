procedure(vivaGridToggle()
    if( 0==toggler then
        toggler=1
		_vivaGraphGraphMenu->\"setMajorAndMinorGrid\"->checked=t
    else
        toggler=0
		_vivaGraphGraphMenu->\"setMajorAndMinorGrid\"->checked=nil
    )
)
