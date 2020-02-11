--购买幸运礼券
RoleTaskInfo49114 = {}
function RoleTaskInfo49114:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49114)

	--dayNum,dayDoneNum
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 41 then
		table.insert(outvec, 1)
		table.insert(outvec, s_getVar(uid,1,21))
	else
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
