
procedure( inc_spc( incr ) ; boolean t for increment
	let( (dir spc dir_spc)
		dir_spc = getAlignDir()
		if( dir_spc 
		then
			dir = car(dir_spc)
			spc = cadr( dir_spc)
			if( spc > 0
			then
				if( incr
				then
					CCSAbutAlignInstances(dir spc*1.25)
				else
					CCSAbutAlignInstances(dir spc*0.8)
				)
			else
				if( incr 
					CCSAbutAlignInstances(dir 0.1)
				)
			)
		); if
	); let
); proc

