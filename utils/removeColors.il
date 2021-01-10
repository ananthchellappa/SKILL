; from Pragati Kumar 46100078
; help from Parul Sharma 46132094 (add "path" as OR)
procedure( removeColors()
	cv=geGetWindowCellView()

	foreach(line setof(x cv~>shapes or( x~>objType=="line" x~>objType == "path") ) 
		if(line~>groupMembers 
		then 
			dbDeleteGroupMemberFromGroup(car(line~>groupMembers))
		)
	)

	hiRedraw( hiGetCurrentWindow())
)
