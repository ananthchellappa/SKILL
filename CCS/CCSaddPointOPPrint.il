procedure( CCSaddPointOPPrint( w pt) 
    let( (iName params x pt1)
        pt1=car(last(pt))
        geAddSelectPoint(w nil pt1)
        x=car(geGetSelSet())
        if(and(x x~>objType=="inst") then
            params = list("vgs", "vth", "vds", "vdsat", "ids", "gm", "gds")
		    rexCompile(":[0-9]+")
			iName = strcat(geGetInstHier() "/" rexReplace(x~>name "" 1) )
            printf("\nPrinting OP Params for %s\n" iName)
            foreach( param params
                    printf( " %s\t\t%s\n" , param, aelSuffixNotation( OP(iName param )))
            )
        )
        geDeselectFig(x)
   )
)

procedure(CCSpnt()
    point = enterPoints(
        ?prompts    list("Click on any point ..." )
        ?addPointProc "CCSaddPointOPPrint"
    )
)
