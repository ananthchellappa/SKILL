; thanks to tweeks on the forums.. genius even does Haskell.. man I suck :)
; return a list of unique elements from a list

procedure( unqList(l "l" )
	(let ((table (makeTable "" nil )))
		(foreach e l table[e] = t)
		table->?
	); let
) ; procedure
