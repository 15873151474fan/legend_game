RoleTaskInfo4031 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{4032, 4033}},
		},
		task = {s_taskRandomTask, {60166}},
	},
}

-- 物理职业
RoleTaskInfo4032 =
{
	parent = 4031,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		dropitem =
		{
			{10031, 65, 31054, 0, 18, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60166, 60166}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{31054,18,"RoleTaskInfo4031"}},
	},
}

-- 魔法职业
RoleTaskInfo4033 =
{
	parent = 4031,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		dropitem =
		{
			{10031, 65, 31054, 0, 18, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60166, 60166}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{31054,18,"RoleTaskInfo4031"}},
	},
}
