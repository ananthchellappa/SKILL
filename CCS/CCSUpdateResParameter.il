procedure(CCSUpdateResParameter()
    let((layinstlist layinst schinst schCDF layCDF tmpval)
        layinstlist=geGetSelectedSet()
        if(geGetSelectedSet() then
            foreach(layinst layinstlist
                schinst = caaar(bndGetBoundObjects(layinst))
                if(!schinst then
                    printf("--INFO-- No Binding found. Attempting to find same base name instance in schematic\n")
                    CCSUpdateResBinding(layinst)
                    schinst = caaar(bndGetBoundObjects(layinst))
                )
                schCDF = schinst~>l
                layCDF = layinst~>l
                tmpval = layCDF
                if( layCDF!=schCDF then
                    layinst~>l=schinst~>l
                    printf("--INFO-- Mismatch Found..Layout instance:%L CDF for length is updated to %L .\n" layinst~>name layinst~>l)
                    else
                    printf("--INFO-- No Mismatch Found..\n")
                );if
            );foreach
            else
            warn("--INFO-- no Instance selected in layout window")
        );if
    );let
);procedure


procedure(CCSUpdateResBinding(layinst)
    let((lcv scv layinstlist layinstprefix schinst)
        lcv=geGetEditCellView()
        scv=lxGetSource(lcv)
        layinstprefix=car(parseString(layinst~>name ".")) ; changed from car(layinstlist)~>baseName "."
        schinst=dbFindAnyInstByName(scv layinstprefix)
        printf("--INFO-- Attempting binding between Layout instance:%L and Schematic instance:%L\n" layinst~>name schinst~>name)
        bndAddObjectsBinding(schinst layinst)
    );let
);procedure
