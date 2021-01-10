; How to use : make sure the fl node report file is accessible to the utility
; from /tmp/fl_node_report_$USER.txt and you're all set..

procedure( fl_nodes_start()

	cid = ipcBeginProcess("~achellappa/perl/proc_flnode.pl /tmp/fl_node_report_$USER.txt 0")
	hiRegTimer("CLIPDATA = ipcReadProcess( cid )" 10)
	ipcWaitForProcess(cid 1)
		println("Here's the text : ")
		println(CLIPDATA)

	hiRegTimer("zoomNetVA(CLIPDATA)" 15)
)

procedure( next_fl_node()

	cid = ipcBeginProcess("~achellappa/perl/proc_flnode.pl /tmp/fl_node_report_$USER.txt")
	hiRegTimer("CLIPDATA = ipcReadProcess( cid )" 10)
	ipcWaitForProcess(cid 1)

	hiRegTimer("zoomNetVA(CLIPDATA)" 15)

)

hiSetBindKey("Schematics" "Ctrl Shift<Key>v" "next_fl_node()")
