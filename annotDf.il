let( 'wname 'anostring) 
wname = hiGetWindowName(hiGetCurrentWindow())
rexCompile(").+$")
wname = rexReplace( wname ")" 1)
if( rexMatchp( "Environment" wname )
then
    anostring = buildString( list( "sevAnnotateResults('sevSession" substring(wname -2 1) " 'defaults)" ) "" )
    evalstring(anostring)
)
