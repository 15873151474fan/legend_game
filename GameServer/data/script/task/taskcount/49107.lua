--进行团种植
RoleTaskInfo49107 = {}
function RoleTaskInfo49107:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49107)

	--dayNum, dayDoneNum
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	else
		table.insert(outvec, 1)

		local daydonenum = 0
		local days = s_getCurTime(TIME_ALLDAYS)
		local last = s_getVar(uid,103,98)
		local daydonenum = s_getVar(uid,103,99)
		if last ~= days then
			daydonenum = 0
		end
		table.insert(outvec, daydonenum)
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
