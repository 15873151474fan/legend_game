--领取活力点宝箱
RoleTaskInfo49108 = {}
function RoleTaskInfo49108:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49108)

	--dayNum, dayDoneNum
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 31 then
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	else
		table.insert(outvec, 1)
		table.insert(outvec, s_getVar(uid,10,1))
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
