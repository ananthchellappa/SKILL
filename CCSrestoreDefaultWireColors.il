/* CCSrestoreDefaultWireColors.il

Language   SKILL
Date       Mar 17, 2006 
Modified   Apr 4, 2006 

Code to traverse a hierarchy, finding non-default wire 
colors, and resetting them to default.

There are three main entry points in this code:

Restore a single cellView
    CCSrestoreDefaultWireColors()
Restore all cellViews in a hierarchy
    CCSrestoreDefaultWireColorsHier(?verbose t)
Bring up a form to allow you to either search the hierarchy, or
reset the current cellView:
    CCShiRestoreDefaultWireColors()

See comments below for more detail on usage.

LINT score: 100% (with prefixes CCS and hic, STRICT ignored)

***************************************************

SCCS Info: @(#) CCSrestoreDefaultWireColors.il 04/04/06.08:55:26 1.3

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

/*****************************************************************
*                                                                *
*   (CCSrestoreDefaultWireColors [cellView [save [verbose]]])    *
*                                                                *
* Restores the default wire colors in the cellView - defaults to *
* current cellView. Second optional argument controls whether it *
*                 saves after making the change.                 *
*                                                                *
*****************************************************************/

(procedure (CCSrestoreDefaultWireColors @optional 
				       (cellView (geGetEditCellView)) save
				       verbose)
  (let (packetGroup)
       (setq packetGroup (car (exists group (dbGetq cellView groups)
				      (equal (dbGetq group name)
					     "schDisplayPacketsGroup"))))
       (when packetGroup
	     (if (dbReopen cellView "a")
		 ;-------------------------------------------------------
		 ; Delete each group referred to in schDisplayPacketsGroup,
		 ; then delete the master group
		 ;-------------------------------------------------------
		 (progn
		  (foreach group (dbGetq packetGroup objects)
			   (dbDeleteGroupByName cellView (dbGetq group name)))
		  (dbDeleteGroupByName cellView "schDisplayPacketsGroup")
		  (when verbose
			(printf "Reset wire colors in %s/%s/%s\n"
				(dbGetq cellView libName)
				(dbGetq cellView cellName)
				(dbGetq cellView viewName)))
		  (when save (dbSave cellView))
		  )
		 (warn "Could not open %s/%s/%s for edit; skipping restoration of default colors" 
		       (dbGetq cellView libName)
		       (dbGetq cellView cellName)
		       (dbGetq cellView viewName)
		       )
		 )
	     )
       )
  )

/******************************************************************
*                                                                 *
*(CCSrestoreDefaultWireColorsHier [?cellView (geGetEditCellView)] *
*  [?viewList "schematic cmos_sch symbol"] [?stopList "symbol"]   *
*          [?save nil] [?cellsDone nil] [?verbose nil])           *
*                                                                 *
* Traverse the hierarchy, starting from a cellView, with a given  *
*      view and stop list, restoring wire colors to default.      *
*                                                                 *
******************************************************************/

(procedure (CCSrestoreDefaultWireColorsHier @key
					   (cellView (geGetEditCellView))
					   (viewList "schematic cmos_sch symbol")
					   (stopList "symbol")
					   save
					   verbose
					   cellsDone
					   )
  (let (switchedView)
       ;-----------------------------------------------------------------
       ; Convert stop list to a list
       ;-----------------------------------------------------------------
       (unless (listp stopList) (setq stopList (parseString stopList)))
       ;-----------------------------------------------------------------
       ; Only process if not been here before
       ;-----------------------------------------------------------------
       (unless (member cellView cellsDone)
	       (CCSrestoreDefaultWireColors cellView save verbose)
	       (setq cellsDone (cons cellView cellsDone))
	       (foreach header (dbGetq cellView instHeaders)
			;------------------------------------------------
			; Switch views
			;------------------------------------------------
			(setq switchedView (dbGetAnyInstSwitchMaster
					    (car (dbGetq header instances))
					    viewList))
			;------------------------------------------------
			; If the switched view exists and is not in the
			; stop list
			;------------------------------------------------
			(when (and switchedView
				   (null 
				    (member (dbGetq switchedView viewName)
					    stopList))
				   )
			      ;------------------------------------------
			      ; Recurse
			      ;------------------------------------------
			      (setq cellsDone
				    (CCSrestoreDefaultWireColorsHier
				     ?cellView switchedView
				     ?viewList viewList
				     ?stopList stopList
				     ?save save
				     ?verbose verbose
				     ?cellsDone cellsDone
				     ))
			      ) ; when
			) ; foreach
	       ) ; unless
       cellsDone
       ) ; let
  ) ; procedure

/***************************************************************
*                                                              *
*            (CCSrestoreDefaultWireColorsCreateForm)           *
*                                                              *
*      Create the form for CCShiRestoreDefaultWireColors.       *
*     Allows both single cellView and hierarchy traversal.     *
*                                                              *
***************************************************************/

(procedure (CCSrestoreDefaultWireColorsCreateForm)
  (let (save hier viewList stopList)
       (setq save
             (hiCreateBooleanButton
              ?name 'save
              ?buttonText "Save after changes"
              ?value nil
              ?defValue nil
              ))
       (setq hier
             (hiCreateBooleanButton
              ?name 'hier
              ?buttonText "Travese Hierarchy"
              ?callback "(CCSrestoreDefaultWireColorsHierCB (hiGetCurrentForm))"
              ?value nil
              ?defValue nil
              ))
       (setq viewList
	     (hiCreateStringField
	      ?name 'viewList
	      ?prompt "View list"
	      ?defValue "schematic cmos_sch symbol"
	      ?enabled nil
	      ))
       (setq stopList
	     (hiCreateStringField
	      ?name 'stopList
	      ?prompt "Stop list"
	      ?defValue "symbol"
	      ?enabled nil
	      ))
       ;-----------------------------------------------------------------
       ; Use attachments to allow the form to be stretchable
       ;-----------------------------------------------------------------
       (hiCreateAppForm
	?name 'CCSrestoreDefaultWireColorsForm
	?formTitle "Restore Default Wire Colors"
	?fields (list
		 (list save 0:0 450:30 120)
		 (list hier 0:30 450:30 120)
		 (list viewList 0:60 450:30 120)
		 (list stopList 0:90 450:30 120)
		 )
	?attachmentList (list
			 (bor hicLeftPositionSet hicRightPositionSet)
			 (bor hicLeftPositionSet hicRightPositionSet)
			 (bor hicLeftPositionSet hicRightPositionSet)
			 (bor hicLeftPositionSet hicRightPositionSet)
			 )
	?initialSize 450:120
	?callback 'CCSrestoreDefaultWireColorsCB
	) ; hiCreateAppForm
       ) ; let
  ) ; procedure

/***************************************************************
*                                                              *
*           (CCSrestoreDefaultWireColorsHierCB form)           *
*                                                              *
*  Callback for the Traverse Hierarchy field - either enables  *
*           or disables the view list and stop list            *
*                                                              *
***************************************************************/

(procedure (CCSrestoreDefaultWireColorsHierCB form)
  (hiSetFieldEnabled (getq form viewList)
		     (getq (getq form hier) value))
  (hiSetFieldEnabled (getq form stopList)
		     (getq (getq form hier) value))
  )

/***************************************************************
*                                                              *
*             (CCSrestoreDefaultWireColorsCB form)             *
*                                                              *
*    Main form callback. Calls the underlying API functions    *
*                                                              *
***************************************************************/

(procedure (CCSrestoreDefaultWireColorsCB form)
  (let (cellView)
       (setq cellView (geGetEditCellView))
       (if (getq (getq form hier) value)
	   ;-------------------------------------------------------------
	   ; if hierarchy button selected, traverse hierarchy
	   ;-------------------------------------------------------------
	   (CCSrestoreDefaultWireColorsHier
	    ?cellView cellView
	    ?viewList (getq (getq form viewList) value)
	    ?stopList (getq (getq form stopList) value)
	    ?save (getq (getq form save) value)
	    ?verbose t
	    )
	   ;-------------------------------------------------------------
	   ; Otherwise just do this cellView
	   ;-------------------------------------------------------------
	   (CCSrestoreDefaultWireColors
	    cellView
	    (getq (getq form save) value)
	    t
	    )
	   ) ; if
       (hiRedraw)
       t
       ) ; let
  ) ; procedure

/***************************************************************
*                                                              *
*                (CCShiRestoreDefaultWireColors)               *
*                                                              *
*       Bring up the form to restore default wire colors       *
*                                                              *
***************************************************************/

(procedure (CCShiRestoreDefaultWireColors)
  (unless (boundp 'CCSrestoreDefaultWireColorsForm)
	  (CCSrestoreDefaultWireColorsCreateForm))
  (hiDisplayForm CCSrestoreDefaultWireColorsForm)
  )

