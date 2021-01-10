procedure(CCSSelectWire()

let((cv rect lines allobj)
 rect = enterBox(?prompts list("Draw a box to do selection"))


cv=geGetWindowCellView()

geSelectArea(hiGetCurrentWindow() rect)
allobj=geGetSelSet(cv)
lines=setof(x allobj  x~>objType=="line")
geDeselectAllFig(cv)
geSelectFigs(lines)
))
