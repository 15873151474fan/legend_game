--领取支持度声望
RoleTaskInfo49104 = {}
function RoleTaskInfo49104:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49104)

	--dayNum, dayDoneNum
	local fun = s_getFunction(uid,Relation_Country)
	if fun == FunctionType_Marshal or fun == FunctionType_ViceMarshal or fun == FunctionType_Interior
		or fun == FunctionType_Treasury or fun == FunctionType_Defense or fun == FunctionType_RoseKnight then

		table.insert(outvec, 1)

		local lastday = s_getVar(uid,100,9)
		local today = s_getCurTime(TIME_ALLDAYS)
		if today == lastday then
			table.insert(outvec, 1)
		else
			table.insert(outvec, 0)
		end
	else
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
