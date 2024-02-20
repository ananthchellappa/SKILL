;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function    : CCSviaColRow
;;; Description : Given a reference via, place a new via using exactly the
;;;               same parameters, but with a different number of col/rows.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

procedure( CCSviaColRows(ref deltaRow deltaCol @optional (doVerbose nil) "dnng")
  let( ( techId mid viaHead viaParams row col newVia (thefun "CCSviaColRow") )
  
    ;;; this function works only with standard vias ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
   unless( ref~>objType == "stdVia"
      error( "%s:ERR00: Please select a standard via\n" thefun )
    ) ; unless
    
    ;;; in case the original via is rotated, exchange deltaRow/deltaCol ;;;;;;;;

    when( member( ref~>orient list("R90" "R270" "MYR90" "MXR90") )
      row      = deltaRow
      deltaRow = deltaCol
      deltaCol = row
      when( doVerbose
        info( "[%s] Rotated - row=%L ; col=%L\n" thefun deltaRow deltaCol )
      ) ; when
    ) ; when
    
    ;;; store the master ID (viaHeader) that will be used to create the new Via;

    techId  = techGetTechFile( ref~>cellView )
    viaHead = ref~>viaHeader
    mid     = techFindViaDefByName( techId viaHead~>viaDefName )
    
    ;;; define default rows/columns (in case no overried exists for them) ;;;;;;

    row = max( 1  nth( 3 viaHead~>viaDef~>params ) + deltaRow )
    col = max( 1  nth( 4 viaHead~>viaDef~>params ) + deltaCol )
    
    ;;; process existing params and create a new params-list with modified r/c ;

    foreach( par viaHead~>overrideParams
      case( car(par)
        ( "cutRows"
          row = max(1  cadr(par) + deltaRow )
          viaParams = cons( list("cutRows" row) viaParams )
          row = nil ; already added to the list of params
        )
        ( "cutColumns"
          col = max(1  cadr(par) + deltaCol )
          viaParams = cons( list("cutColumns" col) viaParams )
          col = nil ; already added to the list of params
        )
        ( t ; add all other params without any change
          viaParams = cons( par viaParams )
        )
      ) ; case
    ) ; foreach (par)
    
    ;;; if col/row values are still available, then add them ;;;;;;;;;;;;;;;;;;;

    when( row  viaParams = cons( list("cutRows"    row) viaParams ) )
    when( col  viaParams = cons( list("cutColumns" col) viaParams ) )

    ;;; create the new via and return its handle ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    newVia = dbCreateVia( ref~>cellView mid ref~>xy ref~>orient viaParams )
    if( dbobjectp(newVia) then
      dbDeleteObject( ref )
      geSelectObject( newVia ) ; keep the via selected
    else
      error( "%s:ERR01: Problem during via creation\n" thefun )
    ) ; if
    newVia

  ) ; let
) ; procedure CCSviaColRow

procedure( CCSviaColRow(viaList deltaRow deltaCol)
let(()
viaList=setof(via viaList via~>objType=="stdVia")
foreach(via viaList
	CCSviaColRows(via deltaRow deltaCol)
	)
))

hiSetBindKey( "Layout" "Ctrl Alt Shift<Btn4Down>" "CCSviaColRow( geGetSelSet()  1  1 )" )
hiSetBindKey( "Layout" "Ctrl Alt Shift<Btn5Down>" "CCSviaColRow( geGetSelSet()  -1  -1 )" )
hiSetBindKey( "Layout" "Ctrl Shift<Btn4Down>" "CCSviaColRow( geGetSelSet()  0  1 )" )
hiSetBindKey( "Layout" "Ctrl Shift<Btn5Down>" "CCSviaColRow( geGetSelSet()  0  -1 )" )
hiSetBindKey( "Layout" "Ctrl Alt<Btn4Down>" "CCSviaColRow( geGetSelSet()  1  0 )" )
hiSetBindKey( "Layout" "Ctrl Alt<Btn5Down>" "CCSviaColRow( geGetSelSet()  -1  0 )" )

