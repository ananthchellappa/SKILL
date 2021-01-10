procedure( toglInstMstrDisplay()
	if( "instance" == hiGetCurrentWindow()~>instLabel
	then
		hiGetCurrentWindow()~>instLabel = "master"
	else
		hiGetCurrentWindow()~>instLabel = "instance"

	)
)


