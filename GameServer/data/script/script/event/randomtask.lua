--玩家请求随机任务
function OnRequestRandomTaskInfo(uid)
	local taskid = 31000
	--产生今日幸运值
	local fortune = s_getField(uid,UserVar_Fortune)
	local randomid = s_getVar(uid,taskid,TvarIndex_RandomTaskID)
	if randomid == 0 then
		RoleTaskInfo31000:RandomTask(uid, fortune)
	end
	--发送任务数据
	RoleTaskInfo31000:Show(uid)
end

function OnHelpOtherRandomTask(thisid,uid,fortune)
	local taskid = 31000
	local childtask = s_getVar(uid,taskid,TvarIndex_RandomTaskID)
	if childtask ~= 0 then
		local childinfo = GetSubTaskInfo(childtask, 1)
		if childinfo ~= nil and childinfo ~= 0 then
			local childcolor = childinfo.color
			if childcolor == TaskColor_Purple then
				s_sysInfo(thisid,"已经是紫色任务，不可再被刷新")
				return 0
			end
		end
	end
	RoleTaskInfo31000:RandomTask(uid, fortune)
	return 1
end

function OnAcceptRandomTask(uid)
	RoleTaskInfo31000:Accept(uid)
end
