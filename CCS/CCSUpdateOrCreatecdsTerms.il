; load "/home/achellappa/skill/CCS/CCSUpdateOrCreatecdsTerms.il"

procedure(CCSUpdateOrCreatecdsTerms() 
let((cv pinFig existLabel string location location1 location2 label label1 label2) 
cv=geGetWindowCellView() 

foreach(term cv~>terminals 
	pinFig=car(term~>pins)~>fig 
	existLabel=setof(child pinFig~>children and(child~>objType=="label" rexMatchp("cdsTerm" child~>theLabel))) 
	string=buildString(list(concat("cdsTerm(\"" term~>name "\")" )))
 
	if(existLabel then 
	if(!rexMatchp(string car(existLabel)~>theLabel) then 
	car(existLabel)~>theLabel=string 
	) ; rexMatchp 
	else 
	printf("Will create a new label for term %L\n" term~>name) 

	if(term~>direction=="input" then 
		location=caar(term~>pins~>fig~>bBox) 
		label=if(!member(string cv~>shapes~>theLabel) then 
		dbCreateLabel(cv list("annotate" "drawing8") xCoord(location)-0.6:yCoord(location) string "lowerLeft" "R0" "stick" 0.0625)) 
		label~>labelType="ILLabel"
		schGlueLabel(label pinFig) 
		printf("\tCreated a new label for input term %L\n" term~>name)
	else 
	if(term~>direction == "output" then 
		location1= caar(term~>pins~>fig~>bBox) 
		label1=if(!member(string cv~>shapes~>theLabel) then 
		dbCreateLabel(cv list("annotate" "drawing8") xCoord(location1):yCoord(location1) string "lowerLeft" "R0" "stick" 0.0625)) 
		label1~>labelType="ILLabel"
		schGlueLabel(label1 pinFig)
		printf("\tCreated a new label for output term %L\n" term~>name) 
	else 
	
	location2= caar(term~>pins~>fig~>bBox) 
	label2=if(!member(string cv~>shapes~>theLabel) then 
	dbCreateLabel(cv list("annotate" "drawing8") location2 string "lowerLeft" "R0" "stick" 0.0625)) 
	label2~>labelType="ILLabel"
	schGlueLabel(label2 pinFig) 
	printf("Created a new label for in/out term %L\n" term~>name)
	) ;if termDirection output
	) ;if termDirection input
) ;if existLabel 
) ;foreach 
schHiVICAndSave()
) ;let 
) ;procedure CCSUpdateOrCreatecdsTerms 

; hiSetBindKey("Symbol" "<Key>F2" "CCSUpdateOrCreatecdsTerms()") 
