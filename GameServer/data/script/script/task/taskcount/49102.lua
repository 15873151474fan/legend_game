--领取护国徽章
RoleTaskInfo49102 = {}
function RoleTaskInfo49102:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49102)
	--dayNum
	--if NpcMenuInfo63091:ShowCountryMedal(uid) == VALUE_OK then
	--	table.insert(outvec, 1)
	--else
		table.insert(outvec, 0)
	--end

	--dayDoneNum
	local days = s_getCurTime(TIME_ALLDAYS)
	local lastday = s_getVar(uid,103,6)
	if lastday == days then
		table.insert(outvec, 1)
	else
		table.insert(outvec, 0)
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
