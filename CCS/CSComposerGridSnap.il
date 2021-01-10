;
; Program to snap Composer inst and wires to grid
; Operates on selected items in current schematic,
; does entire schematic if nothing selected.
;

procedure( CSComposerGridSnap()
  let((cv count Set Settemp grid newpoints pointi shapeCoords)
  ;
  ; Open currently edited cellview
  cv = geGetEditCellView(getCurrentWindow())
  ;
  if(geGetObjectSelectedSet() != nil  then
    println("selected")
    Settemp = geGetObjectSelectedSet()
    Set = nil
    foreach( item Settemp Set=append(Set list(car(item))) )
  else
    Set = append(cv~>instances cv~>shapes)
    println("nothing selected - operating on entire cellview")
  )
 
  ; Get the current snap spacing
  grid = schGetEnv("schSnapSpacing")
 
  count = 0
  ;
  ; Loop through and find all the items off grid
  foreach( shape Set
  ; For instances
    shapeCoords = shape~>xy
    if( shapeCoords then
       if((int(xCoord(shapeCoords)/grid) != xCoord(shapeCoords)/grid )
         ||(int(yCoord(shapeCoords)/grid) != yCoord(shapeCoords)/grid ) then
        count = count + 1
        shape~>xy = int(xCoord(shapeCoords)/grid+.5)*grid:int(yCoord(shapeCoords)/grid+.5)*grid
       )
    ); if

  ; For wires
    if(shape~>points then
    newpoints=nil
    for(i 1 shape~>nPoints
       pointi = nth(i-1 shape~>points)
       if((int(xCoord(pointi)/grid) != xCoord(pointi)/grid )
         ||(int(yCoord(pointi)/grid) != yCoord(pointi)/grid ) then
        count = count + 1
           newpoints = cons(
           int(xCoord(pointi)/grid+.5)*grid:int(yCoord(pointi)/grid+.5)*grid
            newpoints)
       else
           newpoints = cons(nth(i-1 shape~>points) newpoints)
       )
    );foreach
    shape~>points = newpoints
    );if
  ); foreach
 
  ; Print a report
  if( count == 0 then
    printf("***WARNING No offgrid items Found!\n" )
  else
    printf("%d Offgrid items moved\n" count )
  );if
 
  );let
);proc
