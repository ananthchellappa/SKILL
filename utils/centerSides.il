procedure( centerSides( bbox )
  prog( (c xs ys ll ur)
    ll = car( bbox )
    ur = cadr( bbox )
    c = 0.5*(xCoord(ll)+xCoord(ur)) : 0.5*(yCoord(ll)+yCoord(ur))
    xs = xCoord(ur) - xCoord(ll)
    ys = yCoord(ur) - yCoord(ll)
    return(list( c xs ys ))
  ) ;prog
) ;procedure
