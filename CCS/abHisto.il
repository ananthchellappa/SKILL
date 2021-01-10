/* abHisto.il

Language   SKILL
Date       Mar 03, 2009 
Modified   Aug 27, 2009

Two functions that can be used by users:

abHisto(wave bins [min [max]])

Produces a histogram waveform from the input waveform,
where the y-values are split into bins (number specified).
The range of the y-values can either be specified by the
min and max optional arguments, or if omitted they will
default to the extent of the y-values.

abRegHistoSpecialFunction()

If this is called, it will add "abHisto" as a new special function
in the calculator, with a form to allow easy setup.

The code for abHisto itself is a backport of the histo() function
in IC613, with a little renaming and cleanup of the code.

***************************************************

SCCS Info: @(#) abHisto.il 08/28/09.17:46:48 1.4

*/

/*******************************************************************************
*  DISCLAIMER: The following code is provided for Cadence customers to use at  *
*   their own risk. The code may require modification to satisfy the           *
*   requirements of any user. The code and any modifications to the code may   *
*   not be compatible with current or future versions of Cadence products.     *
*   THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, INCLUDING WITHOUT     *
*   LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED WARRANTIES OF MERCHANTABILITY *
*   OR FITNESS FOR A PARTICULAR USE.                                           *
*******************************************************************************/

/***************************************************************
*                                                              *
*               _abHistoMethod(wf bins min max)                *
*                                                              *
*   PRIVATE function to call the internal histogram creation   *
*   function, taking care of handling nil min or max (which    *
*                    means fit entire data)                    *
*                                                              *
***************************************************************/
procedure(_abHistoMethod(wf bins min max) 
    let((yvec 
	    (epsilon 1e-20) nBars waveList tmpList
	    histWave
	) 
	waveList = _abGetLeafWaveforms(wf waveList) 
	yvec = drGetWaveformYVec(car(waveList)) 
	if(bins <= 1 then 
	    bins = drVectorLength(yvec)
	else 
	    unless(min 
		tmpList = mapcar('ymin waveList)
		tmpList = sort(tmpList 
			'lessp
		    ) 
		min = car(tmpList)
	    )
	    unless(max 
		tmpList = mapcar('ymax waveList)
		tmpList = sort(tmpList 
			'greaterp
		    )
		max = car(tmpList) 
		max = cond(
		    (max < 0.0 
			    (1 - epsilon) * max
			) 
		    (max > 0.0
			    (1 + epsilon) * max
			) 
		    (min < 0.0 
			    (- epsilon) * min
			) 
		    (t epsilon)
		)
	    ) ; unless 
	    if(max <= min then nil 
	    else 
		nBars = length(waveList)
		histWave = _abCreateHisto(wf bins nBars min max) 
		histWave->plotStyle = 'bar 
		histWave->barWidth = 1.0 
		famSetExpr(histWave 
		    famGenExpr('histo 
			list(famGetExpr(wf) bins min max)
		    )
		)
		histWave
	    ) ; if
	) ; if
    ) ; let
) ; procedure

/***************************************************************
*                                                              *
*             _abGetLeafWaveforms(wave outputList)             *
*                                                              *
*  PRIVATE low level function to get the leaf waveforms from   *
*                         a waveform.                          *
*                                                              *
***************************************************************/
procedure(_abGetLeafWaveforms(wave outputList) 
    let((sweepValues) 
	cond(
	    (drIsParamWave(wave) 
		sweepValues = domList(wave)
		foreach(value sweepValues 
		    outputList = _abGetLeafWaveforms(
			famValue(wave value) outputList
		    )
		)
		outputList
	    ) 
	    (drIsWaveform(wave) 
		outputList = nconc(outputList list(wave))
	    ) 
	    (t 
		warn("Not a waveform or a family - %L" wave)
		outputList
	    )
	) ; cond
    ) ; let
) ; procedure 

/*************************************************************************
*                                                                        *
*                 _abCreateHisto(wf bins nBars min max)                  *
*                                                                        *
* PRIVATE low level function to create the histogram, by splitting the y *
*     values into bins, and then creating a waveform with the counts     *
*                                                                        *
*************************************************************************/
procedure(_abCreateHisto(wf bins nBars min max) 
    cond(
	(drIsWaveform(wf)
	    let((xvec yvec bin binSize binStart
		    realNBars barSize wfYVec outWave barNr
		    units yval
		) 
		xvec = drCreateVec('double 1)
		yvec = drCreateVec('double 1) 
		wfYVec = drGetWaveformYVec(wf) 
		binSize = float(max - min) / bins
		realNBars = nBars + 1
		barSize = float(binSize) / realNBars
		if(boundp('_abBarNr) && fixp(_abBarNr) then 
		    barNr = _abBarNr
		else 
		    barNr = 1
		) 
		for(i 0 bins - 1 
		    binStart = i * binSize + min 
		    for(bar 0 realNBars - 1 
			drSetElem(xvec 
			    i * realNBars + bar 
			    binStart + bar * barSize
			) 
			drSetElem(yvec 
			    i * realNBars + bar 0.0
			)
		    ) ; for
		) ; for
		drSetElem(xvec bins * realNBars max)
		drSetElem(yvec bins * realNBars 0.0) 
		for(i 0 drVectorLength(wfYVec) - 1 
		    bin = floor(((yval=drGetElem(wfYVec i)) - min) / binSize) 
		    ; handle special case of yval being exactly the
		    ; same as max (don't need a tolerance - this is just
		    ; for the case when we hit the value from which the
		    ; auto-fitted max was derived - otherwise the bin number
		    ; will not be < bins
		    when(yval==max bin=sub1(bins))
		    when(0 <= bin && bin < bins
			drSetElem(yvec 
			    bin * realNBars + barNr
			    drGetElem(yvec bin * realNBars + barNr) + 1.0
			)
		    )
		) 
		_abBarNr = _abBarNr + 1
		xvec->name = "BIN" 
		when(units = wfYVec->units
		    xvec->units = artMakeString(units)
		)
		yvec->name = "No. of Samples" 
		outWave = drCreateWaveform(xvec yvec)
		outWave
	    ) ; let
	) ; drIsWaveform branch 
	(famIsFamily(wf)
	    famMap('_abCreateHisto wf bins nBars min max)
	) ; famIsFamily branch
	(t 
	    artError("_abCreateHisto: can't handle _abCreateHisto%L\n" 
		list(wf bins nBars min max)
	    )
	) ; t branch
    ) ; cond
) ; procedure

/***************************************************************
*                                                              *
*                   abHisto(wf bins min max)                   *
*                                                              *
*            Main entry function for the histogram             *
*                                                              *
***************************************************************/
procedure(abHisto(wf bins @optional min max) 
    _abBarNr = 1
    _abHistoMethod(wf bins min max)
)

/***************************************************************
*                                                              *
*                     abCreateHistoForm()                      *
*                                                              *
*      Create the form for the backported histo function       *
*                                                              *
***************************************************************/
procedure(abCreateHistoForm()
    let((bins min max fit)
	bins=ahiCreateStringField(
	    ?name 'bins
	    ?prompt "Number of bins"
	    ?value "10"
	)
	min=ahiCreateStringField(
	    ?name 'min
	    ?prompt "Minimum Value"
	    ?value ""
	    ?enabled nil
	)
	max=ahiCreateStringField(
	    ?name 'max
	    ?prompt "Maximum Value"
	    ?value ""
	    ?enabled nil
	)
	fit=ahiCreateBooleanButton(
	    ?name 'fit
	    ?buttonText "Fit data"
	    ?value t
	    ?defValue t
	    ?callback "abHistoFitCB(hiGetCurrentForm())"
	)
	calCreateSpecialFunctionsForm(
	    'abHistoForm
	    list(
		list(bins 0:0  180:20 140)
		list(fit 0:30 180:20 140)
		list(min 10:50 180:20 130)
		list(max 10:80 180:20 130)
	    ) ; let
	) ; calCreateSpecialFunctionsForm
    ) ; let 
) ; procedure abCreateHistoForm

/********************************************************************
*                                                                   *
*                        abHistoFitCB(form)                         *
*                                                                   *
*   Callback for the fit data field. This enables or disables the   *
* min and max fields - to allow the user to type in the min and max *
*                          if they desire.                          *
*                                                                   *
********************************************************************/
procedure(abHistoFitCB(form)
    hiSetFieldEnabled(form->min !form->fit->value)
    hiSetFieldEnabled(form->max !form->fit->value)
)

/*****************************************************************
*                                                                *
*                   abHistoSpecialFunctionCB()                   *
*                                                                *
* Callback for the special function - this sets up the form, and *
*   specifies the function to be called when the form is OK'd    *
*                                                                *
*****************************************************************/
procedure(abHistoSpecialFunctionCB()
    calCreateSpecialFunction(
	?formSym 'abHistoForm
	?formInitProc 'abCreateHistoForm
	?formTitle "Histogram"
	?formCallback "abHistoCalSpecialFunctionInput()"
    )
)

/*****************************************************************
*                                                                *
*                abHistoCalSpecialFunctionInput()                *
*                                                                *
* Callback function for the form - has to assemble two different *
*   function call syntaxes - dependent on whether auto-fit is    *
* being used or not. I've made the min/max arguments to abHisto  *
*               optional, to support auto-fitting.               *
*                                                                *
*****************************************************************/
procedure(abHistoCalSpecialFunctionInput()
    let((form)
	form=hiGetCurrentForm()
	if(form->fit->value then
	    calSpecialFunctionInput( 'abHisto '(bins))
	else
	    calSpecialFunctionInput( 'abHisto '(bins min max))
	) ; if
    ) ; let
) ; procedure abHistoCalSpecialFunctionInput

/******************************************************************
*                                                                 *
*                   abRegHistoSpecialFunction()                   *
*                                                                 *
* Finally the function that is used to register the function with *
*                         the calculator                          *
*                                                                 *
******************************************************************/
procedure(abRegHistoSpecialFunction()
    calRegisterSpecialFunction(
	list("abHisto..." 'abHistoSpecialFunctionCB)
    )
    t
)
