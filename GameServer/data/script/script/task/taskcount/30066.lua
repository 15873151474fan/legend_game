--钓鱼
RoleTaskInfo30066 = {}
function RoleTaskInfo30066:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30066)
	--dayNum
	table.insert(outvec, s_getVar(uid,116,29))
	--dayDoneNum
	table.insert(outvec, s_getVar(uid,116,29) - s_getVar(uid,116,16))
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
