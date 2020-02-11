--生存训练
RoleTaskInfo30065 = {}
function RoleTaskInfo30065:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30065)
	--dayNum
	table.insert(outvec, RoleTaskInfo30043.ring)
	--dayDoneNum
	local daydonenum = GetTaskDayDoneNum(uid, 30043) + GetTaskDayDoneNum(uid, 30045)
	table.insert(outvec, daydonenum)
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
