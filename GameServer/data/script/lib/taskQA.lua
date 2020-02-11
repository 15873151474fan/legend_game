--答题相关处理
function CheckQADetail(qa)
	return VALUE_OK
end

function ShowQADetail(uid)
	local global = rawget(_G,"GlobalQATable")
	if global == nil then
		s_debug("答题处理有问题")
		return
	end
	global = global[uid]
	if global == nil then
		return
	end
	local index = global.index
	local qalist = global.qalist
	if qalist == nil then
		s_debug("答题处理有问题")
		return
	end
	if qalist[index] == nil then
		--没有下一个题目了
		if global.finish ~= nil then
			local fun = StringToFunction(global.finish)
			if fun ~= nil then
				fun(uid)
			end
		end
	end
	--设置回调，显示答题内容
	local qa = qalist[index]
	if qa == nil then return end
	if CheckQADetail(qa) ~= VALUE_OK then
		return
	end
	local showtb = {}
	showtb.talk = qa.question
	showtb.button = {}
	for i = 1, table.getn(qa.answer) do
		local re = 0
		if FindInTable(qa.result,i) == VALUE_OK then
			re = 1
		end
		local call = "QACallBack($1," .. re ..")"
		local colum = {qa.answer[i] .."(3)",call}
		table.insert(showtb.button,colum)
	end
	ShowNpcMenuByTable(uid,showtb)
	global.index = index
end

function QACallBack(uid,result)
	local global = rawget(_G,"GlobalQATable")
	if global == nil then
		s_debug("答题处理有问题")
		return
	end
	global = global[uid]
	if global == nil then
		return
	end
	local index = global.index
	if index == nil then
		s_debug("答题处理有问题")
		return
	end
	if result == VALUE_OK then
		global.index = global.index + 1
		ShowQADetail(uid)
	else
		ShowNpcMenu(uid,"回答错误，重新回答","确定(3","ShowQADetail($1)")
	end
end

function InitQAGame(uid,qalist,finish_call)
	if uid == nil or qalist == nil then
		return VALUE_FAIL
	end
	if type(uid) ~= "number" or type(qalist) ~= "table" then
		s_debug("InitQAGame 参数不对")
		return VALUE_FAIL
	end
	local global = rawget(_G,"GlobalQATable")
	if global == nil then
		global = {}
		rawset(_G,"GlobalQATable",global)
	end
	if global[uid] == nil then
		global[uid] = {}
	end
	qainfo = global[uid]
	qainfo.index = 1
	qainfo.qalist = qalist
	qainfo.finish = finish_call
	return VALUE_OK
end

--仅调用这个接口就行
function StartQAGame(uid,qalist,finish_call)
	if InitQAGame(uid,qalist,finish_call) ~= VALUE_OK then
		return
	end
	ShowQADetail(uid)
end


--------------------------------------------------------------------------------------------------
--答题{int:NpcID}
function s_taskQA(taskid, subtaskid, paramlist, uid)
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
			AppendMenuToNpc(npcID, name, "s_taskQA_AcceptDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end

		--结束NPC事件
		if npcID > 0 then
			AppendMenuToNpc(npcID, name, "s_taskQA_FinishDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
		end
	end

	--自动接受的子任务直接接取
	if uid ~= nil then
		s_taskQA_Accept(uid, taskid, subtaskid)
	end
end

function s_taskQA_Accept(uid, taskid, subtaskid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if AddRoleSubTask(uid, taskid, subtaskid, 1, 0, 0, 0, subinfo.task[2][1]) == VALUE_FAIL then return end
	StartQAGame(uid, subinfo.QAInfo, "s_taskQA_Finish("..uid..","..taskid..","..subtaskid..")")
end

function s_taskQA_Finish(uid, taskid, subtaskid)
	AddRoleTaskOperate(uid, taskid)
	s_taskQA_FinishDealer(uid, taskid, subtaskid)
end

function s_taskQA_AcceptDealer(uid, taskid, subtaskid)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskQA_Accept($1,".. taskid .. "," .. subtaskid ..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskQA_FinishDealer(uid, taskid, subtaskid)
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		StartQAGame(uid, subinfo.QAInfo, "s_taskQA_Finish("..uid..","..taskid..","..subtaskid..")")
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
		QAInfo =
		{
			{question = "1.像我这样可爱的宠物被称为战宠的原因是？", answer = {"A.喜欢站着","B.不喜欢站着","C.合体后会极大幅度提高主人战斗力"}, result = {3}},
			{question = "2.人物等级达到多少级才可以拥有战宠？", answer = {"A.200级", "B.300级", "C.31级"}, result = {3}},
			{question = "3.世界上最可爱的宠物是？", answer = {"A.企鹅", "B.360", "C.小宛"}, result = {3}},
		},

		task = {s_taskQA, {60045}},
	},
}

]]
