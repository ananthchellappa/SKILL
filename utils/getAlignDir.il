procedure( trPointLeftp( pt1 pt2 )
    let( ( pt1x pt2x )
      pt1x = xCoord( pt1 )
      pt2x = xCoord( pt2 )
      cond(
            ( pt1x < pt2x t )
            ( t nil )
      ) ; cond
    ) ; let
) ; procedure


procedure( trSortPointListByX( aPointList "l" )
    sort( aPointList 'trPointLeftp )
)

procedure( getAlignDir() ; returns a list
	let( (inst delx dely xl yl llx urx lly ury allx ally)
		xl = list()
		allx = list()
		yl = list()
		ally = list()
		if( length(geGetSelSet()) < 2 
		then
			println("Need at least two objects")
			nil
		else
			foreach( inst geGetSelSet()
				llx = xCoord(car(inst~>bBox))
				urx = xCoord(cadr(inst~>bBox))
				xl = append( list(llx ) xl )
				allx = append( list(llx urx) allx)
				lly = yCoord(car(inst~>bBox))
				ury = yCoord(cadr(inst~>bBox))
				yl = append( list(lly ) yl )
				ally = append( list(lly ury ) ally )
			)
			xl = sort( xl 'lessp )
			yl = sort( yl 'lessp )
			allx = sort( allx 'lessp )
			ally = sort( ally 'lessp )
			delx = nthelem(2 xl) - nthelem(1 xl)
			dely = nthelem(2 yl) - nthelem(1 yl)
			if( delx < dely 
			then
				list("vertical" nthelem(3 ally)-nthelem(2 ally) )
			else
				list("horizontal" nthelem(3 allx)-nthelem(2 allx) )
			)
		)
	); let
)
