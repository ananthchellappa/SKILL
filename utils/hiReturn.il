procedure( MYReturn()
        let( (w the_inst )
                w = hiGetCurrentWindow()
                if( (geGetWindowCellView() == geGetTopLevelCellView() )
                then
                    hiGetAttention()
                    println("Already at Top Level")
                else
                        the_inst = car( reverse( parseString( geGetInstHier( hiGetCurrentWindow() ) "/" ) ) )
                    schHiReturn()
                        unless( rexMatchp( "modify_save" car( getPrompts() ) )                                                                   
        
                                ; Jayant help 46114247                                                                                          
                                         
                                geSelectFig( car( dbFindMemInstByName((hiGetCurrentWindow()~>cellView) the_inst ) ) )   
                        ) 
                )
        ) ; let
)


