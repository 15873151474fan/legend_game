RoleTaskInfo1321 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{1319, 1320}},
		},
		task = {s_taskRandomTask, {60036}},
	},
}

-- 物理职业
RoleTaskInfo1319 =
{
	parent = 1321,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		dropitem =
		{
			{10028, 65, 31053, 0, 20, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60036, 60036}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{31053,20,"RoleTaskInfo1319"}},
	},
}

-- 魔法职业
RoleTaskInfo1320 =
{
	parent = 1321,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		dropitem =
		{
			{10028, 65, 31053, 0, 20, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60036, 60036}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{31053,20,"RoleTaskInfo1320"}},
	},
}
