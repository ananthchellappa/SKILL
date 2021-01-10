
defLinePinLen = 0.125           ; AC 3/9/13

procedure(DWsymbolPinsSqToLn()
	let((selected win)
		when(and(win = hiGetCurrentWindow() windowp(win))
			if(and(win->cellView->cellViewType == "schematicSymbol" win->cellView->mode != "r")
			then
				let((bBox mast orig newPin changed)
					if(selected = setof(shape geGetSelSet() shape->objType == "rect")
					then					
						if(member("DWlinePin" win->cellView->lib->cells~>name)
						then
							mast = dbOpenCellViewByType(win->cellView->lib->name "DWlinePin" "symbol" "schematicSymbol" "r" )
						else
							system(sprintf(nil "cp -R /home/douglasw/DWshare/symbolPinsSqToLn/DWlinePin %s/" win->cellView->lib->readPath))
							printf("*INFO* Symbol master cellView \"DWlinePin\" created in current library.\n")
							mast = dbOpenCellViewByType(win->cellView->lib->name "DWlinePin" "symbol" "schematicSymbol" "r" )
						)
						changed = 0
						mapcar(lambda((shape)
									bBox = shape->bBox
									when(and(lessp((caadr(bBox) - caar(bBox) - .05) .005) lessp((cadadr(bBox) - cadar(bBox) - .05) .005) shape->pin)
										when(and(shape->pin->term->name shape->pin->term->direction)
											orig = list((caar(bBox) + (caadr(bBox) - caar(bBox))/2) (cadar(bBox) + (cadadr(bBox) - cadar(bBox))/2))
											newPin = schCreateSymbolPin(win->cellView mast shape->pin->term->name shape->pin->term->direction orig "R0" t)
											foreach(child shape->children
												child->parent = newPin
											)
                                            newPinLabel = car( setof(lab newPin->children and( lab->objType == "label" , lab->theLabel == newPin->pin->net->name) ) )   ; from DW 3/10
                                            cond(
                                                ( (car(orig) < car(newPinLabel->xy) ) newPin~>points = list( orig (car(orig)+defLinePinLen):cadr(orig) ) ) ; on RHS 3/10/13
                                                ( (car(orig) > car(newPinLabel->xy) ) newPin->points = list( (car(orig) - defLinePinLen):cadr(orig) orig) ) ; from DW 3/10
                                            )
											schDelete(shape)
											changed++
										)
									)
								)
							selected
						)
						printf("*INFO* %n square pins transformed to line pins.\n" changed)
						println("*INFO* Please set defLinePinLen different and rerun if necessary")             ; AC 3/9/13
					else
						printf("*INFO* There are no rectangular objects selected.\n")
					)
				)
			else
				printf("*INFO* CellView is not a symbol view or it is open in read-mode.")
			)
		)
	)
)
