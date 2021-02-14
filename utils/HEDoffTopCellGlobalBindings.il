procedure( HEDoffTopCellGlobalBindings()
  heHiEditConfig() ; Added 1/10/19
  let( (inst cv nwin cmd combo );local variables
    foreach( win hiGetWindowList()

      if( hiGetAppType( win) == "Cadence Hierarchy Editor"
      then
        nwin = cadr(parseString(sprintf(nil "%L" win ) ":"))
;_hedViewMenu_win8~>hedTopCellAct->checked=nil
        cmd = buildString( list("_hedViewMenu_win" nwin "->hedTopCellAct->checked=nil" ) "" ) ; cmd = bu..
        println(cmd)
        hiEnqueueCmd(cmd)
        hiSetCurrentWindow(win)

;_hedViewMenu_win8->hedGlobalBindingsAct->checked=nil
        cmd = buildString( list("_hedViewMenu_win" nwin "->hedGlobalBindingsAct->checked=nil" ) "" ) ; cmd = bu..
        println(cmd)
        hiEnqueueCmd(cmd)

      )
    ) ; foreach
  ) ; let
)

;hiSetBindKey("Cadence Hierarchy Editor" "Ctrl <Key>1" "HEDoffTopCellGlobalBindings()" )
;hiSetBindKey("Schematics" "Ctrl <Key>1" "HEDoffTopCellGlobalBindings()" )
