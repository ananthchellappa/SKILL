procedure( dupl_fet_met() ; process all insts from selected set and add the metal present within each cell at top-level
; uses CCSTransformShpToTopLevel from Cadence - get CCSShapeQuery.il
; https://support.cadence.com/apex/ArticleAttachmentPortal?id=a1Od0000000ukvqEAA

    if( ! setof(obj geGetSelSet() obj~>objType == "inst")
    then
        println( "Need at least one instance selected")
    else
		let( (cv shpList finList lyr myRetList iShpList)
			cv=geGetEditCellView()
			lyr = list("ME1" "drawing")
			finList = nil
 			foreach( obj setof(obj geGetSelSet() obj~>objType == "inst")
				shpList=dbShapeQuery(cv lyr obj~>bBox 1 1) ; one level down only
				; now get the correct coordinates for these shapes at current level
				myRetList=nil
				foreach(item shpList
					if(listp(item) then
				    ; shape is within hierarchy and not at top level
						myRetList=append(myRetList list(CCSTransformShpToTopLevel(item)))
				  ) ;if
				) ;foreach
				iShpList = nil
				foreach(sh myRetList 
					iShpList=cons(dbCreateRect(cv lyr cadr(sh) ) iShpList )
				)
				finList = append(finList iShpList)
 			) ; foreach
			geSelectFigs(finList)
		) ; let
	) ; if
)

hiSetBindKey( "Layout" "Ctrl Shift<Key>v" "dupl_fet_met()" )
