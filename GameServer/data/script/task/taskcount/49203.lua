--领取周回馈福利
RoleTaskInfo49203 = {}
function RoleTaskInfo49203:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49203)

	--dayNum,dayDoneNum
	table.insert(outvec, 0)
	table.insert(outvec, 0)

	--weekNum, weekDoneNum
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 41 then
		table.insert(outvec, 1)

		local num = 0
		local week = s_getCurTime(TIME_CURYWEEKS)
		for i=1,18, 1 do
			if week == s_getVar(uid,7,i) then
				num = num + 1
			end
		end
		table.insert(outvec, num)
	else
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	end
end
