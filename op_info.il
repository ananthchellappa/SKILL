let( 'wname 'anostring) 
wname = hiGetWindowName(hiGetCurrentWindow())
rexCompile(").+$")
wname = rexReplace( wname ")" 1)
if( rexMatchp( "Environment" wname )
then
    anostring = buildString( list( "sevPrintResults('sevSession" substring(wname -2 1) " 'dcOpPoints)" ) "" )
    evalstring(anostring)
)
; sevPrintResults('sevSession1 'dcOpPoints)

