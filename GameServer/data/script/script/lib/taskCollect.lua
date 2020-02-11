--收集

--------------------------------------------------------------------------------------------------
--收集{int:BeginNpcID, int:EndNpcID}
--collectitem = {{itemid, itemlevel, itemnum},}
function s_taskCollect(taskid, subtaskid, paramlist, uid)
	if paramlist == nil then
		s_debug("任务:taskid:%d,subtaskid:%d 参数为空",taskid, subtaskid)
		return
	end
	local beginNpcID = 0
	if paramlist[1] ~= nil then	beginNpcID = paramlist[1] end
	local endNpcID = 0
	if paramlist[2] ~= nil then endNpcID = paramlist[2] end

	--检查收集物件表
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then return end
	if subinfo.collectitem == nil or type(subinfo.collectitem) ~= "table" or table.getn(subinfo.collectitem) == 0 then return end

	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if beginNpcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(beginNpcID, name, "s_taskCollect_AcceptDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end

		--结束NPC事件
		if endNpcID > 0 then
			AppendMenuToNpc(endNpcID, name, "s_taskCollect_FinishDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
		end

		--结束NPC为0，标志子任务为自动完成
		if endNpcID == 0 then
			local subinfo = GetSubTaskInfo(taskid, subtaskid)
			if subinfo.autofinish == nil then
				subinfo.autofinish = true
			end
		end
	end

	--自动接受的子任务直接接取
	if uid ~= nil then
		s_taskCollect_Accept(uid, taskid, subtaskid)
	end
end

function s_taskCollect_Accept(uid, taskid, subtaskid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.collectitem == nil or type(subinfo.collectitem) ~= "table" or table.getn(subinfo.collectitem) == 0 then return end

	--统计任务步骤
	local state = 0
	for i=1, table.getn(subinfo.collectitem), 1 do
		state = state + subinfo.collectitem[i][3]
	end

	if state == 0 then return end

	if AddRoleSubTask(uid, taskid, subtaskid, state, 0, 0, 0, subinfo.task[2][2]) == VALUE_FAIL then return end

	--添加收集物件到RoleTask中
	s_addTaskMaterial(uid, taskid, subinfo.collectitem)
end


function s_taskCollect_AcceptDealer(uid, taskid, subtaskid)
	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskCollect_Accept($1,".. taskid .. "," .. subtaskid ..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskCollect_FinishDealer(uid, taskid, subtaskid)
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
		local msg = GetSubTaskPromptText(uid, taskid, subtaskid)
		if msg == nil then return end
		ShowNpcMenuBottomStyle(uid,msg,"离开(5)")
	elseif taskProcess == TaskProcess_CanDone then
		local msg = GetSubTaskFinishText(uid, taskid, subtaskid)
		if msg == nil then return end
		local call = "FinishRoleSubTask($1,".. taskid .. "," .. subtaskid..")"
		local info = GetTaskInfo(taskid)
		if subtaskid >= info.subtasknum then
			ShowNpcMenuBottomStyle(uid,msg,"完成(1)",call,"取消(1)")
		else
			ShowNpcMenuBottomStyle(uid,msg,"继续(1)",call,"取消(1)")
		end
	end
end



--[[

--收集
RoleTaskInfo3001 =
{
	subtasknum = 1,
	subtask1 = 
	{
		collectitem = 
		{
			{48005, 0, 2},
		},

		task = {s_taskCollect, {60045, 60046}},

		onfinish = 
		{
			{s_actionDeleteItemByBaseID,{48005,2,"RoleTaskInfo3001"}},
		},
	},
}

]]
