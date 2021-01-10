
procedure(CCSShowCdsTermNetNames(@optional (cv geGetEditCellView()) ) let( () 
AnnotationSlider->annnetName->checked=t
hiSetBindKey("Schematics" "<Key>F10" "CCSOffCdsTermNetNames()") );let 
);procedure CCSShowCdsTermNetNames


procedure(CCSOffCdsTermNetNames(@optional (cv geGetEditCellView()) ) 
let(()
AnnotationSlider->annnetName->checked=nil
hiSetBindKey("Schematics" "<Key>F10" "CCSShowCdsTermNetNames()")
);let
);procedure CCSOffCdsTermNetNames

hiSetBindKey("Schematics" "<Key>F10" "CCSShowCdsTermNetNames()")



; old, prior to Sameer Garg, 6.1.6 ..
; procedure(CCSOffCdsTermNetNames(@optional (cv geGetEditCellView()) )
;  let( (uCdf lib cell)
;   foreach(inst geGetEditCellView()~>instances
;    lib = inst~>master~>libName
;    cell = inst~>master~>cellName
; 
;    unless(uCdf = cdfGetUserCellCDF(ddGetObj(lib cell))
;      uCdf = cdfCreateUserCellCDF(ddGetObj(lib cell))
; 	);unless
; 
; ;   uCdf~>termDisplayMode="netName"
; 
;    uCdf~>termDisplayMode=nil
; ;   uCdf~>termDisplayMode="voltage" ;  Solution : 11656094
;    hiRedraw(hiGetCurrentWindow())
; 
;    );foreach
;   );let
;  );procedure
