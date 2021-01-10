; load "/home/achellappa/skill/CCS/CCSCreateLinePin.il"
; CCSCreateLinePin("myvcc" list(1:1 2:1))

procedure(CCSCreateLinePin(termName ptList @optional (cvId geGetEditCellView()) "tld")
let( (shpId)


     unless(listp(ptList) && length(ptList)==2
        error("Please pass a list of two points for drawing the line pin")
      );unless


   shpId = dbCreateLine(cvId "pin" ptList)
   dbCreatePin(dbMakeNet(cvId termName) shpId )


  );let
);procedure
