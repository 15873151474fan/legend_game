--炼金材料兑换
RoleTaskInfo49113 = {}
function RoleTaskInfo49113:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49113)

	--dayNum,dayDoneNum
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 81 then
		table.insert(outvec, 10)
		table.insert(outvec, s_getVar(uid,1,41))
	else
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
