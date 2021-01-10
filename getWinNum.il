procedure( getWinNum( winID ) 
	atoi(cadr(parseString( sprintf(nil "%L" winID) ":")))
)

; lame first try, till Subrata Gorai
; 	let( (num)
; 		prog(()
; 			for( i 1 1000
; 				if( winID == window(i)
; 				then
; 					num = i
; 					return()
; 				)
; 			)
; 		) ; prog
; 		num
; 	) ; let
