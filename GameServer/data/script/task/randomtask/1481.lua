RoleTaskInfo1481 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{2481, 2482}},
		},
		task = {s_taskRandomTask, {60073}},
		onaccept =
		{
		},
	},
}

-- 物理职业
RoleTaskInfo2481 =
{
	parent = 1481,
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
RoleTaskInfo2482 =
{
	parent = 1481,
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
