--领取神之守护军状态
RoleTaskInfo49202 = {}
function RoleTaskInfo49202:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49202)

	--dayNum,dayDoneNum
	table.insert(outvec, 0)
	table.insert(outvec, 0)

	--weekNum, weekDoneNum
	local army = s_getArmyID(uid)
	if army == 0 then
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	else
		local occupy = s_getArmyOccupy(army)
		if occupy == 0 then
			table.insert(outvec, 0)
			table.insert(outvec, 0)
		else
			table.insert(outvec, 1)

			local cweek = s_getCurTime(TIME_CURYWEEKS)
			if cweek == s_getVar(uid,109,7) then
				table.insert(outvec, 1)
			else
				table.insert(outvec, 0)
			end
		end
	end
end
