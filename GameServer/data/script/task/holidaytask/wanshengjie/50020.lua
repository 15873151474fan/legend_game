RoleTaskInfo50020 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{50022,50023,50024,50026}},
		},
		--[[onaccept =
		{
		{s_taskplay,{9}},
		},
		]]--
		task = {s_taskRandomTask, {337}},
		onfinish =
		{
			{s_actionAddBuff,{5045, 0, 10}},
		},
	},
}

--风之国
RoleTaskInfo50021 =
{
	parent = 50020,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{55020, 0, 1},
		},

		task = {s_taskCollect, {337, 337}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{55020,1,"删除生姜饼",0}},
	},
}

--火之国
RoleTaskInfo50022 =
{
	parent = 50020,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{55021, 0, 1},
		},

		task = {s_taskCollect, {337, 337}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{55021,1,"删除烘南瓜子",0}},
	},
}

--天之国
RoleTaskInfo50023 =
{
	parent = 50020,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{55022, 0, 1},
		},

		task = {s_taskCollect, {337, 337}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{55022,1,"删除南瓜馅饼",0}},
	},
}

--沙之国
RoleTaskInfo50024 =
{
	parent = 50020,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{55023, 0, 1},
		},

		task = {s_taskCollect, {337, 337}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{55023,1,"删除粟米糖",0}},
	},
}


--花之国
RoleTaskInfo50025 =
{
	parent = 50020,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{55024, 0, 1},
		},

		task = {s_taskCollect, {337, 337}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{55024,1,"删除太妃糖",0}},
	},
}

--水之国
RoleTaskInfo50026 =
{
	parent = 50020,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{55025, 0, 1},
		},

		task = {s_taskCollect, {337, 337}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{55025,1,"删除苹果汁",0}},
	},
}

function RoleTaskInfo50020:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 43 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
