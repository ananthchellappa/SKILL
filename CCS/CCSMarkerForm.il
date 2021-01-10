procedure(CCSMarkerForm()
    unless( length( setof(shape geGetWindowCellView()~>shapes  or(shape~>lpp==list("marker" "error") shape~>lpp==list("marker" "warning")) 
                         )
                  )==0 
        schHiFindMarker()
    )
)

hiSetBindKey("Schematics" "<Key>G" "CCSMarkerForm()")
