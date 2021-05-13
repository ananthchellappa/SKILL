/*******************************************************************************
*  DISCLAIMER: The following code is provided for Cadence customers to use at  *
*   their own risk. The code may require modification to satisfy the           *
*   requirements of any user. The code and any modifications to the code may   *
*   not be compatible with current or future versions of Cadence products.     *
*   THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, INCLUDING WITHOUT     *
*   LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED WARRANTIES OF MERCHANTABILITY *
*   OR FITNESS FOR A PARTICULAR USE.                                           *
*******************************************************************************/

/*******************************************************************************
You'd like to descend to a hierarchical instance of your config view by
providing its hierarchical path. For example, you'd like to browse to instance
/I0/I1/I2/NM1.

The below SKILL code highlights the hierarchical instance descending to the 
hierarchy of the config view.

Steps to use the code:
1. Save the SKILL code as CCSDescendToInst.il file.
2. Load the file in .cdsinit or CIW:

	load("/complete/path/to/file/CCSDescendToInst.il")

3. Open the config view which contains /I0/I1/I2/NM1 instance.
4. Call API CCSDescendToInst with the following way to descend to I0/I1/I2 and 
get 'NM1' instance highlighted:

	CCSDescendToInst( '("I0" "I1" "I2" "NM1") )

*********************************************************************************/

procedure( CCSDescendToInst(hierList)
  let( (win cfgId curLibName curCellName curViewName pathVect currentInst notFound 
	hierString currentCv pcdbInstMasterGen  pcdbInstMaster pcdbInstGen 
	pcdbInst bindRtn )		
  win=hiGetCurrentWindow()
  cfgId=deGetConfigId(win)				   
  hierString=""
  curLibName=hdbGetTopLibName(cfgId)
  curCellName=hdbGetTopCellName(cfgId)
  curViewName=hdbGetTopViewName(cfgId)
  pathVect = hdbCreatePathVector(cfgId)
						 
    while(hierList					     
      if( length(hierList)!=1 then
	currentInst=car(hierList)
	currentCv=pcdbOpen(curLibName curCellName curViewName "r" "CDBA")
        pcdbInstMasterGen = pcdbGetInstMasterGen(currentCv)
	pcdbInstMaster = pcdbNextInstMaster(pcdbInstMasterGen)
	notFound=t
    	while( pcdbInstMaster
	  pcdbInstGen=pcdbGetInstGen(pcdbInstMaster)
	  pcdbInst=pcdbNextInst(pcdbInstGen)
	  while( pcdbInst && notFound
	    if( pcdbInstName(pcdbInst)== currentInst then
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
      else
        dePush(list(nil 'hierarchy hierString) hiGetCurrentWindow())
	geSelectObject(dbGetInstanceByName( geGetWindowCellView() car(hierList) ))
      );if
      hierList=cdr(hierList)
    );hierList
    hdbDestroyPathVector(pathVect)
  )
)



