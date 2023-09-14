; tested
procedure( aligned_same_size(bBox_1, bBox_2) ; --> "V", "H" or nil
    if( xCoord(car(bBox_1)) == xCoord(car(bBox_2)) && xCoord(cadr(bBox_1)) == xCoord(cadr(bBox_2))
       && abs(yCoord(cadr(bBox_1)) - yCoord(car(bBox_1)) - (yCoord(cadr(bBox_2)) - yCoord(car(bBox_2)))) < 1e-6
    then "V"
    else
        if( yCoord(car(bBox_1)) == yCoord(car(bBox_2)) && yCoord(cadr(bBox_1)) == yCoord(cadr(bBox_2))
       && abs(xCoord(cadr(bBox_1)) - xCoord(car(bBox_1)) - (xCoord(cadr(bBox_2)) - xCoord(car(bBox_2)))) < 1e-6
        then "H"
        else nil
       )
    )
)

; tested
procedure( get_orient_stretch_coord( bc_bBox, sd_bBox )
    if( yCoord(car(bc_bBox)) > yCoord(cadr(sd_bBox)) ; y_LL of BC is > y_UR of Src/Drain
    then
        list("north", yCoord(car(bc_bBox)))
    else
        if( yCoord(car(sd_bBox)) > yCoord(cadr(bc_bBox))
        then
            list("south", yCoord(cadr(bc_bBox)))
        else
            if( xCoord(car(sd_bBox)) > xCoord(cadr(bc_bBox))
            then
                list("west", xCoord(cadr(bc_bBox)))
            else
                list("east", xCoord(car(bc_bBox)))
            )
        )
    )
)

; tested - have a few rects of same size, select in random order (SHIFT + click), then 
; rl = geGetSelSet() ; srl = sort( rl 'compare_bBox) ; now use geSelectFig( car(srl)) ; cadr(srl); etc to verify
procedure( compare_bBox( sh1 sh2 )
	if( xCoord(car(sh1~>bBox)) == xCoord(car(sh2~>bBox)) && xCoord(cadr(sh1~>bBox)) == xCoord(cadr(sh2~>bBox))
	then
		yCoord(car(sh2~>bBox)) < yCoord(car(sh1~>bBox))
	else
		if( yCoord(car(sh1~>bBox)) == yCoord(car(sh2~>bBox)) && yCoord(cadr(sh1~>bBox)) == yCoord(cadr(sh2~>bBox))
		then
			xCoord(car(sh2~>bBox)) > xCoord(car(sh1~>bBox))
		else nil
		)
	)
)
