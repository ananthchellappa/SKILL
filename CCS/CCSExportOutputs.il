_ignoreLibList="analogLib sample basic"
_ignoreCellList = "gnd "

procedure(CCSSetTermCurrent()
let((hierInfo hierInfoField ignoreOpt ignoreLibVal ignoreCellVal listBoxField selectNetField selectNetField1)
 hierInfo=geGetInstHier(hiGetCurrentWindow())
 hierInfoField = hiCreateStringField(
                          ?name 'hierInfoField
			  ?prompt "Hierarchical Path ..."
			  ?defValue hierInfo
			  ?editable nil
		 )
 ignoreOpt=hiCreateRadioField(
    		   ?name 'ignoreOpt
		   ?choices list("Library" "Cell")
		   ?prompt "Ignore Cells from Library/With CellName"
		   ?defValue "Library"
		   ?callback list("CCSSetIgnoreList('ignoreOpt)")
           )
 ignoreLibVal = hiCreateStringField(
                          ?name 'ignoreLibVal
			  ?prompt "Ignore Library List"
			  ?defValue if(boundp('_ignoreLibList) then _ignoreLibList else "")
			  ?editable t
		 )
 ignoreCellVal = hiCreateStringField(
                          ?name 'ignoreCellVal
			  ?prompt "Ignore Cell List"
			  ?defValue if(boundp('_ignoreLibList) then _ignoreCellList else "")
			  ?editable nil
		 )

 selectNetField = hiCreateButton(
                          ?name 'selectNetField
	                  ?callback "CCSSelectNet()"
        	          ?buttonText "Select Net on Schematic for saving terminal currents..."
                  )
 selectNetField1 = hiCreateButton(
                          ?name 'selectNetField1
	                  ?callback "CCSSelectNetVoltage()"
        	          ?buttonText "Select Net on Schematic for saving voltage..."
                  )


 listBoxField = hiCreateListBoxField(
			  ?name 'listBoxField
			  ?prompt "Select Signals for Outputs"
			  ?choices list()
			  ?numRows 5
			  ?multipleSelect t
		)
  hiCreateAppForm(
	            ?name 'addOutputs
		    ?formTitle "Add Outputs to ADE..."
		    ?fields list(hierInfoField ignoreOpt ignoreLibVal ignoreCellVal selectNetField selectNetField1 listBoxField)
		    ?callback 'CCSSetOutputs
	    )
) ;let
) ;proc

procedure(CCSSetIgnoreList(arg)
let((fieldVal formId )
   formId = hiGetCurrentForm()
   fieldVal = get(formId arg)~>value
   case(fieldVal
       ("Library" formId~>ignoreCellVal~>editable= nil formId~>ignoreLibVal~>editable= t)
       ("Cell" formId~>ignoreLibVal~>editable=nil formId~>ignoreCellVal~>editable= t)
   ) ;case
t
))

procedure(CCSSelectNet()
let((formId netSh termIds choiceList infixVal add? myChoice) 
  formId = hiGetCurrentForm()
  infixVal = envGetVal("ui" "infix" )
  envSetVal("ui" "infix" 'boolean nil)
  while(!netSh
   printf("Select a Net in Schematic ...")
   netSh = gePointToFig()
    if(and(netSh netSh~>objType=="line") then netSh else netSh=nil)
  )
  termIds=netSh~>net~>instTerms
  foreach(term termIds
   cond(
       (formId~>ignoreOpt~>value=="Library" if(member(term~>inst~>libName parseString(formId~>ignoreLibVal~>value)) then add?=nil else add?=t))
       (formId~>ignoreOpt~>value=="Cell" if(member(term~>inst~>cellName parseString(formId~>ignoreCellVal~>value)) then add?=nil else add?=t))
   ) ;cond
   when(add?
   if(formId~>hierInfoField~>value=="/" then
        myChoice=list(strcat(formId~>hierInfoField~>value term~>inst~>name "/" term~>name))
   else
        myChoice=list(strcat(formId~>hierInfoField~>value "/" term~>inst~>name "/" term~>name))
   ) ;if
        when(!member(car(myChoice) asiGetOutputList(asiGetCurrentSession())~>signal)
        choiceList=append(choiceList myChoice)
        )
   )
  ) ;foreach
  formId~>listBoxField~>choices=choiceList
  envSetVal("ui" "infix" 'boolean infixVal)
) ;let
) ;proc


procedure(CCSSelectNetVoltage()
let((formId netSh sessId win infixVal topCv ds switchView stopView instNames propName evalName) 
  formId = hiGetCurrentForm()
  win=hiGetCurrentWindow()
  sessId = sevSession(win)
  infixVal = envGetVal("ui" "infix" )
  envSetVal("ui" "infix" 'boolean nil)
  while(!netSh
   printf("Select a Net in Schematic ...")
   netSh = gePointToFig()
    if(and(netSh netSh~>objType=="line") then netSh else netSh=nil)
  )
  sevChangeOutsOnSchematic(sessId 'save)
       geDeselectAllFig(geGetWindowCellView(win))
       termBox = netSh~>bBox
       myPt = centerBox(termBox)
       geAddSelectPoint(win nil myPt)
 astiCancelSelect(win)


/*
  if(rexMatchp("cdsNetExpr" car(netSh~>children)~>theLabel) then
     topCv = geGetTopLevelCellView(hiGetCurrentWindow())
     ds = '(nil)
     ds->libName=topCv~>libName
     ds->cellName=topCv~>cellName
     ds->viewName=topCv~>viewName
     ds->switchViewList = "schematic cmos_sch symbol"
     ds->stopViewList = "spectre"
     instNames = list(formId->hierInfoField->value)
     info = car(schNetExprAvailProps(ds instNames))
     propName = nthelem(2 parseString(car(car(netSh~>children)~>prop)~>value "@:"))
     evalName = nthelem(2 car(setof(x info car(x)==propName)))
  else
     evalName = netSh~>net~>name
  );if 
  formId~>listBoxField~>choices=list(evalName)
*/
  envSetVal("ui" "infix" 'boolean infixVal)
) ;let
) ;proc


procedure(CCSSetOutputs(formId)
let((sessId choices win) 
 win = hiGetCurrentWindow()
 sessId = sevSession(win) 
 choices = formId~>listBoxField~>choices
 CCSAddOutputs(formId choices sessId win)
t
) ;let
) ;procedure

procedure(CCSAddOutputs(formId choices sessId win)
let((newForm myList inst termBox myPt)
/*  sevChangeOutsOnSchematic(sessId 'plot)
 foreach(choice choices
       geDeselectAllFig(geGetWindowCellView(win))
       myList = parseString(choice "/")  
       inst = dbFindAnyInstByName(geGetWindowCellView(win) nthelem(length(myList)-1 myList)) 
       termBox = car(car(setof(x inst~>instTerms x~>name==nthelem(length(myList) myList)))~>term~>pins)~>fig~>bBox
       myPt = centerBox(geTransformUserBBox(termBox geGetInstTransform(inst)))
       geAddSelectPoint(win nil myPt)
 ) ;foreach
 astiCancelSelect(win)
*/
  sevChangeOutsOnSchematic(sessId 'save)
 foreach(choice choices
       geDeselectAllFig(geGetWindowCellView(win))
       myList = parseString(choice "/")  
       inst = dbFindAnyInstByName(geGetWindowCellView(win) nthelem(length(myList)-1 myList)) 
       termBox = car(car(setof(x inst~>instTerms x~>name==nthelem(length(myList) myList)))~>term~>pins)~>fig~>bBox
       myPt = centerBox(geTransformUserBBox(termBox geGetInstTransform(inst)))
       geAddSelectPoint(win nil myPt)
 ) ;foreach
 astiCancelSelect(win)
 formId~>listBoxField~>choices=nil
))


procedure(CCSAddCustomOutputs()
; if(boundp('addOutputs) then
; hiDisplayForm('addOutputs)
; else
CCSSetTermCurrent()
hiDisplayForm('addOutputs)
)

; hiSetBindKey("Schematics" "<key>o" "CCSAddCustomOutputs()")
