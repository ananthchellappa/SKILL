; roundEdge( cv "ll" car( the_rect~>bBox) )

procedure( roundEdge(c corner point)
  let( (x y)
    x = xCoord( point )
    y = yCoord( point )
    case( corner
        ( "ll"  dbCreateArc( c list( 231 "drawing") list( x:y x+0.125:y+0.125) list( x:y x+0.0625:y+0.0625) ) )

        ( "lr"  dbCreateArc( c list( 231 "drawing") list( x-0.125:y x:y+0.125) list( x-0.0625:y x:y+0.0625) ) )

        ( "ul"  dbCreateArc( c list( 231 "drawing") list( x:y-0.125 x+0.125:y) list( x:y-0.0625 x+0.0625:y) ) )

        ( "ur"  dbCreateArc( c list( 231 "drawing") list( x-0.125:y-0.125 x:y) list( x-0.0625:y-0.0625 x:y) ) )
    ) ; case
  ) ; let
)


procedure( applify( )
  let(  (c x1 y1 x2 y2 area highest_area the_rect)

    c = geGetWindowCellView()
    highest_area = 0.0
    foreach( shape c~>shapes
        if( ("rect" == shape~>objType) && (231 == shape~>layer)
        then
            x1 = xCoord( car( shape~>bBox) )
            y1 = yCoord( car( shape~>bBox) )
            x2 = xCoord( cadr( shape~>bBox) )
            y2 = yCoord( cadr( shape~>bBox) )
            area = (x2-x1)*(y2-y1)
            if( ( area > highest_area )
            then
                the_rect = shape
                highest_area = area
            )
        ) ; if rect
    ) ; foreach
    if( the_rect then
      roundEdge(c "ll" car( the_rect~>bBox) )
      roundEdge(c "lr" list( xCoord( cadr( the_rect~>bBox ) ) yCoord( car( the_rect~>bBox) ) ) )
      roundEdge(c "ul" list( xCoord( car( the_rect~>bBox ) ) yCoord( cadr( the_rect~>bBox) ) ) )
      roundEdge(c "ur" cadr( the_rect~>bBox) )

      dbCreateLine( c list( 231 "drawing" ) list( xCoord( car(the_rect~>bBox) )+0.0625:yCoord( car(the_rect~>bBox) )
          xCoord( cadr( the_rect~>bBox ) )-0.0625:yCoord( car( the_rect~>bBox ) )
          ) ; list
      ) ; bottom line

      dbCreateLine( c list( 231 "drawing" ) list( xCoord( cadr( the_rect~>bBox ) ):yCoord( car( the_rect~>bBox ) )+0.0625
          xCoord( cadr( the_rect~>bBox ) ):yCoord( cadr( the_rect~>bBox ) )-0.0625
          ) ; list
      ) ; right line

      dbCreateLine( c list( 231 "drawing" ) list( xCoord( cadr( the_rect~>bBox ) )-0.0625:yCoord( cadr( the_rect~>bBox ) )
          xCoord( car( the_rect~>bBox ) )+0.0625:yCoord( cadr( the_rect~>bBox ) )
          ) ; list
      ) ; top line

      dbCreateLine( c list( 231 "drawing" ) list( xCoord( car( the_rect~>bBox ) ):yCoord( cadr( the_rect~>bBox ) )-0.0625
          xCoord( car( the_rect~>bBox ) ):yCoord( car( the_rect~>bBox ) )+0.0625
          ) ; list
      ) ; left line

      dbDeleteObject( the_rect )
    ) ; if the_rect
  ) ; let
)
