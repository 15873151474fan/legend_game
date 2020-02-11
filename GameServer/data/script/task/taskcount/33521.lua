--膜拜帝皇
RoleTaskInfo33521 = {}
function RoleTaskInfo33521:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 33521)
	--dayNum
	table.insert(outvec, RoleTaskInfo33521.ring)
	--dayDoneNum
	table.insert(outvec, s_getVar(uid,117,4))
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
