--宠物指挥棒使用
RoleTaskInfo49111 = {}
function RoleTaskInfo49111:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49111)

	--dayNum,dayDoneNum
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 70 then
		table.insert(outvec, 10)
		table.insert(outvec, s_getVar(uid,116,49))
	else
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
