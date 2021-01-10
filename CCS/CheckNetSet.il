/*************************************************************************
* DISCLAIMER: The following code is provided for Cadence customers       *
* to use at their own risk. The code may require modification to         *
* satisfy the requirements of any user. The code and any modifications   *
* to the code may not be compatible with current or future versions of   *
* Cadence products. THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, *
* INCLUDING WITHOUT LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED         *
* WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.         *
*************************************************************************/

schRegPostCheckTrigger( 'CCScheckForNetSet )
 
procedure( CCScheckForNetSet(cv nErr nWarn "dxx" )
     let(( nUserErr nUserWarn instList)
                nErr
                nWarn
              printf( "Running netSet prop checking on all instances....\n" )
              nUserErr = 0
              nUserWarn = 0
		instList=list()
		foreach(inst cv~>instances
; Make sure pins from basic lib are not checked for netSet prop
			unless(inst~>libName=="basic"

; Check for props, and then prop name VDD and VSS
; Warn even if any property VDD or VSS is missing
			when(!inst~>prop || 
				!member("VDD" inst~>prop~>name) || 
				!member("VSS" inst~>prop~>name)
				instList=cons(inst~>name instList)
				warn("The instance %s is missing netSet property\n" inst~>name)
				nUserWarn++
				)
				)
			)
warn("Cumulative list of instances with missing netSet property\n %L\n" instList)
              schUpdateUserSRCErrorAndWarn( nUserErr nUserWarn )
          )
)
