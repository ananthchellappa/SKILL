procedure( sch_grid_togl()
	if( hiGetCurrentWindow()->drawDottedGridOn == t then
	            hiGetCurrentWindow()~>drawGridOn=nil
	            hiGetCurrentWindow()~>drawDottedGridOn=nil
	            printf("Changing Schematic Grid Type to \"none\"")

	else
	            hiGetCurrentWindow()~>drawGridOn=t
	            hiGetCurrentWindow()~>drawDottedGridOn=t
	            printf("Changing Schematic Grid Type to \"dotted\"")
	); if

); proc



; old before 46078971
;     if( 0 == sch_grid_togl then
;         sch_grid_togl = 1
;         hiGetCurrentWindow()~>drawGridOn=t
;         hiGetCurrentWindow()~>drawDottedGridOn=t
;     else
;         sch_grid_togl=0
;         hiGetCurrentWindow()~>drawGridOn=nil
;         hiGetCurrentWindow()~>drawDottedGridOn=nil
;     )
;    
; )



; old, before Sanjeev Kumar 45590144
;     schHiGridOptions()
;     hiiSetCurrentForm('schDisplayOptionsForm)
;     if( 0 == sch_grid_togl then
;         sch_grid_togl = 1
;     schDisplayOptionsForm->gridType->value= "none"
;     else
;         sch_grid_togl=0
;     schDisplayOptionsForm->gridType->value= "dotted"
;     )
;     hiFormDone(schDisplayOptionsForm)

