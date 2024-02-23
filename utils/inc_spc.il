; 2/23/24 - also added width incr/decr for paths
procedure( inc_spc( incr ) ; boolean t for increment
	let( (dir spc dir_spc grid spc_gdunits objs pseg paths)
		grid = techGetMfgGridResolution(techGetTechFile(geGetEditCellView()))
		paths = setof( x geGetSelSet() "pathSeg" == x~>objType)
		if( paths
		then
			foreach( pseg paths
				if( pseg~>width*0.05 < grid
				then
					if( incr 
					then pseg~>width += 2*grid
					else pseg~>width -= 2*grid
					)
				else
					if( incr 
					then pseg~>width = 2*grid*round(0.55*pseg~>width/grid)
					else pseg~>width = 2*grid*round(0.45*pseg~>width/grid)
					)
				)
			)
		else
			dir_spc = getAlignDir()
			if( dir_spc
			then
				dir = car(dir_spc)
				spc = cadr( dir_spc)
				spc_gdunits = spc/grid
				if( spc > 0
				then
					if( incr
					then
						CCSAbutAlignInstances(dir grid*round(1.25*spc_gdunits + 0.5))
					else
						CCSAbutAlignInstances(dir grid*round(0.8*spc_gdunits - 0.5))
					)
				else
					if( incr
						CCSAbutAlignInstances(dir 0.1)
					)
				)
			); if
		); if
	); let
); proc

