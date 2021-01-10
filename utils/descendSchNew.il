(let (n instId pathVector bindInfo wid myFileSpec)
    (when (instId = car(geGetSelSet()) )
    n = instId~>name;
    rexCompile(":[0-9]>");

    n = rexReplace(n ">" 1);   take care of arrayed instances
        wid = hiGetCurrentWindow()
        (setq pathVector (deGetVector wid))
        if( pathVector
            then
                (setq bindInfo
                      (hdbBind
                          pathVector
                          (dbGetq instId libName)
                          (dbGetq instId cellName)
                          (dbGetq instId viewName)
                          (dbGetq instId name)
                          nil nil nil
                       )
                ) ; setq
                ;-----------------------------------------------------------
                ; The third entry in the list is the view used
                ;-----------------------------------------------------------
;                 viewNameList = list( caddr(bindInfo) )
                myFileSpec = list(nil 'instanceName n 'viewNameList caddr(bindInfo) );
                dePush( myFileSpec wid "read");
            else
                geSwitch( wid "r" instId 0 0 0) ; when you're not viewing a config
        ) ; if
    ) ; when
) ; let


