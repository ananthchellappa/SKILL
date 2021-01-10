procedure( CCSSnapToGrid()

    let((cv count Set Settemp grid newpoints pointi ptbBox shapeCoords compFactor Coords newCoords)

; Open currently edited cellview

cv = geGetEditCellView(getCurrentWindow())
compFactor=1/cv~>DBUPerUU

if(geGetObjectSelectedSet() != nil  then
    println("selected")
    Settemp = geGetObjectSelectedSet()
    Set = nil
    foreach( item Settemp Set=append(Set list(car(item))) )
else
    Set = append(cv~>instances cv~>shapes)
    println("nothing selected - operating on entire cellview")
)


; Get the current snap spacing as per the viewType
;;------------------------------------
if(cv~>cellViewType=="schematic" then

grid = schGetEnv("schSnapSpacing")

else
	if(cv~>cellViewType=="schematicSymbol" then
		grid=schGetEnv("symSnapSpacing")
		else
		printf("The selected graphics window is not of type schematic or symbol\n")
	);if
);if
 

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

        	;;shape~>xy = int(xCoord(shapeCoords)/grid+compFactor)*grid:int(yCoord(shapeCoords)/grid+compFactor)*grid
		shape~>xy = roundCoord(shapeCoords grid compFactor)

       	) ;if 
    ); if shapeCoords

 

; For wires

if(shape~>points then

    newpoints=nil

for(i 1 shape~>nPoints

   pointi = nth(i-1 shape~>points)

	if((int(xCoord(pointi)/grid) != xCoord(pointi)/grid )
    		||(int(yCoord(pointi)/grid) != yCoord(pointi)/grid ) then

		count = count + 1
		newpoints = cons(roundCoord(pointi grid compFactor) newpoints)
		else
		newpoints = cons(nth(i-1 shape~>points) newpoints)

	) ;if
);for

    shape~>points = newpoints

    );if


 
if(shape~>objType == "rect" 

  foreach(ptbBox shape~>bBox

       if((int(xCoord(ptbBox)/grid) != xCoord(ptbBox)/grid )

         ||(int(yCoord(ptbBox)/grid) != yCoord(ptbBox)/grid ) then

        count = count + 1
 	Coords = shape~>bBox
       	Coords = list( lowerLeft(Coords)
   				list(xCoord(upperRight(Coords)) yCoord(lowerLeft(Coords)))
   			upperRight(Coords)
   				list(xCoord(lowerLeft(Coords)) yCoord(upperRight(Coords)))
			) ;list
   
	newCoords=nil
     	foreach( pt Coords newCoords=cons(roundCoord(pt grid compFactor) newCoords)  )
 	geSelectObject(dbCreatePolygon(cv shape~>lpp newCoords))
     	dbDeleteObject(shape)
     );if
     );foreach
     geDeselectAll()    
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


procedure( roundCoord( point grid compFactor )
    prog( (x y)
 x=round((xCoord(point) + compFactor) / grid) * grid
 y=round((yCoord(point) + compFactor) / grid) * grid
 return(list( x y ))
    ) ;prog
) ;procedure
