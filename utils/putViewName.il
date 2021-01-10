procedure( putViewName()
    let( (selObj)
        selObj = car( geGetSelSet() )
        if( ( (nil == geGetSelSet() )  || ( "label" != selObj~>objType ) )
        then
        ; if nothing selected
            schHiCreateNoteLabel( ?text geGetWindowCellView()~>viewName )
        else
            selObj~>theLabel = geGetWindowCellView()~>viewName
        ) ; if
    ) ; let
) ; procedure
