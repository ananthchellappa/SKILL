; load "/home/achellappa/skill/squarePinsToLine.il"

defLinePinLen = 0.125           ; AC 3/9/13

procedure(squarePinsToLine()
	let( (selected win)
		when(and(win = hiGetCurrentWindow() windowp(win))
			if( and(win->cellView->cellViewType == "schematicSymbol" win->cellView->mode != "r")
			then
				let( (bBox mast orig newPin changed x y xl yl newPinLabel)
					if( selected = setof(shape geGetSelSet() shape->objType == "rect")		; where you define the set you plan on operating on
					then					
						if(member("linePin" win->cellView->lib->cells~>name)
						then
							mast = dbOpenCellViewByType(win->cellView->lib->name "linePin" "symbol" "schematicSymbol" "r" )
						else
							system(sprintf(nil "cp -R /home/achellappa/cadence/myVeriloga/linePin %s/" win->cellView->lib->readPath))
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
												child~>parent = car( newPin~>figs) ; attach child	; Hari Yadav 46025687 
											)
                                            newPinLabel = car( setof(lab newPin->children and( lab->objType == "label" , lab->theLabel == newPin->pin->net->name) ) )   ; from DW 3/10
                                            x = car(orig)
                                            y = cadr(orig)
                                            xl = car(newPinLabel->xy)
                                            yl = cadr(newPinLabel->xy)
                                    cond(
     ( ((x < xl)  && ( abs(x-xl) > abs(y-yl)) ) newPin~>points = list( orig (car(orig)+defLinePinLen):cadr(orig) ) ) ; on RHS 3/10/13
     ( ((x > xl)  && ( abs(x-xl) > abs(y-yl)) ) newPin->points = list( (car(orig) - defLinePinLen):cadr(orig) orig) ) ; from DW 3/10
     ( ((y > yl)  && ( abs(x-xl) < abs(y-yl)) ) newPin->points = list( orig ( car(orig):(cadr(orig)-defLinePinLen) ) ) ); label below 8/23/13
     ( ((y < yl)  && ( abs(x-xl) < abs(y-yl)) ) newPin->points = list( orig ( car(orig):(cadr(orig)+defLinePinLen) ) ) ); label above 8/23/13
                                            ) ; cond
											schDelete(shape)
											changed++
										) ; when
									) ; when lessp..
								) ; lambda
							selected
						) ; mapcar
						printf("*INFO* %n square pins transformed to line pins.\n" changed)
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
