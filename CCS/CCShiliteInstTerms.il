procedure(CCShiliteInstTerms(@optional (cv geGetWindowCellView() ))

  let( (myInstList myHL bBox)

   myInstList = setof(inst cv~>instances

                     inst~>purpose == "cell" &&

             inst~>instTerms

            
                 );setof

  myHL = geCreateHilightSet(cv list("hilite" "drawing5") nil)

  myHL->enable = t

foreach(inst myInstList


   foreach(term inst~>instTerms~>term

    foreach(fig car(term~>pins~>figs)

       bBox= dbTransformBBox( car(term~>pins~>fig~>bBox) inst~>transform)
       geAddHilightRectangle(myHL bBox )

           );foreach fig

        );foreach term
       );foreach inst

   );let

);procedure

procedure(toggleHilite()
CCShiliteInstTerms()
hiSetBindKey("Schematics" "<Key>F9" "toggleHilite2()")
)

procedure(toggleHilite2()
geDeleteAllHilightSet(geGetWindowCellView())
hiSetBindKey("Schematics" "<Key>F9" "toggleHilite()")
)

hiSetBindKey("Schematics" "<Key>F9" "toggleHilite()")

