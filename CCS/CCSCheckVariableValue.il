/*************************************************************************
* DISCLAIMER: The following code is provided for Cadence customers *
* to use at their own risk. The code may require modification to *
* satisfy the requirements of any user. The code and any modifications *
* to the code may not be compatible with current or future versions of *
* Cadence products. THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, *
* INCLUDING WITHOUT LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED *
* WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE. *
*************************************************************************/

procedure(CCSCheckVariableValue() 
let((session sdb varList t1 sevSess asiSess val) 
  session = axlGetWindowSession() 
  sdb = axlGetMainSetupDB(session) 
  varList = axlGetVars(sdb) 
  foreach(var cadr(varList) 
      varVal = evalstring(axlGetVarValue(axlGetVar(sdb var)) )
      if(varVal>5e3 || varVal<3e3  then 
	     hiDisplayAppDBox( ?name 'message 
         ?dboxBanner sprintf(nil "Variable %L is out of range" var) 
         ?dboxText sprintf(nil "Variable %L is out of range , Stop the Simulation and change its Value In case you want to change" var) 
         ?dialogStyle 'modal 
        ) 
       ) ;if
  ) ;foreach 
) ;let
) ;procedure
 
(define (CheckVariables sessionName sdbHandle modeName testName) 
(CCSCheckVariableValue) 
) 
 
(define (connect_handlers session_name) 
(axlSessionConnect session_name "preRun" 'CheckVariables) 
) 
 
(axlSessionRegisterCreationCallback 'connect_handlers) 
