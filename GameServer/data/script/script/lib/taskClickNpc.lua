--访问Npc，可以读条

--------------------------------------------------------------------------------------------------
--收集{int:BeginNpcID, int:EndNpcID}
--clicknpc = {int:访问NpcID, int:访问次数, int:采集成功后是否被杀死(1/0), int:读条时间(ms), int:采集成功几率分子, int:采集成功几率分母},
function s_taskClickNpc(taskid, subtaskid, paramlist, uid)
	if paramlist == nil then
		s_debug("任务:taskid:%d,subtaskid:%d 参数为空",taskid, subtaskid)
		return
	end
	local beginNpcID = 0
	if paramlist[1] ~= nil then	beginNpcID = paramlist[1] end
	local endNpcID = 0
	if paramlist[2] ~= nil then endNpcID = paramlist[2] end

	--检查访问npc列表
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then return end
	if subinfo.clicknpc == nil or subinfo.clicknpc[1] == 0 then return end

	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if beginNpcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(beginNpcID, name, "s_taskClickNpc_AcceptDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end

		--结束NPC事件
		if endNpcID > 0 then
			AppendMenuToNpc(endNpcID, name, "s_taskClickNpc_FinishDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
		end

		--注册道具使用事件
		RegisterClickNpcEvent(subinfo.clicknpc[1], "s_taskClickNpc_ClickNpcEvent($1,"..taskid..","..subtaskid..",$2)")

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
		s_taskClickNpc_Accept(uid, taskid, subtaskid)
	end
end


function s_taskClickNpc_ClickNpcEvent(uid, taskid, subtaskid, thisid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.clicknpc == nil then return end

	local taskProcess = s_getTaskValue(uid, taskid, TaskValue_Process)
	if taskProcess ~= TaskProcess_Doing then return end

	local subid = s_getTaskVar(uid, taskid, MvarIndex_SubTask )
	if subid == nil or subid ~= subtaskid then return end

	--检测是否可以使用道具
	if subinfo.oncheck ~= nil then
		if RunCheckList(uid, taskid, subtaskid, subinfo.oncheck) == VALUE_FAIL then return end
	end

	--检查血量
	if subinfo.clicknpc[3] >= 1 then
		local hp = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_HP)
		if hp == 0 then
			s_sysInfo(uid,"已经被人采了")
			return
		end
	end

	if subinfo.clicknpc[4] > 0 then
		--读条前操作
		if subinfo.onstartbar ~= nil then
			RunActionList(uid, taskid, subtaskid, subinfo.onstartbar)
		end

		--读条
		s_showbar(uid, subinfo.clicknpc[4], "s_taskClickNpc_ClickNpc($1,"..taskid..","..subtaskid..","..thisid..")", UninterruptActionType_TASK, 1)
	else
		--不需要读条，直接使用道具
		s_taskClickNpc_ClickNpc(uid, taskid, subtaskid, thisid)
	end
end

function s_taskClickNpc_ClickNpc(uid, taskid, subtaskid, thisid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.clicknpc == nil then return end

	--读条完成的操作
	RunActionList(uid, taskid, subtaskid, subinfo.onendbar)

	--检查血量
	if subinfo.clicknpc[3] >= 1 then
		local hp = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_HP)
		if hp == 0 then
			s_sysInfo(uid,"已经被人采了")
			return
		end
	end

	--检查成功几率
	local bSuccess = true
	if subinfo.clicknpc[5] ~= subinfo.clicknpc[6] then
		local rand = math.random(1, subinfo.clicknpc[6])
		if rand > subinfo.clicknpc[5] then
			bSuccess = false
		end
	end

	--失败，退出
	if bSuccess ~= true then
		RunActionList(uid, taskid, subtaskid, subinfo.onfail)
		return
	end

	--检查血量的npc，需要杀掉它
	if subinfo.clicknpc[3] >= 1 then
		s_killnpc(thisid, 1)
	end

	--成功
	RunActionList(uid, taskid, subtaskid, subinfo.onsuccess)

	--若没有收集道具，则给任务计数，否则由收集道具计数
	if subinfo.collectitem == nil then
		AddRoleTaskOperate( uid, taskid )
	end

	--若是采集不消失NPC，则继续采集
	--if subinfo.clicknpc[3] == 0 then
		--s_taskClickNpc_ClickNpcEvent(uid, taskid, subtaskid, thisid)
	--end
end

function s_taskClickNpc_Accept(uid, taskid, subtaskid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.clicknpc == nil or subinfo.clicknpc[1] == 0 then return end

	--统计任务步骤
	local state = 0
	if subinfo.collectitem then
		for i=1, table.getn(subinfo.collectitem), 1 do
			state = state + subinfo.collectitem[i][3]
		end
	else
		state = subinfo.clicknpc[2]
	end

	if state == 0 then return end
	if AddRoleSubTask(uid, taskid, subtaskid, state, 0, 0, 0, subinfo.task[2][2]) == VALUE_FAIL then return end

	--添加收集物件到RoleTask中
	s_addTaskMaterial(uid, taskid, subinfo.collectitem)
end


function s_taskClickNpc_AcceptDealer(uid, taskid, subtaskid)
	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskClickNpc_Accept($1,".. taskid .. "," .. subtaskid ..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskClickNpc_FinishDealer(uid, taskid, subtaskid)
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

RoleTaskInfo1 =
{
	subtasknum = 1,

	subtask1 = 
	{
		color = TaskColor_Blue,

		--读条前的检查
		oncheck = 
		{
			{s_checkRoleTrafficType, {0, "必须在步行下使用"}},
		},
		--开始读条的操作
		onstartbar = 
		{
			{s_actionSysInfo, {"开始读条", 34}},
		},
		--读条结束的操作
		onendbar = 
		{
			{s_actionSysInfo, {"结束读条", 34}},
		},
		--读条成功的操作
		onsuccess = 
		{
			{s_actionSysInfo, {"读条成功", 34}},
			{s_actionAddItem,{49001, 0, 1, 0, "1-1", "RoleTaskInfo1_1"}},
		},
		--读条失败的操作
		onfail = 
		{
			{s_actionSysInfo, {"读条失败", 34}},
		},

		--收集道具
		collectitem = 
		{
			{49001, 0, 10},
		},

		--访问Npc信息
		clicknpc = {clicknpcid, clicknum, killed, bartime, rand_fenzi, rand_fenmu},

		task = {s_taskClickNpc, {60045, 60045}},
	},
}




RoleTaskInfo1 =
{
	subtasknum = 1,

	subtask1 = 
	{
		color = TaskColor_Blue,

		--读条前的检查
		oncheck = 
		{
			{s_checkRoleTrafficType, {0, "必须在步行下使用"}},
		},
		--开始读条的操作
		onstartbar = 
		{
			{s_actionSysInfo, {"开始读条", 34}},
		},
		--读条结束的操作
		onendbar = 
		{
			{s_actionSysInfo, {"结束读条", 34}},
		},
		--读条成功的操作
		onsuccess = 
		{
			{s_actionSysInfo, {"读条成功", 34}},
			{s_actionAddItem,{49001, 0, 1, 0, "1-1", "RoleTaskInfo1_1"}},
		},
		--读条失败的操作
		onfail = 
		{
			{s_actionSysInfo, {"读条失败", 34}},
		},

		--收集道具
		collectitem = 
		{
			{49001, 0, 10},
		},

		--访问Npc信息
		clicknpc = {60172, 0, 0, 1000, 100, 100},

		task = {s_taskClickNpc, {60045, 60045}},
	},
}


]]
