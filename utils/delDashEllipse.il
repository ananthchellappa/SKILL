procedure( delDashEllipse()

																						foreach( obj setof( shape geGetWindowCellView()~>shapes and(shape~>lpp == list("text" "drawing1") shape~>objType == "ellipse")) dbDeleteObject( obj ) ) ; "drawing" means solid, "drawing1" is dashed..

)
