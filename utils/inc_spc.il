procedure( inc_spc( incr ) ; boolean t for increment
	let( (dir spc dir_spc grid spc_gdunits)
		grid = techGetMfgGridResolution(techGetTechFile(geGetEditCellView()))
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
	); let
); proc
