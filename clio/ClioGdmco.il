procedure( ClioGdmco( lib @key (cv "layout") )
  let( (libId objId cell cells view views spec specList state)
  
    libId = ddGetObj( lib )
    specList = gdmCreateSpecList()
    
    cells = setof( x libId~>cells member( cv x~>views~>name ))~>name
    
    foreach( cell cells
      
      objId = ddGetObj( lib cell cv "*" )
      spec = gdmCreateSpecFromDDID(objId)
        
      ; if it is checked in, add to speclist
      state = car(reverse(gdmstatus( spec 6 )))
        
      when( state = "gdmStateCi"          
        gdmAddSpecToSpecList(spec specList)
      )
    )
    when( specList != nil
      gdmco(specList)
    )
    nil                  
  )
)
