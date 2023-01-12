;	hierDescend( '("I0" "I1" "I2" "NM1") )

; replaces CCSDescend.il

procedure( hierDescend(hierList)
  let( (win cfgId curLibName curCellName curViewName pathVect currentInst notFound
      hierString currentCv pcdbInstMasterGen  pcdbInstMaster pcdbInstGen
      pcdbInst bindRtn )           
  win=hiGetCurrentWindow()
  cfgId=deGetConfigId(win)                        
if(cfgId then
  hierString=""
  curLibName=hdbGetTopLibName(cfgId)
  curCellName=hdbGetTopCellName(cfgId)
  curViewName=hdbGetTopViewName(cfgId)
  pathVect = hdbCreatePathVector(cfgId)
                                     
    while( hierList                                  
 	  currentInst=car(hierList)
 	  currentCv=pcdbOpen(curLibName curCellName curViewName "r" "CDBA")
 	    pcdbInstMasterGen = pcdbGetInstMasterGen(currentCv)
 	  pcdbInstMaster = pcdbNextInstMaster(pcdbInstMasterGen)
 	  notFound=t
 	  while( pcdbInstMaster
 	    pcdbInstGen=pcdbGetInstGen(pcdbInstMaster)
 	    pcdbInst=pcdbNextInst(pcdbInstGen)
 	    while( pcdbInst && notFound
 	       	if( car(parseString(pcdbInstName(pcdbInst) "<:>"))==car(parseString(currentInst "<>")) then
 	    	notFound=nil
 	    	curLibName  = pcdbInstMasterLib(pcdbInstMaster)
 	    	curCellName = pcdbInstMasterCell(pcdbInstMaster)
 	    	curViewName = pcdbInstMasterView(pcdbInstMaster)
 	    	bindRtn = hdbBind(pathVect curLibName curCellName curViewName currentInst
 	    				pcdbInstMasterLibFixed(pcdbInstMaster)
 	    				pcdbInstMasterCellFixed(pcdbInstMaster)
 	    				pcdbInstMasterViewFixed(pcdbInstMaster))
 	    	curLibName=car(bindRtn)
 	    	curCellName=nth(1 bindRtn)
 	    	  curViewName=nth(2 bindRtn)
 	    	printf("Instance %s is bound to %s:%s:%s\n" currentInst curLibName curCellName curViewName)
 	    	hierString=strcat(hierString "/" currentInst "(" curViewName "):" "r")
 	    	hdbPushCell(pathVect currentInst curLibName curCellName curViewName)
 	      )
 	      pcdbInst=pcdbNextInst(pcdbInstGen)
 	    );while
 	    pcdbInstMaster = pcdbNextInstMaster(pcdbInstMasterGen)
 	  );while
 	    pcdbClose(currentCv)
      hierList=cdr(hierList)
    ); while hierList
    dePush(list(nil 'hierarchy hierString) hiGetCurrentWindow())
    hdbDestroyPathVector(pathVect)
else
	curViewName=car(parseString(envGetVal("schematic" "viewNameList")))
	hierString=""
	 while(hierList && length(hierList)>0	; from >1
		currentInst=car(hierList)
		hierList=cdr(hierList)
		hierString=strcat(hierString "/" currentInst "(" curViewName "):" "r")
		)
		dePush(list(nil 'hierarchy hierString) hiGetCurrentWindow())
;	      	geSelectObject(dbGetInstanceByName( geGetWindowCellView() car(hierList) ))
	)
  )
)
