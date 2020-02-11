--机智问答
RoleTaskInfo30060 = {}
function RoleTaskInfo30060:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30060)
	--dayNum
	table.insert(outvec, 1)
	--dayDoneNum
	table.insert(outvec, s_getVar(uid,47,3))
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
