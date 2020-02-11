--自定义：只确定任务步骤，由游戏的其他的地方增加任务步骤

--------------------------------------------------------------------------------------------------
--自定义{int:BeginNpcID, int:EndNpcID, int:任务步骤总数(state), int:初始任务步骤(operate)}
function s_taskCustom(taskid, subtaskid, paramlist, uid)
	if paramlist == nil or paramlist[1] == nil or paramlist[2] == nil or paramlist[3] == nil or paramlist[4] == nil then return end
	local beginNpcID = paramlist[1]
	local endNpcID = paramlist[2]
	local state = paramlist[3]
	local operate = paramlist[4]

	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if beginNpcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(beginNpcID, name, "s_taskCustom_AcceptDealer($1,"..taskid..","..subtaskid..","..state..","..operate..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end

		--结束NPC事件
		if endNpcID > 0 then
			AppendMenuToNpc(endNpcID, name, "s_taskCustom_FinishDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
		end
	end

	--自动接受的子任务直接接取
	if uid ~= nil then
		s_taskCustom_Accept(uid, taskid, subtaskid, state, operate)
	end
end

function s_taskCustom_Accept(uid, taskid, subtaskid, state, operate)
	if state == 0 then return end
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	AddRoleSubTask(uid, taskid, subtaskid, state, operate, 0, 0, subinfo.task[2][2])
end


function s_taskCustom_AcceptDealer(uid, taskid, subtaskid, state, operate)
	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskCustom_Accept($1,".. taskid .. "," .. subtaskid ..","..state..","..operate..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskCustom_FinishDealer(uid, taskid, subtaskid)
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
RoleTaskInfo3001 =
{
	subtasknum = 1,
	subtask1 = 
	{
		task = {s_taskCustom, {60045, 60046, 10, 0}},
	},

}

]]
