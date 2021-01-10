; use a bindkey to horizontalize a label

procedure( horizontalize( )
   let( (cv obj orig newOrig)
    	cv = geGetWindowCellView()
		foreach( obj geGetSelSet() 
			bBox = obj->bBox
			orig = list((caar(bBox) + ((caadr(bBox) - caar(bBox)) / 2)) (cadar(bBox) + ((cadadr(bBox) - cadar(bBox)) / 2)))
			obj~>orient = "R0"
			bBox = obj->bBox
			newOrig = list((caar(bBox) + ((caadr(bBox) - caar(bBox)) / 2)) (cadar(bBox) + ((cadadr(bBox) - cadar(bBox)) / 2)))
			dbMoveShape(obj cv list( (xCoord(orig)-xCoord(newOrig)):(yCoord(orig)-yCoord(newOrig))   "R0" 1) )
		) ; foreach

   ); let
) ; procedure
