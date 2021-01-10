procedure(CCSrectSelect()
    prog( ( area_objs)
        rect = enterBox(?prompts list("Draw a box to do selection"))
        area_objs = leSearchHierarchy(deGetCellView() rect 0 "path" nil)
        area_objs = append(area_objs leSearchHierarchy(deGetCellView() rect 0 "line" nil))  ; from AG
        geSelectFigs(area_objs)
        ) ; prog
    
    ) ; procedure
