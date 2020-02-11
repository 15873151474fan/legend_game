--前线速递
RoleTaskInfo30063 = {}
function RoleTaskInfo30063:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30063)
	--dayNum
	RoleTaskInfo30022:RefreshTaskRing(uid)
	table.insert(outvec, RoleTaskInfo30022.ring)
	--dayDoneNum
	local daydonenum = GetTaskDayDoneNum(uid, 30022) + GetTaskDayDoneNum(uid, 30023)
	table.insert(outvec, daydonenum)
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
