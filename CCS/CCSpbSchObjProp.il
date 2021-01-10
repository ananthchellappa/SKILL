/*******************************************************************************
*  DISCLAIMER: The following code is provided for Cadence customers to use at  *
*   their own risk. The code may require modification to satisfy the           *
*   requirements of any user. The code and any modifications to the code may   *
*   not be compatible with current or future versions of Cadence products.     *
*   THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, INCLUDING WITHOUT     *
*   LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED WARRANTIES OF MERCHANTABILITY *
*   OR FITNESS FOR A PARTICULAR USE.                                           *
*******************************************************************************/

/* SKILL Lint: 80 due to global warning regarding schObjPropForm (if set as local then this SKILL will not work.)
    No private function is used.
*/

 
procedure(CCSpbSchObjProp()
let((my_f)
schHiObjectProperty()
my_f = schObjPropForm
hiSetFormSize(my_f  '(600 600))
)
)

hiSetBindKey("Schematics" "q" "CCSpbSchObjProp()")
