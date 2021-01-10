/* abInstFreq.il

Author     A.D.Beckett
Group      Custom IC (UK), Cadence Design Systems Ltd.
Language   SKILL
Date       Apr 13, 2004
Modified  
By        

Plots instantaneous frequency.

If using spectre, you'll get a more accurate result using the
freq_meter in ahdlLib, but this should be sufficient for
many purposes.

***************************************************

SCCS Info: @(#) abInstFreq.il 04/13/04.16:10:56 1.1

*/

/***************************************************************
*                                                              *
*                   (abCreateInstFreqForm)                     *
*                                                              *
*         Create the form for the calculator function          *
*                                                              *
***************************************************************/

(procedure (abCreateInstFreqForm)
  (let (start stop threshold edgeType)
       (setq start (ahiCreateStringField
                    ?name 'start
                    ?prompt "Start Time"
                    ?value "0"
                    ))
       (setq stop (ahiCreateStringField
                    ?name 'stop
                    ?prompt "Stop Time"
                    ?value "0"
                    ))
       (setq threshold (ahiCreateStringField
                    ?name 'threshold
                    ?prompt "Threshold"
                    ?value "0.0"
                    ))
       (setq edgeType (ahiCreateCyclicField
                       ?name 'edgeType
                       ?prompt "Edge Type"
                       ?value "rising"
                       ?choices '("rising" "falling")
                       ))
       (calCreateSpecialFunctionsForm
        'abInstFreqForm
        (list (list start 0:0  180:20 90)
              (list stop 0:30 180:20 90)
              (list threshold 0:60 180:20 90)
              (list edgeType 0:90 180:20 90)
              ))
       ))

/********************************************************************
*                                                                   *
*                  (abInstFreqSpecialFunctionCB)                    *
*                                                                   *
* The callback function which actually creates the special function *
*                                                                   *
********************************************************************/

(procedure (abInstFreqSpecialFunctionCB)
  (calCreateSpecialFunction
   ?formSym 'abInstFreqForm
   ?formInitProc 'abCreateInstFreqForm
   ?formTitle "Instantaneous Frequency"
   ?formCallback
   "calSpecialFunctionInput( 'abInstFreq '(start stop threshold edgeType))"
   ))

/***************************************************************
*                                                              *
*                  (abRegInstFreqSpecialFunction)              *
*                                                              *
* Register the special function. Pass t as argument if you're  *
*            using 4.3.4. 4.4.X doesn't need this.             *
*                                                              *
***************************************************************/

(procedure (abRegInstFreqSpecialFunction)
  (calRegisterSpecialFunction
   (list "instFreq..." 'abInstFreqSpecialFunctionCB))
  t
  )

/*****************************************************************
*                                                                *
*     (abInstFreq waveform start stop threshold [edgeType])      *
*                                                                *
* Produce a waveform of instantaneous frequency versus time. Can *
* either be done on the positive or negative edges - and can be  *
*             clipped to just part of the waveform.              *
*                                                                *
*****************************************************************/

(procedure (abInstFreq waveform start stop threshold @optional
                       (edgeType "rising"))
  (cond
   ;---------------------------------------------------------------------
   ; Handle ordinary waveform
   ;---------------------------------------------------------------------
   ((drIsWaveform waveform)
    (let (xVec len clipped crosses firstEdge period
               outXVec outYVec)
         (setq xVec (drGetWaveformXVec waveform))
         (setq len (drVectorLength xVec))
         ;---------------------------------------------------------------
         ; if no start given (start less or equal to 0), use first time point
         ;---------------------------------------------------------------
         (when (leqp start 0)
               (setq start (drGetElem xVec 0)))
         ;---------------------------------------------------------------
         ; if no stop given (stop less or equal to 0), use last time point
         ;---------------------------------------------------------------
         (when (leqp stop 0)
               (setq stop (drGetElem xVec (sub1 len))))
         ;---------------------------------------------------------------
         ; cast everything to floats, just to make sure
         ;---------------------------------------------------------------
         (setq start (float start))
         (setq stop (float stop))
         ;---------------------------------------------------------------
         ; clip the waveform
         ;---------------------------------------------------------------
         (setq clipped (clip waveform start stop))
         ;---------------------------------------------------------------
         ; Build the waveform
         ;---------------------------------------------------------------
         (setq outXVec (drCreateVec 'double 1))
         (setq outYVec (drCreateVec 'double 1))
         ;---------------------------------------------------------------
         ; And find the crossing points, and then convert them to
         ; instantaneous frequency
         ;---------------------------------------------------------------
         (setq crosses (cross clipped threshold 0 edgeType))
         (setq firstEdge (car crosses))
         (foreach cross (cdr crosses)
                  (setq period (difference cross firstEdge))
                  (when (greaterp (abs period) 1.0e-37)
                        (drAddElem outXVec cross)
                        (drAddElem outYVec 1.0/period)
                        )
                  (setq firstEdge cross)
                  )
         (drCreateWaveform outXVec outYVec)
         ))
   (t
    (error "abInstFreq - can't handle %L\n" waveform)
    )
   ) ; cond
  ) ; procedure 
