/*******************************************************************************
*  DISCLAIMER: The following code is provided for Cadence customers to use at  *
*   their own risk. The code may require modification to satisfy the           *
*   requirements of any user. The code and any modifications to the code may   *
*   not be compatible with current or future versions of Cadence products.     *
*   THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, INCLUDING WITHOUT     *
*   LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED WARRANTIES OF MERCHANTABILITY *
*   OR FITNESS FOR A PARTICULAR USE.                                           *
*******************************************************************************/
; if this is loaded BEFORE you run a run in Assembler, then, after the run completes, right click on run
; name in History and select Notes and you'll see the total run time displayed in a pop-up dialog

define(RunTime(sessionName sdbHandle modeName testName)
let((jobMode jp jpN jpS haltSim?) 
  if(maeIsValidMaestroSession(sessionName) then
     evalstring(sprintf(nil "time_%s=%L" sessionName getCurrentTime()))
  )
)
)


(defun RunFinishedTime (session runid runsdb )
   (let (compTime )
   (println "--- runFinishedConclusion ---")
   compTime = compareTime(getCurrentTime() evalstring(strcat("time_" session)))
   axlPutNote(axlGetMainSetupDB(session) "history" axlGetHistoryName(axlGetCurrentHistory(session)) sprintf(nil "Run Time = %L seconds" compTime))
)
)


(define (connect_handlers session_name)
  (axlSessionConnect session_name "preRun" 'RunTime)
  (axlSessionConnect session_name "runFinishedConclusion" 'RunFinishedTime)
)

(axlSessionRegisterCreationCallback 'connect_handlers)
