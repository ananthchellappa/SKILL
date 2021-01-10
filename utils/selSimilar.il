; use a bindkey to select all of the same cellName as the selected instance

procedure( selSimilar( )
   let( (cv inst sought)
    	cv = geGetEditCellView(getCurrentWindow())
		if( ("schematic" == cv~>cellViewType )
		then
			schHiSelectByProperty( "select" "cellName" "==" car(geGetSelSet() )~>cellName )
		else
			if( ("maskLayout" == cv~>cellViewType )
			then
				sought = car(geGetSelSet() )~>cellName
				foreach( inst cv~>instances
					if( inst~>cellName == sought
					then
						geSelectFig( inst )
					)
				)
			); if
		) ; if			
   ); let
) ; procedure
