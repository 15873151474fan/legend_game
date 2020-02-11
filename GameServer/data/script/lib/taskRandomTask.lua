--随机任务
--------------------------------------------------------------------------------------------------
--随机任务{int:NpcID}
--RandomTask = {{int:选中几率分子, int:选中几率分母, {int:TaskID,}},...}
function s_taskRandomTask(taskid, subtaskid, paramlist, uid)
	if paramlist == nil or paramlist[1] == nil then return end
	local npcID = paramlist[1]

	--检查随机任务列表
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.randomtask == nil or type(subinfo.randomtask) ~= "table" or table.getn(subinfo.randomtask) == 0 then return end

	local name = GetTaskName(taskid)
	if name == nil then
		s_debug("随机任务: " .. taskid .. " 找不到表格记录，请查看！")
		return
	end
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if npcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(npcID, name, "s_taskRandomTask_AcceptDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end
	end

	--自动接受的子任务直接接取
	if uid ~= nil then
		s_taskRandomTask_Accept(uid, taskid, subtaskid)
	end
end


function s_taskRandomTask_Random(uid, taskid, subtaskid)
	local randomtaskid = 0

	--从随机任务列表中选一个子任务
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.randomtask == nil or type(subinfo.randomtask) ~= "table" or table.getn(subinfo.randomtask) == 0 then return randomtaskid end

	local lastRandomID = s_getVar(uid, taskid, TvarIndex_RandomTaskID)

	--选出符合玩家条件的子任务，先选中几率，再检查条件
	for i=1, table.getn(subinfo.randomtask), 1 do
		local rand = subinfo.randomtask[i][1]
		if i < table.getn(subinfo.randomtask) then
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
				local nTotal = 5
				if table.getn(listTask) == 1 then nTotal = 1 end
				for nTime=1, nTotal, 1 do
					local rand = math.random(1, table.getn(listTask))
					randomtaskid = listTask[rand]
					if randomtaskid ~= lastRandomID then
						break
					end
				end
				break
			end
		end
	end

	return randomtaskid
end


function s_taskRandomTask_Accept(uid, taskid, subtaskid)
	--从随机任务列表中选一个子任务
	local randomtaskid = s_taskRandomTask_Random(uid, taskid, subtaskid)
	if randomtaskid == 0 then
		local curRound,curRing = GetTaskCurRoundAndRing(uid, taskid)
		s_debug("随机任务没有找到子任务,uid:%d, taskid:%d, curRound:%d, curRing:%s", uid, taskid, curRound, curRing)
		return
	end

	--记录随机任务
	s_addVar(uid, taskid, TvarIndex_RandomTaskID, randomtaskid)

	--接受自身任务：子任务完成时，才能完成自身任务
	if AddRoleSubTask(uid, taskid, subtaskid, 1, 0, 0, randomtaskid) == VALUE_FAIL then return end

	--接受子任务
	s_actionAddRoleTask( uid, taskid, subtaskid, {randomtaskid} )

	--记录父任务和子任务变量
	s_addTaskVar(uid,randomtaskid,MvarIndex_Parent,taskid)
	s_addTaskVar(uid,taskid,MvarIndex_Child,randomtaskid)
end

function s_taskRandomTask_AcceptDealer(uid, taskid, subtaskid)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskRandomTask_Accept($1,".. taskid .. "," .. subtaskid ..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end


--[[
RoleTaskInfo3001 =
{
	--轮数
	round = 2,
	--环数：每轮次数
	ring = 3,

	subtasknum = 2,
	subtask1 =
	{
		randomtask =
		{
			{90,100,{3011, 3021}},
			--{10,100,{3011,3012}},
		},

		task = {s_taskRandomTask, {60045}},

		onfinish =
		{
			{s_actionDeleteItemByBaseID,{49001,1,"RoleTaskInfo3001"}},
			{s_actionDeleteItemByBaseID,{48005,2,"RoleTaskInfo3001"}},
		},
	},

	subtask2 =
	{
		task = {s_taskTalk, {60045,60045}},
	},
}



RoleTaskInfo3011 =
{
	--父任务
	parent = 3001,

	--任务颜色
	color = TaskColor_Blue,

	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleLevel, {1, 5}},
			--{s_checkBaseTaskDayNum, {1, 3}},
		},

		task = {s_taskTalk, {60045, 60046}},
	},
}


RoleTaskInfo3021 =
{
	parent = 3001,
	subtasknum = 1,

	subtask1 =
	{
		QAInfo =
		{
			{question = "1.像我这样可爱的宠物被称为战宠的原因是？", answer = {"A.喜欢站着","B.不喜欢站着","C.合体后会极大幅度提高主人战斗力"}, result = {3}},
			{question = "2.人物等级达到多少级才可以拥有战宠？", answer = {"A.200级", "B.300级", "C.31级"}, result = {3}},
			{question = "3.世界上最可爱的宠物是？", answer = {"A.企鹅", "B.360", "C.小宛"}, result = {3}},
		},

		task = {s_taskQA, {60046}},
	},
}


]]


--多层级随机任务嵌套
--[[

RoleTaskInfo3001 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{20001}},
		},

		task = {s_taskRandomTask, {60013}},
	},

}



RoleTaskInfo20001 =
{
	parent = 3001,

	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{20002}},
		},

		task = {s_taskRandomTask, {60013}},
	},
}


RoleTaskInfo20002 =
{
	parent = 20001,

	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskTalk, {60013, 60045}},
	},

}


]]
