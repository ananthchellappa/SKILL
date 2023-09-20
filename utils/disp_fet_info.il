procedure( disp_fet_info() 
	let( (inst params iName )
		inst = car( geGetSelSet())
		if( inst then
			params = list("vgs", "vth", "vds", "vdsat", "ids", "gm", "gds")
			iName = strcat(geGetInstHier() "/" inst~>name)
			foreach( param params
				printf( " %s\t\t%s\n" , param, aelSuffixNotation( OP(iName param )))
			)
		)
	)
	nil
)
