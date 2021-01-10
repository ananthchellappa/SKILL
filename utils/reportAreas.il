; reportAreas( "MX_Corgi_A01_migrated" "/tmp/cells.txt" )
; cell file can have lines of the form : libName cellName symbol (#of)
; or just : cellName
; the idea is that you can use the output of the tree utility with as little additional effort as possible
procedure( reportAreas( libName cellFile ) 
	let( (inPort cv nextLine area bb parsed)
		; open the file for read
		inPort = infile( cellFile )
		when( inPort
				while( gets( nextLine inPort )
				if( rexMatchp( "[a-zA-Z]" nextLine )
				then
					rexCompile( "\n")
					nextLine = rexReplace( nextLine "" 1 )
					if( rexMatchp( " " nextLine ) 	; gets interesting now - we support libName CellName 
					then
						; we ignore libName
						rexCompile( "^[ \t]+" )
						nextLine = rexReplace( nextLine "" 1 )
						parsed = parseString( nextLine " " )
						cv = dbOpenCellViewByType( nthelem( 1 parsed) nthelem(2 parsed) "layout" "maskLayout" "r" )
					else
						cv = dbOpenCellViewByType( libName nextLine "layout" "maskLayout" "r" )
					)
					bb = cv~>bBox
					area = (xCoord( cadr( bb ) ) - xCoord( car( bb ) ) ) * (yCoord( cadr( bb ) ) - yCoord( car( bb ) ) )
					printf( "%s : %f\n" nextLine area )
				else
					println( "--" )
				) ; if a-zA-Z
			)
			close( inPort )
			;read a line - it must be the name of a cell
		)
	) ; let
)

