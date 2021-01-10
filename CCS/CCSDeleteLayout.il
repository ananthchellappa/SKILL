; Subrata Gorai 46023008
procedure(CCSDeleteLayout(lib)
 let( (libId cvId)
  libId = ddGetObj(lib)
  unless(libId error("\nPlease provide a valid library name.\n"))
  foreach(cell libId~>cells
   foreach(view cell~>views

cvId = dbOpenCellViewByType(lib cell~>name view~>name)
    when(cvId~>cellViewType== "maskLayout"
obj=ddGetObj(libId~>name cell~>name  view~>name)
ddDeleteObj(obj)

       );foreach
     
     );when
    );foreach
   );foreach
    )

; usage 
; CCSDeleteLayout("lib_name")
