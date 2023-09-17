; needs CCSShapeQuery.il containing CCSTransformShpToTopLevel from Cadence

procedure( cur_cv_shapes_on_lyr( cv lyr bBox start_lvl stop_lvl) ; lyr : list("MET1" "drawing")
	let( (returned_shapes)
		foreach( shp dbShapeQuery(cv lyr bBox start_lvl stop_lvl)
			if(listp(shp) then
				returned_shapes=append(returned_shapes list(CCSTransformShpToTopLevel(shp)))
			)
		)
	)
)
