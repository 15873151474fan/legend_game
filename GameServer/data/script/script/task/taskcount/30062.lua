--采集任务
RoleTaskInfo30062 = {}
function RoleTaskInfo30062:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30062)
	--dayNum
	table.insert(outvec, s_getTaskValue(uid,30062,TaskValue_DayNum) or 0)
	--dayDoneNum
	local daydonenum = GetTaskDayDoneNum(uid, 30006) + GetTaskDayDoneNum(uid, 30016) + GetTaskDayDoneNum(uid, 30027) + GetTaskDayDoneNum(uid, 30021) + GetTaskDayDoneNum(uid, 30041) + GetTaskDayDoneNum(uid, 30044) + GetTaskDayDoneNum(uid, 30046)
	table.insert(outvec, daydonenum)
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
