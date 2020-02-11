--问答，玩家问，系统答


--------------------------------------------------------------------------------------------------
--答题{int:NpcID}
function s_taskReQA(taskid, subtaskid, paramlist, uid)
	if paramlist == nil or paramlist[1] == nil then return end
	local npcID = paramlist[1]
	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	--检查问答系统
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.ReQAInfo == nil then return end

	--添加自动跳过选项回调
	if subinfo.ReQAInfo.pass_option ~= nil and subinfo.ReQAInfo.pass_option ~= 0 then
		subinfo.ReQAInfo.pass_call = "s_taskReQA_AddOperate($1,"..taskid..","..subtaskid..", 1)"
	end

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if npcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(npcID, name, "s_taskReQA_AcceptDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end

		--结束NPC事件
		if npcID > 0 then
			AppendMenuToNpc(npcID, name, "s_taskReQA_FinishDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
		end
	end

	--自动接受的子任务直接接取
	if uid ~= nil then
		s_taskReQA_Accept(uid, taskid, subtaskid)
	end
end

function s_taskReQA_Accept(uid, taskid, subtaskid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.ReQAInfo == nil then return end

	--统计任务计数
	local state = table.getn(subinfo.ReQAInfo.content)
	if state == 0 then return end

	if AddRoleSubTask(uid, taskid, subtaskid, state, 0, 0, 0, subinfo.task[2][1]) == VALUE_FAIL then return end
	StartReQAGame(uid, subinfo.ReQAInfo, "s_taskReQA_AddOperate($1,"..taskid..","..subtaskid..")")
end

function s_taskReQA_AddOperate(uid, taskid, subtaskid, all)
	if all == nil then
		AddRoleTaskOperate(uid,taskid)
	else
		local state = s_getTaskValue(uid,taskid,TaskValue_State)
		local operate = s_getTaskValue(uid,taskid,TaskValue_Operate )
		if operate < state then
			AddRoleTaskOperate(uid, taskid, "", state - operate)
		end
	end

	local process = s_getTaskValue(uid,taskid,TaskValue_Process)
	if process == TaskProcess_CanDone then
		s_taskReQA_FinishDealer(uid, taskid, subtaskid)
		return VALUE_FAIL
	end
	return VALUE_OK
end

function s_taskReQA_AcceptDealer(uid, taskid, subtaskid)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskReQA_Accept($1,".. taskid .. "," .. subtaskid ..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskReQA_FinishDealer(uid, taskid, subtaskid)
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		StartReQAGame(uid, subinfo.ReQAInfo, "s_taskReQA_AddOperate($1,"..taskid..","..subtaskid..")", 1)
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
RoleTaskInfo1 =
{
	subtasknum = 1,

	subtask1 = 
	{
		ReQAInfo =
		{   
			pass_option = 1,    --该问答有直接跳过去的选项

			talk = "我向你介绍一下军乐城吧?",
			content = {
				{ question = "军乐城的由来？", answer = "军乐城是由英雄王赛博利亚创造的伟大城市。落成于25年前，建成当日军乐声震天，王的士兵们高唱战歌，久久萦绕。自此命名为军乐城。",},
				{ question = "军乐城与光明城的关系？", answer = "军乐城是属于帝王的城市，是凡间的宝石。光明城是属于神的壁垒，是天界的落脚石。",},
				{ question = "为何军乐城紧邻着危险的沙漠？", answer = "伟大的英雄王赛博利亚，秉持着替民众守边关的信念，坚持将国都放置于危险的沙漠旁。",},
				{ question = "我可以在军乐城体验到什么内容？", answer = "60-100级的游戏内容，都将会在军乐城展开。",},
			}
		},

		task = {s_taskReQA, {60045}},
	},
}
]]
