/* CCSchangeCells.il

Group		Custom IC, Cadence Design Systems
Language	SKILL
Revision No.	1.2
Date Created	May 19, 2003 
Last Modified   Sep 20, 2016	
Tested in	IC5141 IC616
Lint score	100 (best is 100)
Description:

This procedure will replace instances of one cell with another. In
the most simple form only the old and new cell names need to be
supplied and the function will operate on the current cellview.

Other keyword arguments allow the old and new views to be specified
and the old and new library names, and even the cellview to be
operated on. Keyword arguments are given as name value pairs, and
so can be specified in any order, for example ?cv can be specified
before ?oldLib

All instances matching the supplied criteria will be replaced.

Usage:

;; change all M2_M1 contacts to M3_M2
CCSchangeCells("M2_M1" "M3_M2")

;; change all M2_M1 contacts from deviceLib to M3_M2 (same library)
CCSchangeCells("M2_M1" "M3_M2" ?oldLib "deviceLib")

;; change all M2_M1 contacts from deviceLib to M3_M2 from library newLib
CCSchangeCells("M2_M1" "M3_M2" ?oldLib "deviceLib" ?newLib "newLib")

;; change M2_M1 instances to M3_M2 in the design "lib" "cell" "view"
;; of viewtype "schematic" in mode "a" (last two are optional arguments)
CCSchangeCells("M2_M1" "M3_M2"
  ?cv dbOpenCellViewByType("lib" "cell" "view" "schematic" "a")
  )

;; replace instances of nmos with nmos4 where nmos came from 
;; "analogLib" but nmos4 is to come from "myLib" the original view
;; was "symbol" but the new view is "mySym"
CCSchangeCells("nmos" "nmos4" ?oldLib "analogLib" ?newLib "myLib"
  ?oldView "symbol" ?newView "mySym"
  )

***************************************************

SCCS Info: @(#) CCSchangeCells.il 05/22/03.10:13:02 1.2

********************************************************************
* DISCLAIMER: The following code is provided for Cadence customers *
* to use at their own risk. The code may require modification to   *
* satisfy the requirements of any user. The code and any           *
* modifications to the code may not be compatible with current or  *
* future versions of Cadence products.                             *
* THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, INCLUDING   *
* WITHOUT LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED WARRANTIES  *
* OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.              *
********************************************************************

*/

/************************************************************************
*                                                                       *
*              CCSchangeCells(t_oldCellName t_newCellName               *
*                 [?oldLib t_oldLib] [?newLib t_newLib]                 *
*                 [?oldView t_oldView] [?newView t_newView]             *
*                 [?cv d_cellView])  =>  t/nil                          *
*                                                                       *
*  A function to change instances of "oldCellName" to "newCellName" in  *
*  the current cellview if no cellview is supplied. If only the cell    *
*  names are supplied, then the library and view name are taken to be   *
* the same. Otherwise the original and new names can be given for each  *
* library and view. The function returns 't' if instances were replaced *
*                    or 'nil' if none were changed.                     *
*                                                                       *
************************************************************************/
procedure( CCSchangeCells(oldCellName newCellName @key oldLib newLib
  oldView newView (cv geGetEditCellView()))
  let( (newMaster numDone)
  ;; when cv has a value and is a valid database object
  when( and(cv dbobjectp(cv))
    ;; foreach instance in the cellview
    foreach( inst cv~>instances
      ;; when this instance is to be changed
      when( inst~>cellName==oldCellName
	;; if the oldLib has not been given, get it from the instance
        unless( and(oldLib stringp(oldLib))
	  oldLib = inst~>libName
	)
	;; if a newLib has not been given, assume it will be same as the
	;; instances' current library
	unless( and(newLib stringp(newLib))
	  newLib = inst~>libName
	)
	;; if oldView is not specified, take it from the instance
	unless( and(oldView stringp(oldView))
	  oldView = inst~>viewName
	)
	;; if newView is not specified, assume it is the same as current
	unless( and(newView stringp(newView))
	  newView = inst~>viewName
	)
	;; if the instances' view and library match oldView and oldLib
	;; (which could have been supplied) and the requested new cellview
	;; exists, then change this instances master and increment the
	;; "numDone" number
	when( and( inst~>viewName==oldView
	           inst~>libName==oldLib
		   newMaster=dbOpenCellViewByType(newLib newCellName newView))
	  inst~>master = newMaster
	  numDone = add1( numDone || 0 )
	);; when
      );; when this instance is to be changed
    );; foreach instance
  );; when cv is a valid database object
  ;; if numDone is not nil then output a message, otherwise return "nil"
  if( numDone
    printf("Replaced %d instances" numDone)	;; printf returns 't'
    numDone					;; else return 'nil'
  );; if some were replaced
  );; let
);; procedure CCSchangeCells
