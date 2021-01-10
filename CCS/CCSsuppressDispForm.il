/*******************************************************************************
*  DISCLAIMER: The following code is provided for Cadence customers to use at  *
*   their own risk. The code may require modification to satisfy the           *
*   requirements of any user. The code and any modifications to the code may   *
*   not be compatible with current or future versions of Cadence products.     *
*   THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, INCLUDING WITHOUT     *
*   LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED WARRANTIES OF MERCHANTABILITY *
*   OR FITNESS FOR A PARTICULAR USE.                                           *
*******************************************************************************/

procedure(CCSsuppressDispForm()

   if( rexMatchp("version ICADV12.[1-2]" getVersion()) ||  rexMatchp("version 6.1.[6-9]" getVersion()) then
       printf("Loading CCSsuppressDispForm for cds version >= 6.1.6\n")
       hiEnqueueCmd("hiiSetCurrentForm('techSaveDrmForm) hiFormCancel(techSaveDrmForm)" )  
   else
       printf("Loading CCSsuppressDispForm for cds version < 6.1.6\n")
       hiRegTimer("hiiSetCurrentForm('techSaveDrmForm) hiFormCancel(techSaveDrmForm)" 5)
   )
) ;procedure

regExitBefore('CCSsuppressDispForm)
