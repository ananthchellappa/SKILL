; list pins and directions
; usage : in CIW : list_pins()
procedure( list_pins( )
	let( (cv term)
		cv = geGetEditCellView()
		foreach( term cv~>terminals
			printf("%s %s\n" , term~>name , term~>direction)
		)
	); let
	t
)
