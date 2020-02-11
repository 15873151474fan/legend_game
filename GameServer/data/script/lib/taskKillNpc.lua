--杀怪
function TaskNpcDead(uid, taskid, subtaskid)
	local subid = s_getTaskVar(uid, taskid, MvarIndex_SubTask)
	if subid ~= subtaskid then return end

	local taskProcess = s_getTaskValue(uid, taskid, TaskValue_Process)
	if taskProcess ~= TaskProcess_Doing then
		return
	end

	AddRoleTaskOperate(uid, taskid)
end


--------------------------------------------------------------------------------------------------
--收集{int:BeginNpcID, int:EndNpcID, int/table:KillNpcID, int:KillNpcNum}
function s_taskKillNpc(taskid, subtaskid, paramlist, uid)
	if paramlist == nil then
		s_debug("任务:taskid:%d,subtaskid:%d 参数为空",taskid, subtaskid)
		return
	end
	local beginNpcID = 0
	if paramlist[1] ~= nil then	beginNpcID = paramlist[1] end
	local endNpcID = 0
	if paramlist[2] ~= nil then endNpcID = paramlist[2] end

	local killNpcID = paramlist[3]
	local killNpcNum = paramlist[4]

	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if beginNpcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(beginNpcID, name, "s_taskKillNpc_AcceptDealer($1,"..taskid..","..subtaskid..","..killNpcNum..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end

		--结束NPC事件
		if endNpcID > 0 then
			AppendMenuToNpc(endNpcID, name, "s_taskKillNpc_FinishDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
		end

		--注册Npc死亡事件
		if type(killNpcID) == "table" then
			for nNpc=1, table.getn(killNpcID), 1 do
				if killNpcID[nNpc] > 51000 and killNpcID[nNpc] < 51011 then
					RegisterMyNpcDeadEvent(killNpcID[nNpc], "TaskNpcDead($1,"..taskid..","..subtaskid..")" )
				else
					RegisterNpcDeadEvent(killNpcID[nNpc], "TaskNpcDead($1,"..taskid..","..subtaskid..")" )
				end
				RegisterNpcDeadEvent(killNpcID[nNpc], "TaskNpcDead($1,"..taskid..","..subtaskid..")" )
			end
		else
			if killNpcID > 51000 and killNpcID < 51011 then
				 RegisterMyNpcDeadEvent(killNpcID, "TaskNpcDead($1,"..taskid..","..subtaskid..")" )
			else
				 RegisterNpcDeadEvent(killNpcID, "TaskNpcDead($1,"..taskid..","..subtaskid..")" )
			end

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
		s_taskKillNpc_Accept(uid, taskid, subtaskid, killNpcNum)
	end
end

function s_taskKillNpc_Accept(uid, taskid, subtaskid, killNpcNum)
	if killNpcNum == 0 then return end
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	AddRoleSubTask(uid, taskid, subtaskid, killNpcNum, 0, 0, 0, subinfo.task[2][2])
end


function s_taskKillNpc_AcceptDealer(uid, taskid, subtaskid, killNpcNum)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskKillNpc_Accept($1,".. taskid .. "," .. subtaskid ..","..killNpcNum..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskKillNpc_FinishDealer(uid, taskid, subtaskid)
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

--杀一种怪
RoleTaskInfo3001 =
{
	subtasknum = 1,
	subtask1 = 
	{
		task = {s_taskKillNpc, {60045, 60046, 10104, 10}},
	},

}

--杀多种怪
RoleTaskInfo3001 =
{
	subtasknum = 1,
	subtask1 = 
	{
		task = {s_taskKillNpc, {60045, 60046, {10104,10103}, 10}},
	},

}

]]
