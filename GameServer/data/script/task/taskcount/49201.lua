--请团长颁发团奖金
RoleTaskInfo49201 = {}
function RoleTaskInfo49201:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49201)

	--dayNum,dayDoneNum
	table.insert(outvec, 0)
	table.insert(outvec, 0)

	--weekNum, weekDoneNum
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 21 then
		table.insert(outvec, 1)

		if s_getField(uid,UserVar_WeekWage) == 0 then
			table.insert(outvec, 0)
		else
			table.insert(outvec, 1)
		end
	else
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	end
end
