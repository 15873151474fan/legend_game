--国战勋章兑换经验
RoleTaskInfo49205 = {}
function RoleTaskInfo49205:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49205)

	--dayNum,dayDoneNum
	table.insert(outvec, 0)
	table.insert(outvec, 0)

	--weekNum, weekDoneNum
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 61 then
		table.insert(outvec, 50)

		local num = s_getVar(uid,116,12)
		local week = s_getCurTime(TIME_CURYWEEKS)
		if week ~= s_getVar(uid,116,11) then
			num = 0
		end
		table.insert(outvec, num)
	else
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	end
end
