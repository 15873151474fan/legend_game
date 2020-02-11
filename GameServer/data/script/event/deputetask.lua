function OnAcceptDeputeTask(uid,ttype)
	if ttype == 1 then
		if RoleTaskInfo33522:checkAccept(uid) == VALUE_OK then
			RoleTaskInfo33522:AddTask(uid)
		end
	elseif ttype == 2 then
		if RoleTaskInfo33523:checkAccept(uid) == VALUE_OK then
			RoleTaskInfo33523:AddTask(uid)
		end
	elseif ttype == 3 then
		if RoleTaskInfo33524:checkAccept(uid) == VALUE_OK then
			RoleTaskInfo33524:AddTask(uid)
		end
	elseif ttype == 4 then
		if RoleTaskInfo33525:checkAccept(uid) == VALUE_OK then
			RoleTaskInfo33525:AddTask(uid)
		end
	end
end
