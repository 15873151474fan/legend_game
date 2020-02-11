function RoleTaskInfo15240_onaccept(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 21 then
		AddRoleTaskOperate(uid,15240)
	end
end

RoleTaskInfo15240 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
			{RoleTaskInfo15240_onaccept,{}},
		},
		task = {s_taskLevelUp, {0,119,41}},
		onfinish =
		{
			{s_actionAddRoleTask,{15241}},
		},
	},
}

RoleTaskInfo15241 =
{
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom, {119,119,1 , 0}},
		onfinish =
		{
			{s_actionAddRoleTask,{15242}},
		},
	},
}

function RoleTaskInfo15242_onaccept(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 41 then
		AddRoleTaskOperate(uid,15242)
	end
end

function RoleTaskInfo15242_onfinish(uid, taskid, subtaskid, paramlist)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	s_worldInfo("恭喜".. name ..",已经完成了YY兵王2先锋任务，获得了大量游戏道具奖励！",ChatPos_Sys+ChatPos_Honor)
	s_finishYYTask(uid,15240)
end

RoleTaskInfo15242 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
			{RoleTaskInfo15242_onaccept,{}},
		},
		task = {s_taskLevelUp, {119,119,41}},
		onfinish =
		{
			{RoleTaskInfo15242_onfinish,{}},
		},
	},
}



--[[function RoleTaskInfo15243_onaccept(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 51 then
		AddRoleTaskOperate(uid,15243)
	end
end

function RoleTaskInfo15243_onfinish(uid, taskid, subtaskid, paramlist)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	s_worldInfo("恭喜".. name ..",已经完成了YY兵王2先锋任务，获得了大量游戏道具奖励！",ChatPos_Sys+ChatPos_Honor)
	s_finishYYTask(uid,15240)
end

RoleTaskInfo15243 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
			{RoleTaskInfo15243_onaccept,{}},	
		},	
		task = {s_taskCustom, {119,119,1 , 0}},
		onfinish = 
		{
			{RoleTaskInfo15243_onfinish,{}},	
		},	
	},
}]]--
