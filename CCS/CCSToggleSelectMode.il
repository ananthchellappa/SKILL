; 7/7/16 Sanjeev Gupta
procedure( CCSToggleSelectMode()
    if( ( hiGetCurrentWindow()->fullSelectionMode=="enclosed" )
           then
               hiGetCurrentWindow()~>fullSelectionMode="enclosedAndCrossed"
           else
               hiGetCurrentWindow()~>fullSelectionMode="enclosed"
	  ) 
)

; hiSetBindKey (used to be magnifier, unused)


hiSetBindKey("Schematics" "Ctrl <Key>m" "CCSToggleSelectMode()")
hiSetBindKey("Symbol" "Ctrl <Key>m" "CCSToggleSelectMode()")
