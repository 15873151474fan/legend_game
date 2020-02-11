--跳舞
RoleTaskInfo30064 = {}
function RoleTaskInfo30064:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30064)
	--dayNum
	table.insert(outvec, s_getVar(uid,107,4))
	--dayDoneNum
	table.insert(outvec, s_getVar(uid,107,4) - s_getVar(uid,107,3))
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
