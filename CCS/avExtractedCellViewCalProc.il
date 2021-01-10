procedure(avExtractedCellViewCallProc(cv)
let( ( usrTechSetting flag )
    
    foreach( item setof(instances cv~>instances instances~>cellName == "ext_mos")
             if(item~>model == "mm4yped30nj" then
               printf("changeone\n")
               wnom = dbGetPropByName(item "w")
               dbCreateProp( item "wnom" "float" wnom~>value)
               lnom = dbGetPropByName(item "l")
               dbCreateProp( item "lnom" "float" lnom->value)
              )
    )
    dbSetConnCurrent(cv)
    dbSave(cv)
  );let
);proc
