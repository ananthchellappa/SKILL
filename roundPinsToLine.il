; load "/home/USERNAME/skill/roundPinsToLine.il"

defLinePinLen = 0.125           ; AC 3/9/13

procedure(roundPinsToLine()
	let( (selected win x y xl yl opp adj angle)
		when(and(win = hiGetCurrentWindow() windowp(win))
			if( and(win->cellView->cellViewType == "schematicSymbol" win->cellView->mode != "r")
			then
				let( (bBox mast orig newPin changed x y xl yl newPinLabel)
					if( (nil == geGetSelSet() ) then
					; if nothing selected, then select all pins
						schHiSelectByProperty( "select" "pinName" "==" "*" )
					)
					if( selected = setof(shape geGetSelSet() shape->objType == "ellipse")		; where you define the set you plan on operating on
					then					
						if(member("linePin" win->cellView->lib->cells~>name)
						then
							mast = dbOpenCellViewByType(win->cellView->lib->name "linePin" "symbol" "schematicSymbol" "r" )
						else
							system(sprintf(nil "cp -R /home/USERNAME/cadence/myVeriloga/linePin %s/" win->cellView->lib->readPath))
							printf("*INFO* Symbol master cellView \"linePin\" created in current library.\n")
							mast = dbOpenCellViewByType(win->cellView->lib->name "linePin" "symbol" "schematicSymbol" "r" )
						)
						changed = 0
						mapcar( lambda( (shape)
									bBox = shape->bBox
									when( and(lessp((caadr(bBox) - caar(bBox) - .05) .005) lessp((cadadr(bBox) - cadar(bBox) - .05) .005) shape->pin)
										when( and(shape->pin->term->name shape->pin->term->direction)
											orig = list((caar(bBox) + (caadr(bBox) - caar(bBox))/2) (cadar(bBox) + (cadadr(bBox) - cadar(bBox))/2))
											newPin = schCreateSymbolPin(win->cellView mast shape->pin->term->name shape->pin->term->direction orig "R0" t)
											foreach(child shape->children
												child~>parent = nil ; detach the child
												child->parent = newPin
											)
                                            newPinLabel = car( setof(lab newPin->children and( lab->objType == "label" , lab->theLabel == newPin->pin->net->name) ) )   ; from DW 3/10
                                            x = car(orig)
                                            y = cadr(orig)
                                            xl = 0.5 * xCoord( car(newPinLabel->bBox) )
											xl = xl + 0.5 * xCoord( cadr(newPinLabel->bBox) )
                                            yl = 0.5 * yCoord( car(newPinLabel->bBox))
											yl = yl + 0.5 * yCoord( cadr(newPinLabel->bBox))
								; xl, yl is the center of mass of the label
											opp = yl - y
											adj = xl - x
											angle = 180 * atan2( opp  (adj + 1e-5) ) / 3.14159263
                                    cond(
     ( ( (angle > 160)  || ( angle < -160 ) )  newPin~>points = list( orig (car(orig)+defLinePinLen):cadr(orig) ) ) ; 9/5/16
     ( ( (angle > -20)  && ( angle < 20   ) )  newPin->points = list( (car(orig) - defLinePinLen):cadr(orig) orig) ) ;
     ( ( (angle < -70)  && ( angle > -110 ) )  newPin->points = list( orig ( car(orig):(cadr(orig)+defLinePinLen) ) ) );
     ( ( (angle < 110)  && ( angle > 70   ) )  newPin->points = list( orig ( car(orig):(cadr(orig)-defLinePinLen) ) ) );
                                            ) ; cond
											schDelete(shape)
											changed++
										) ; when
									) ; when lessp..
								) ; lambda
							selected
						) ; mapcar
						printf("*INFO* %n Round pins transformed to line pins.\n" changed)
						println("*INFO* Please set defLinePinLen different and rerun if necessary")             ; AC 3/9/13
					else
						printf("*INFO* There are no rectangular objects selected.\n")
					)
				) ; let
			else
				printf("*INFO* CellView is not a symbol view or it is open in read-mode.")
			)
		) ; when
	)
)
