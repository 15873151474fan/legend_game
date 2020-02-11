RoleTaskInfo1471 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{1473, 1474}},
		},
		task = {s_taskRandomTask, {60000}},
		onaccept =
		{
		},
	},
}

-- 物理职业
RoleTaskInfo1473 =
{
	parent = 1471,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		onaccept =
		{
		},
		onfinish =
		{
		},
	},
}

-- 魔法职业
RoleTaskInfo1474 =
{
	parent = 1471,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		onaccept =
		{
		},
		onfinish =
		{
		},
	},
}
