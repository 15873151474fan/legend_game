--和NPC谈话，没有接收任务对话的步骤

--------------------------------------------------------------------------------------------------
--和NPC谈话{int:npcID}
function s_taskTalkNoTalk(taskid, subtaskid, paramlist, uid)
	if paramlist == nil or paramlist[1] == nil then return end
	local npcID = paramlist[1]
	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if npcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(npcID, name, "s_taskTalkNoTalk_AcceptDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end
	end

	--自动接受的子任务直接接取
	if uid ~= nil then
		s_taskTalkNoTalk_Accept(uid, taskid, subtaskid)
	end
end

function s_taskTalkNoTalk_AcceptDealer(uid, taskid, subtaskid)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskFinishText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskTalkNoTalk_Accept($1,".. taskid .. "," .. subtaskid .. ")"
	ShowNpcMenuBottomStyle(uid,msg,"确定(3)",call,"取消(3)")
end

function s_taskTalkNoTalk_Accept(uid, taskid, subtaskid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	AddRoleSubTask(uid, taskid, subtaskid, 1, 1, 0, 0, subinfo.task[2][2])
	FinishRoleSubTask(uid, taskid, subtaskid)
end



--[[

RoleTaskInfo3001 = 
{
	subtasknum = 1,
	subtask1 = 
	{
		task = {s_taskTalkNoTalk, {60013}},
	},

	onfinish = 
	{
		{s_actionAddAndFinishTask,{3011}},
	},
}

]]
