--帝都战勋章兑换神魂印记
RoleTaskInfo49211 = {}
function RoleTaskInfo49211:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49211)

	--dayNum,dayDoneNum
	table.insert(outvec, 0)
	table.insert(outvec, 0)

	--weekNum, weekDoneNum
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 101 then
		table.insert(outvec, 20)

		local num = s_getVar(uid,116,63)
		local week = s_getCurTime(TIME_CURYWEEKS)
		if week ~= s_getVar(uid,116,57) then
			num = 0
		end
		table.insert(outvec, num)
	else
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	end
end
