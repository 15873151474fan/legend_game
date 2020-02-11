--生命水晶
RoleTaskInfo30067 = {}
function RoleTaskInfo30067:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30067)
	--dayNum
	table.insert(outvec, 2)
	--dayDoneNum
	local times = s_getVar(uid,114,8)--次数是从零开始算的
	if math.floor(times/100) == s_getCurTime(TIME_ALLDAYS) then
		times = times % 100
	else
		times = 0
	end
	table.insert(outvec, times)
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
