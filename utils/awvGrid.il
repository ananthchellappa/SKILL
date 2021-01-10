procedure(myAwvToggleGrid()
    if( 0==toggler then
        toggler=1
        awvDisplayGrid(awvGetCurrentWindow() t)
    else
        toggler=0
        awvDisplayGrid(awvGetCurrentWindow() nil)
    )
)
