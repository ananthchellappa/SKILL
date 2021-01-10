; usage :
; open the symbol you want the add this property to..
; setInstNamePrefix( ) 
; intended to be called only when a symbol is opened, using deRegUserTriggers
; args re-added after :
; *Error* setInstNamePrefix: too many arguments (0 expected, 1 given) - ((nil configId nil libName "AC_Drv_C0" ... ))
; deRegUserTriggers("schematicSymbol" 'setInstNamePrefix nil nil )



procedure( setInstNamePrefix( args )
  let( (prop cellView)
  	cellView = geGetEditCellView()
    ;; when the cellView object is indeed a cellView
    when( and( cellView~>objType == "cellView" "symbol" == cellView~>viewName "r" != cellView~>mode )
      if( prop = dbFindProp(cellView "instNamePrefix" )
        ;; and when the instNamePrefix property can be found
      then
 ;; unless the property is already what we want.. x<name>_ then.. force it..
 			unless( prop~>value == strcat( "x" lowerCase(cellView~>cellName) "_" )
 			  prop~>value = strcat( "x" lowerCase(cellView~>cellName) "_" )
			  printf( "########### Property instNamePrefix was hit for cell %s\n" cellView~>cellName )
			  hiGetAttention()
 			); unless
      else dbCreateProp(cellView "instNamePrefix" "string" strcat( "x" lowerCase(cellView~>cellName) "_" ) ) ;;else
			  printf( "########### Property instNamePrefix was added for cell %s\n" cellView~>cellName )
			  hiGetAttention()
	  		; we want x_addhd2_1
      );if
    ); when
  );
); procedure CCSsetInstNamePrefix
