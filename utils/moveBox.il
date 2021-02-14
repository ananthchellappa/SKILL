procedure( moveBbox( bbox offset ) ; offset is a list of two floats - like a point.., xoffset and yoffset
  prog( (c 11 ur)
    ll = car( bbox )
    ur = cadr( bbox )
    ll = xCoord( ll ) + xCoord( offset) : yCoord( ll ) + yCoord( offset )
    ur = xCoord( ur ) + xCoord( offset) : yCoord( ur ) + yCoord( offset )
    return(list( ll ur ))
  ) ;prog
) ;procedure
