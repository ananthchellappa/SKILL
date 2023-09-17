procedure(CCScreateAutoVia(point @key (cvId geGetEditCellView()) ) ; point : list( x y)
 let( (OptionsFormDisplaySetting)

  OptionsFormDisplaySetting = envGetVal("ui" "showOptionForms") 

 ; Set options form display to nil
 envSetVal("ui" "showOptionForms" 'boolean nil)

  unless(cvId && cvId~>objType=="cellView"
   error("Please pass a valid cellview ID\n")
   );unless

  unless(isContextLoaded("via")
   loadContext(sprintf(nil "%s/etc/context/64bit/via.cxt" car(getInstallPath()) ) )
  );unless

 hiEnqueueCmd("
  hiGetCurrentForm()->viaMode->value= \"Auto\"
  hiGetCurrentForm()->rodAutoName->value= t
 ")

  preXY(point)
  hiEnqueueCmd("finishEnterFun()" )

  ; GUI Create Via Command call
  leHiCreateVia()

 ; Set options form display back to original value  envSetVal("ui" "showOptionForms" 'boolean OptionsFormDisplaySetting)

 );let
);procedure CCScreateAutoVia
