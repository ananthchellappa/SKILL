/* CCSexportAllBindKeys.il

Group		Custom IC, Cadence Design Systems
Language	SKILL
Revision No.	1.1
Date Created	Mar 31, 2010 
Last Modified	
Tested in	
Lint score	100 (best is 100)
Description:

A SKILL function to export all of the bindkey settings for a session
either to a view window, or to a file.  In each case the formatting
should match that of the "Show Bind Keys" function on the Options ->
Bindkeys form.  If the CCSexportAllBindKeys() function is given no
argument then it will open a view window and output all of the bindkey
settings to that window.  However, an optional filename can be supplied
which the output is written to, and an additional optional flag "view"
will open this file in a view window.  In both cases the view window
contents can be saved to a user-specified file.

Usage:
	;; ensure that this code is loaded in the CIW or through a
	;; .cdsinit file or other mechanism (e.g. autoloads)
	;; and call it with 0, 1 or 2 arguments:

	CCSexportAllBindKeys()

	;; write output to the file /tmp/myBindkeys.il
	CCSexportAllBindKeys("/tmp/myBindkeys.il")

	;; write output to the file /tmp/myBindkeys.il and view in a
	;; view file window also
	CCSexportAllBindKeys("/tmp/myBindkeys.il" t)

***************************************************

SCCS Info: @(#) CCSexportAllBindKeys.il 03/31/10.14:59:24 1.1

***********************************************************************
* DISCLAIMER: This code is provided for Cadence customers to use      *
* with Cadence tools at their own risk. The code may require          *
* modification to satisfy the requirements of any user. The code and  *
* any modifications to the code may not be compatible with current or *
* future versions of Cadence products.                                *
* THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, INCLUDING      *
* WITHOUT LIMITATION ANY EXPRESS OR IMPLIED WARRANTIES OF             *
* MERCHANTABILITY, FITNESS FOR A PARTICULAR USE OR NON-INFRINGEMENT.  *
* © 2010 Cadence Design Systems, Inc. All rights reserved.            *
***********************************************************************

*/

procedure(CCSexportAllBindKeys(@optional (exportFile "") view "tg")
  let( (viewWin fileMenu saveAs closeWin filePtr bindKeyList padding)
  ;; if the exportFile is not specified, i.e. it is the default blank string
  ;; then use the hiShowBindKeysByAppType function to display the bindkeys
  ;; for each application type (cannot filter away the empty ones), otherwise
  ;; open the output file and write out the formatted bindkeys to that file
  if(blankstrp(exportFile) then
    ;; create the window
    viewWin = hiCreateWindow(nil "text" "Show File")
    ;; create the File menu with "Save As" and "Close Window" items
    saveAs = hiCreateMenuItem(?name 'saveAs ?itemText "Save As..."
      ?callback "hiSaveAsViewfile()")
    closeWin = hiCreateMenuItem(?name 'closeWin ?itemText "Close Window"
      ?callback "hiCloseWindow(hiGetCurrentWindow())")
    fileMenu = hiCreatePulldownMenu('fileMenu "File" list(saveAs closeWin))
    hiInsertBannerMenu(viewWin fileMenu 0)
    ;; iterate over each application type and append the bindkey settings
    ;; to the window just created
    foreach(appType hiGetBindKeyPrefixList()
      ;; swallow any warnings for non-existent bindkeys for this prefix
      getWarn()
      hiShowBindKeysByAppType(viewWin appType)
    )
    hiSetIconName(viewWin "All Bindkeys")
    hiSetWindowName(viewWin "All Bindkeys") 
    hiDisplayWindow(viewWin)
  else
    ;; if we can open the output file for writing do so, otherwise give
    ;; a warning message that the file could not be opened
    if((filePtr = outfile(exportFile)) then
      ;; use foreach mapcar to create a list of lists where the head of
      ;; the list is the application type and the tail is the list of
      ;; bindkeys for that application type, store in bindKeyList
      bindKeyList = foreach(mapcar appType hiGetBindKeyPrefixList()
	;; swallow any warnings for non-existent bindkeys for this prefix
	getWarn()
	list(appType hiGetBindKeys(appType))
      ); foreach mapcar
      ;; filter bindKeyList to remove any bindkey list that is empty
      bindKeyList = setof(bindKey bindKeyList cadr(bindKey))
      ;; iterate over the list of application-and-bindkey-list combination
      ;; and print out the bindkeys formatted to match the output of the
      ;; "Show Bind Keys" button from the Options -> Bindkeys form
      foreach(bindKeyAndApp bindKeyList
	fprintf(filePtr "hiSetBindKeys( %L list(\n\n" car(bindKeyAndApp))
	fprintf(filePtr ";\tKey\t\t\t[;alternate encodings used for same key]\n")
	fprintf(filePtr ";\t\t\t\tNormal Action\n")
	fprintf(filePtr ";\t\t\t\t[Enter Function Action	;EF]\n\n")
	;; for each bindkey print the entries with the appropriate padding
	;; so that the formatting matches that of "Show Bind Keys"
	foreach(bindKey cadr(bindKeyAndApp)
	  padding = ""
	  ;; build the padding string based on the length of the key sequence
	  for(i 1 24-strlen(car(bindKey))
	    padding = strcat(" " padding)
	  )
	  ;; output in list format the key sequence, padding and callback
	  fprintf(filePtr "list(%L %s%L" car(bindKey) padding cadr(bindKey))
	  ;; if there is an enterFunction key binding then output this so
	  ;; that it is formatted correctly, otherwise close the list
	  if(length(bindKey)>2
	    fprintf(filePtr "\n                                %L)\t;EF\n"
	      caddr(bindKey))
	    fprintf(filePtr ")\n")
	  ); if
	); foreach bindkey
	;; close the list and the hiSetBindKey command parentheses
	fprintf(filePtr "))\n\n")
      ); foreach bindkey and application grouping
      ;; close the file handle
      close(filePtr)
      ;; when the "view" flag is non-nil, open the exported file for viewing
      when(view
	view(exportFile nil "All Bindkeys")
      )
    else
      warn("CCSexportAllBindKeys: could not open %s for writing\n" 
	exportFile)
    ); if
  ); if
  ); let
); procedure CCSexportAllBindKeys
