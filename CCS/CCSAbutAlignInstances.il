procedure(CCSAbutAlignInstances(edge \@optional (space 0))
let((SelInstIdsList refObj alignObj)
;; Filtered only instances
SelInstIdsList=setof(x geGetSelSet() x~>objType=="inst")

unless(member(edge list("left" "right" "top" "bottom" "horizontal" "vertical"))
   warn("edge should be either \"left\" or \"right\" or \"top\" or \"bottom\" \"horizontal\" \"vertical\"")
)

while( and(SelInstIdsList cadr(SelInstIdsList))
refObj=rodGetObj(car(SelInstIdsList))
alignObj=rodGetObj(cadr(SelInstIdsList))

case(edge
    ("bottom"
        rodAlign(?alignObj alignObj ?alignHandle "lowerLeft" ?refObj refObj ?refHandle "lowerRight" ?xSep space ?maintain nil )
    )
    
    ("top"    
        rodAlign(?alignObj alignObj ?alignHandle "upperLeft" ?refObj refObj ?refHandle "upperRight" ?xSep space ?maintain nil)
    ) ;top
    
    ("left"
        rodAlign(?alignObj alignObj ?alignHandle "lowerLeft" ?refObj refObj ?refHandle "upperLeft" ?ySep space ?maintain nil)
    ) ;left    
    
    ("right"
        rodAlign(?alignObj alignObj ?alignHandle "lowerRight" ?refObj refObj ?refHandle "upperRight" ?ySep space ?maintain nil)
    ) ;right
    
    ("horizontal"
        rodAlign(?alignObj alignObj ?alignHandle "centerLeft" ?refObj refObj ?refHandle "centerRight" ?xSep space ?maintain nil)
    ) ;horizontal    
    
    ("vertical"
        rodAlign(?alignObj alignObj ?alignHandle "lowerCenter" ?refObj refObj ?refHandle "upperCenter" ?ySep space ?maintain nil)
    ) ;vertical 
) ;case
SelInstIdsList=cdr(SelInstIdsList)
) ;while
) ;let
) ;procedure
