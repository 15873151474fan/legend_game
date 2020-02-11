--膜拜帝皇
RoleTaskInfo49116 = {}
function RoleTaskInfo49116:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49116)

	--dayNum,dayDoneNum
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local emperor = s_getCountryField(13,CountryVar_Emperor)
	if level >= 71 and emperor ~= 0 then
		table.insert(outvec, 1)
		table.insert(outvec, s_getVar(uid,117,4))
	else
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
