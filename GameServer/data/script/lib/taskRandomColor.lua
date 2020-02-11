--随机任务
--------------------------------------------------------------------------------------------------
--随机任务{int:NpcID}
--randomtask = {{int:选中几率分子, int:选中几率分母, {int:TaskID,}},...}
--random = {int:最大随机次数(0表示没有最大随机次数), int:消耗道具ID, int:商店ID, int:TabID, int:TreeID, string:按钮名称}
function s_taskRandomColor(taskid, subtaskid, paramlist, uid)
	if paramlist == nil or paramlist[1] == nil then return end
	local npcID = paramlist[1]

	--检查随机任务列表
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.randomtask == nil or type(subinfo.randomtask) ~= "table" or table.getn(subinfo.randomtask) == 0 then return end

	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	--不支持：自动接受的子任务直接接取
	if uid ~= nil then
		return
	end

	--开始NPC事件：自动接受的子任务不注册
	if npcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
		AppendMenuToNpc(npcID, name, "s_taskRandomColor_AcceptDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
	end
end

--bBest 1表示只在最高品质的第一组里面随机
function s_taskRandomColor_RandomTask(uid, taskid, subtaskid, bBest)
	--从随机任务列表中选一个子任务
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.randomtask == nil or type(subinfo.randomtask) ~= "table" or table.getn(subinfo.randomtask) == 0 then return end

	--选出符合玩家条件的子任务，先选中几率，再检查条件
	local randomtaskid = 0
	local groupnum = table.getn(subinfo.randomtask)
	if bBest ~= nil and bBest ~= 0 then groupnum = 1 end
	for i=1, groupnum, 1 do
		local rand = subinfo.randomtask[i][1]
		if i < groupnum then
			rand = math.random(1,subinfo.randomtask[i][2])
		end
		if rand <= subinfo.randomtask[i][1] then
			local listOriginTask = subinfo.randomtask[i][3]
			local listTask = {}
			for j=1, table.getn(listOriginTask), 1 do
				local randomTaskInfo = GetTaskInfo(listOriginTask[j])
				local randomTaskSubInfo = GetSubTaskInfo(listOriginTask[j], 1)
				if randomTaskInfo ~= nil and randomTaskInfo.parent ~= nil and randomTaskInfo.parent == taskid and randomTaskSubInfo ~= nil and RunCheckList(uid, taskid, subtaskid, randomTaskSubInfo.onacceptcheck) == VALUE_OK and RunCheckList(uid, taskid, subtaskid, randomTaskSubInfo.onacceptcheck1) == VALUE_OK then
					table.insert(listTask, listOriginTask[j])
				end
			end

			if table.getn(listTask) > 0 then
				local rand = math.random(1, table.getn(listTask))
				randomtaskid = listTask[rand]
				break
			end
		end
	end

	if randomtaskid == 0 then
		local curRound,curRing = GetTaskCurRoundAndRing(uid, taskid)
		s_debug("随机颜色任务没有找到子任务,uid:%d, taskid:%d, curRound:%d, curRing:%s", uid, taskid, curRound, curRing)
		return
	end

	--记录随机子任务
	s_addVar(uid,taskid,TvarIndex_RandomTaskID,randomtaskid)
end

function s_taskRandomColor_Refresh(uid, taskid, subtaskid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.randomtask == nil or subinfo.random == nil then return end

	--当前的随机子任务
	local randomtaskid = s_getVar(uid,taskid,TvarIndex_RandomTaskID)
	if randomtaskid == nil or randomtaskid == 0 then
		return
	end

	--检测是否为最高品质任务
	local bBest = false
	if table.getn(subinfo.randomtask) > 1 then
		for i=1, table.getn(subinfo.randomtask[1][3]), 1 do
			if randomtaskid == subinfo.randomtask[1][3][i] then
				bBest = true
				break
			end
		end
	end

	--已经是最高品质，不再随机
	if bBest then
		s_taskRandomColor_AcceptDealer(uid, taskid, subtaskid)
		s_sysInfo(uid,"任务已经是最高品质")
		return
	end

	--随机
	if s_deleteItemByBaseID(uid,subinfo.random[2],1,"刷新任务"..taskid.."_"..subtaskid) == VALUE_OK then
		local curRandomNum = s_getVar(uid,taskid,TvarIndex_CurRandom)
		if subinfo.random[1] > 0 and curRandomNum >= subinfo.random[1] then
			s_taskRandomColor_RandomTask(uid, taskid, subtaskid, 1)
			s_addVar(uid,taskid,TvarIndex_CurRandom,0)
		else
			s_taskRandomColor_RandomTask(uid, taskid, subtaskid, 0)
			s_addVar(uid,taskid,TvarIndex_CurRandom,curRandomNum+1)
		end
	else
		s_openNewStore(uid,subinfo.random[3], subinfo.random[4], subinfo.random[5])
		local name = s_getItemBaseValue(subinfo.random[2],5)
		local msg = string.format("没有%s，无法刷新",name)
		s_sysInfo(uid,msg)
	end
	s_taskRandomColor_AcceptDealer(uid, taskid, subtaskid)
end

function s_taskRandomColor_AcceptDealer(uid, taskid, subtaskid)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	--若还没有随机过，先随机一次
	local randomtaskid = s_getVar(uid,taskid,TvarIndex_RandomTaskID)
	if randomtaskid == nil or randomtaskid == 0 then
		s_taskRandomColor_RandomTask(uid, taskid, subtaskid)
		randomtaskid = s_getVar(uid,taskid,TvarIndex_RandomTaskID)
	end

	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	local buttonname = subinfo.random[6]
	if buttonname == nil then buttonname = "刷新颜色" end

	local msg = GetSubTaskAcceptText(uid, randomtaskid, 1)
	if msg == nil then return end
	local fresh = "s_taskRandomColor_Refresh($1,"..taskid..","..subtaskid..")"
	local call = "s_taskRandomColor_Accept($1,"..taskid..","..subtaskid..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(3)",call,buttonname .. "(3)",fresh)
end


function s_taskRandomColor_Accept(uid, taskid, subtaskid)
	--获取子任务
	local randomtaskid = s_getVar(uid,taskid,TvarIndex_RandomTaskID)
	if randomtaskid == nil or randomtaskid == 0 then
		return
	end

	--再检查一下任务的可接性，随机任务和接任务之间，玩家的状态可能有变，比如拉车状态
	local randomTaskSubInfo = GetSubTaskInfo(randomtaskid, 1)
	if randomTaskSubInfo == nil then return end
	if RunCheckList(uid, taskid, subtaskid, randomTaskSubInfo.onacceptcheck, 1) == VALUE_FAIL then return end
	if RunCheckList(uid, taskid, subtaskid, randomTaskSubInfo.onacceptcheck1, 1) == VALUE_FAIL then return end

	--接受自身任务：子任务完成时，才能完成自身任务
	if AddRoleSubTask(uid, taskid, subtaskid, 1, 0, 0, randomtaskid) == VALUE_FAIL then return end

	--接受子任务
	s_actionAddRoleTask( uid, taskid, subtaskid, {randomtaskid} )

	--记录父任务和子任务变量
	s_addTaskVar(uid,randomtaskid,MvarIndex_Parent,taskid)
	s_addTaskVar(uid,taskid,MvarIndex_Child,randomtaskid)
	s_addVar(uid,taskid,TvarIndex_CurRandom,0)
	s_addVar(uid,taskid,TvarIndex_RandomTaskID,0)
end



--[[
RoleTaskInfo1 =
{
	subtasknum = 1,

	subtask1 = 
	{
		--随机任务组，第一组是品质最好的
		randomtask = 
		{
			{10,100,{2}},
			{100,100,{3}},
		},

		random = {10, 26130, 50, 0, 0, "刷新颜色"},
		task = {s_taskRandomColor, {60045}},
	},
}


RoleTaskInfo2 =
{
	parent = 1,
	subtasknum = 1,

	subtask1 = 
	{
		task = {s_taskTalk, {60045,60045}},
	},
}


RoleTaskInfo3 =
{
	parent = 1,
	subtasknum = 1,

	subtask1 = 
	{
		task = {s_taskTalk, {60045,60045}},
	},
}

]]
