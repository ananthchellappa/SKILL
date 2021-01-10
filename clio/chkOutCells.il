; only hits schematic and symbol view :( Needs work if you want to 
; process all views of certain type..
; quick and dirty inelegant code for now..
; original code -- crappy :) from Cliosoft..
; use '.' for all cells, don't use "*"

procedure( chkOutCells( lib cellNameMatch @key (layout nil) )
  let( (cv cell libId objId cell cells view views spec specList state)
  
    libId = ddGetObj( lib )
    specList = gdmCreateSpecList()
    
    cells = setof( x libId~>cells rexMatchp( cellNameMatch  x~>name ) )~>name
    
    foreach( cell cells
      if( member( "schematic" ddGetObj( lib cell)~>views~>name ) 
	  then
 		  objId = ddGetObj( lib cell "schematic" )
		  if( objId
		  then
 		 	  spec = gdmCreateSpecFromDDID(objId)
 
 		 	  ; if it is checked in, add to speclist
		 	  state = car( reverse( parseString( caar( setof(x gdmstatus(spec 6) rexMatchp("sch.oa gdm" car(x))) ) ) ) )
 
 		 	  when( "gdmStateCI" == state
 		 		gdmAddSpecToSpecList(spec specList)
 		 	  )
		  ) ; if objId
 
 		  objId = ddGetObj( lib cell "symbol" )
 		  if( objId
 		  then
 	 		  spec = gdmCreateSpecFromDDID(objId)
 
 	 		  ; if it is checked in, add to speclist
 	 		  state = car( reverse( parseString( caar( setof(x gdmstatus(spec 6) rexMatchp("symbol.oa gdm" car(x))) ) ) ) )
 
 	 		  when( "gdmStateCI" == state
 	 			gdmAddSpecToSpecList(spec specList)
 	 		  )
 		  ) ; if objId

    	  if( layout
    	  then
    		  objId = ddGetObj( lib cell "layout" )
			  if( objId
			  then
 	 			  spec = gdmCreateSpecFromDDID(objId)
 
 	 			  ; if it is checked in, add to speclist
 	 			  state = car( reverse( parseString( caar( setof(x gdmstatus(spec 6) rexMatchp("layout.oa gdm" car(x))) ) ) ) )
 
 	 			  when( "gdmStateCI" == state
 	 				gdmAddSpecToSpecList(spec specList)
	 			  )
			  )  ; if objId
		  ) ; if layout

	  ) ; if member
    ) ; foreach
    when( specList != nil
      gdmco(specList)
    )
    nil                  
  )
)
