--猎命师手札
RoleTaskInfo30061 = {}
function RoleTaskInfo30061:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30061)
	--dayNum
	table.insert(outvec, s_getVar(uid,47,2))
	--dayDoneNum
	table.insert(outvec, s_getVar(uid,47,2) - s_getVar(uid,47,1))
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
