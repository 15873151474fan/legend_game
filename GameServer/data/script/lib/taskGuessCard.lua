--猜牌，比大小

--------------------------------------------------------------------------------------------------
--猜牌{int:NpcID, int:猜牌胜率(1:30%,2:60%,3:100%)}
function s_taskGuessCard(taskid, subtaskid, paramlist, uid)
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
			AppendMenuToNpc(npcID, name, "s_taskGuessCard_AcceptDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end

		--结束NPC事件
		if npcID > 0 then
			AppendMenuToNpc(npcID, name, "s_taskGuessCard_FinishDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
		end
	end

	--自动接受的子任务直接接取
	if uid ~= nil then
		s_taskGuessCard_Accept(uid, taskid, subtaskid)
	end
end

function s_taskGuessCard_Accept(uid, taskid, subtaskid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if AddRoleSubTask(uid, taskid, subtaskid, 1, 0, 0, 0, subinfo.task[2][1]) == VALUE_FAIL then return end
	s_taskGuessCard_Start(uid, taskid, subtaskid)
end

function s_taskGuessCard_Start(uid, taskid, subtaskid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	local gc = GuessCard:Start(uid,subinfo.tip1,subinfo.tip2,subinfo.task[2][2])
	local callOver = Call:New(uid,nil,s_taskGuessCard_OverEvent,{taskid, subtaskid})
	gc:registerOverEvent(callOver)
	local callGiveup = Call:New(uid,nil,s_taskGuessCard_GiveupEvent,{taskid, subtaskid})
	gc:registerGiveupEvent(callGiveup)
end

function s_taskGuessCard_OverEvent(uid, param, param_ext)
	local taskid = param[1]
	local subtaskid = param[2]
	local ret = param_ext[1]

	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo ~= nil then
		if ret > 0 then
			RunActionList(uid, taskid, subtaskid, subinfo.onsuccess)
		else
			RunActionList(uid, taskid, subtaskid, subinfo.onfail)
		end
	end

	s_taskGuessCard_Finish(uid, taskid, subtaskid)
end

function s_taskGuessCard_GiveupEvent(uid, param, param_ext)
	local taskid = param[1]
	local subtaskid = param[2]

	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo ~= nil then
		RunActionList(uid, taskid, subtaskid, subinfo.ongiveup)
	end

	s_taskGuessCard_Finish(uid, taskid, subtaskid)
end


function s_taskGuessCard_Finish(uid, taskid, subtaskid)
	AddRoleTaskOperate(uid, taskid)
	FinishRoleSubTask(uid, taskid, subtaskid)
end

function s_taskGuessCard_AcceptDealer(uid, taskid, subtaskid)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskGuessCard_Accept($1,".. taskid .. "," .. subtaskid ..")"
	local info = GetTaskInfo(taskid)
	if subtaskid >= info.subtasknum then
		ShowNpcMenuBottomStyle(uid,msg,"完成(1)",call,"取消(1)")
	else
		ShowNpcMenuBottomStyle(uid,msg,"继续(1)",call,"取消(1)")
	end
end

function s_taskGuessCard_FinishDealer(uid, taskid, subtaskid)
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		s_taskGuessCard_Start(uid, taskid, subtaskid)
	elseif taskProcess == TaskProcess_CanDone then
		local msg = GetSubTaskFinishText(uid, taskid, subtaskid)
		if msg == nil then return end
		local call = "FinishRoleSubTask($1,".. taskid .. "," .. subtaskid..")"
		ShowNpcMenuBottomStyle(uid,msg,"完成(1)",call,"取消(1)")
	end
end





--[[
RoleTaskInfo3001 =
{
	subtasknum = 3,
	subtask1 = 
	{
		tip1 = "第一个Tips",
		tip2 = "第二个Tips",

		onsuccess = 
		{
			{s_actionAddExp, {5, ExpType_OptionalTask, 3001}}, --不要在中间子任务中获取经验或者实质性奖励，以免刷
		},
		
		onfail = 
		{
			{s_actionAddExp, {1, ExpType_OptionalTask, 3001}},  --不要在中间子任务中获取经验或者实质性奖励，以免刷
		},

		ongiveup = 
		{
			{s_actionSetSubtaskID, {2}},
		},

		task = {s_taskGuessCard, {60045,2}},
	},

	subtask2 = 
	{
		tip1 = "第一个Tips",
		tip2 = "第二个Tips",

		onsuccess = 
		{
			{s_actionAddExp, {6, ExpType_OptionalTask, 3001}}, --不要在中间子任务中获取经验或者实质性奖励，以免刷
		},
		
		onfail = 
		{
			{s_actionAddExp, {2, ExpType_OptionalTask, 3001}},  --不要在中间子任务中获取经验或者实质性奖励，以免刷
		},

		ongiveup = 
		{
			{s_actionSetSubtaskID, {2}},
		},

		task = {s_taskGuessCard, {60045}},
	},

	subtask3 = 
	{
		task = {s_taskTalk, {60045, 60046}},

		onfinish = 
		{
			{s_actionDeleteItemByBaseID,{49001,1,"RoleTaskInfo3001"}},
		},
	},

}


]]
