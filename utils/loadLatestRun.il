 procedure( loadLatestRun()
; selectResultsForm#NUM# uses one NUM lower than session ID
; so you have to get session ID and then look at it and ...
; look in the run directory (default) for the latest run and then load it
 let( (sess lib cell view netl path  win cid latestRun )
  win = hiGetCurrentWindow()
  sess = sevSession( win )
  if( sess
  then
   sess=asiGetCurrentSession()
   netl = asiGetAnalogRunDir(sess)
   sess = sevSession(hiGetCurrentWindow() )
   ; NUM = itos( atoi(car( reverse( parseString( sess "" ) ) ))-1 )
   ; Not needed - cleaner to find the form and use that.. -- but this form doesn't show up :(
   ; unlike OP result print window..
   cid = ipcBeginProcess( strcat( "/home/ananth/utils/getLatestRun.sh " netl ) )
   ipcWait(cid)
   ; hiRegTimer("latestRun = ipcReadProcess( cid )" 10)
   latestRun = ipcReadProcess( cid 30)
   hiRegTimer("hiFormDone(hiGetCurrentForm())" 30)
   hiRegTimer("hiGetCurrentForm()->results->value=list(latestRun)" 10)
   sevSelectResults( sess )
   println( strcat("latest run : " latestRun ) )
   ; hiiSetCurrentForm( stringToSymbol( strcat( "selectResultsForm" NUM ) ) )
   ; evalstring( strcat("selectResultsForm" NUM "->results->value= '(\"" latestRun "\" )" ) )
   ; evalstring( strcat("hiFormDone(selectResultsForm" NUM ")" ) )
  ) ; if
 ) ; let
)
