; run manually from CIW : customDrf()

; will hit wire color and highlight styles

if( isFileName( "display.drf_all" )
then
	println("Sorry, you must delete display.drf_all - to force this to overwrite" )
else
	drDumpDrf( "display.drf_all" )
	system( "~/perl/fix_wire_colour.pl display.drf_all" )
	system( "perl ~/perl/make_drf.pl" )
	system( "~/perl/fix_wire_colour.pl display.drf_thickLine" )
	system( "~/perl/fix_wire_colour.pl display.drf_dashed" )
	system( "~/perl/fix_wire_colour.pl display.drf_pwrplot" )
	system( "~/perl/fix_wire_colour.pl display.drf_blink" )
)
