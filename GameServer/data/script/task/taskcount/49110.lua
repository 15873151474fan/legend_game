--宠物玩耍
RoleTaskInfo49110 = {}
function RoleTaskInfo49110:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49110)

	--dayNum,dayDoneNum
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 70 then
		table.insert(outvec, 5)
		table.insert(outvec, s_getVar(uid,116,74))
	else
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
