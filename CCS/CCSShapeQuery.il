/*************************************************************************
* DISCLAIMER: The following code is provided for Cadence customers       *
* to use at their own risk. The code may require modification to         *
* satisfy the requirements of any user. The code and any modifications   *
* to the code may not be compatible with current or future versions of   *
* Cadence products. THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, *
* INCLUDING WITHOUT LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED         *
* WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.         *
*************************************************************************/


/*

USAGE:

cvId=geGetWindowCellView()
myLayer=list("Metal2" "drawing")
myBBox=cvId~>bBox

myshpList=dbShapeQuery(cvId myLayer myBBox 0 20)

myRetList=nil
foreach(item myshpList
  if(listp(item) then
    ; shape is within hierarchy and not at top level
       let( (myRet)
       myRet = CCSTransformShpToTopLevel(item)
       myRetList=append(myRetList list(myRet))
       ) ;let
  ) ;if
) ;foreach
foreach(mapcar x myRetList printf("%L\n" x))

*/

procedure(CCSTransformShpToTopLevel(mylist "l")
 prog( (myshp instList xformShpBBox xformShpPoints xformShpWidth)
  myshp = car(last(mylist))
  instList = reverse(setof(x mylist x~>objType == "inst"))

  case(myshp~>objType
     
     ("rect"
       xformShpBBox = myshp~>bBox
        for(i 1 length(instList)
            xformShpBBox = dbTransformBBox(xformShpBBox car(instList)~>transform)
            instList = cdr(instList)
          );for
       return(list("rect" xformShpBBox))
     ) ;rect
     
     ("polygon"
       xformShpPoints = myshp~>points
        for(i 1 length(instList)
            xformShpPoints = foreach(mapcar pt xformShpPoints
                               dbTransformPoint(pt car(instList)~>transform)
                              );foreach
            instList = cdr(instList)
          );for
       return(list("polygon" xformShpPoints))
     ) ;polygon
     
     ("path"
       xformShpPoints = myshp~>points
       xformShpWidth = myshp~>width
        for(i 1 length(instList)
            xformShpPoints = foreach(mapcar pt xformShpPoints
                               dbTransformPoint(pt car(instList)~>transform)
                              );foreach
            instList = cdr(instList)
          );for
       return(list("path" xformShpPoints xformShpWidth))
     ) ;path
     
     ("pathSeg"   ;; beginPt and endPt of the pathSegs
       xformShpPoints = list(myshp~>beginPt myshp~>endPt)
       xformShpWidth = myshp~>width
        for(i 1 length(instList)
            xformShpPoints = foreach(mapcar pt xformShpPoints
                               dbTransformPoint(pt car(instList)~>transform)
                              );foreach
            instList = cdr(instList)
          );for
       return(list("pathSeg" xformShpPoints xformShpWidth))
     ) ;pathSeg
     
     (t
       xformShpBBox = myshp~>bBox
        for(i 1 length(instList)
            xformShpBBox = dbTransformBBox(xformShpBBox car(instList)~>transform)
            instList = cdr(instList)
          );for
       return(list(myshp~>objType xformShpBBox))
     ) ;default
    );case

 ) ;prog
 ) ;procedure CCSTransformShpToTopLevel
