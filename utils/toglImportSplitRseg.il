; load "/home/USERNAME/SKILL/toglImportSplitRseg.il"

; FYI, these settings are accessible through (in LayoutXL) :
; Options > LayoutXL > Schematic Parameters tab
; if you are not sure which setting you're in, do Ctrl-M twice - you'll
; end up back where you are and you can see in the CIW where you're at..
; suggested use mode :
; start with default setting (grouped, not split)
; import all devices; select resistors need to be split in the schematic and
; delete these in the layout;
; then, change your setting to import as split and import remaining R's that
; need to be split for interdigitation

procedure( toglImportSplitRseg()
	if( rexMatchp( "segments"  envGetVal("layoutXL" "sfactorNames" ) )
	then
		envSetVal( "layoutXL" "sfactorNames" 'string "s S")
		envSetVal( "layoutXL" "mfactorNames" 'string "m M")
		println( "WARNING : R's will be imported grouped, not split" )
	else
		envSetVal( "layoutXL" "sfactorNames" 'string "s S segments")
		envSetVal( "layoutXL" "mfactorNames" 'string "m M segments")
		println( "W A R N I N G : R's will be imported split" )
	)
)


hiSetBindKey("Layout" "Ctrl <Key>m" "toglImportSplitRseg()")
