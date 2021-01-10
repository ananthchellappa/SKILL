procedure( MYReturn()
	let( (w )
		w = hiGetCurrentWindow()
 		if( (geGetWindowCellView() == geGetTopLevelCellView() )
 		then
 		    hiGetAttention()
 		    println("Already at Top Level")
 		else
 		    schHiReturn()
			if( nil != w~>descend_chain
			then
				w~>most_recent = car( w~>descend_chain )
				w~>descend_chain = cdr( w~>descend_chain )		; essentially a pop
				unless( rexMatchp( "modify_save" car( getPrompts() ) )
					; Jayant help 46114247 
					geSelectFig( car( dbFindMemInstByName((hiGetCurrentWindow()~>cellView) w~>most_recent ) ) )
				)
			)
 		)
	) ; let
)

