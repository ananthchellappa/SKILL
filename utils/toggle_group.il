procedure( toggle_group()
    if( 1 == length(geGetSelSet()) && "figGroup" == car(geGetSelSet())~>objType
    then
        leHiUngroup()
    else
        leHiCreateGroup()
    )
)
hiSetBindKey("Layout" "Ctrl <Key>g" "toggle_group()")
