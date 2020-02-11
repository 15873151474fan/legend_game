--喂养团Boss
RoleTaskInfo49106 = {}
function RoleTaskInfo49106:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49106)

	--dayNum, dayDoneNum
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	else
		table.insert(outvec, 10)

		local daydonenum = 0
		local days = s_getCurTime(TIME_ALLDAYS)
		local last = s_getVar(uid,103,2)
		local daydonenum = s_getVar(uid,103,9)
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
