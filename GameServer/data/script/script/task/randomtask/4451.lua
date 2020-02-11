RoleTaskInfo4451 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{4452, 4453}},
		},
		task = {s_taskRandomTask, {60165}},
		onaccept =
		{
		},
	},
}

-- 物理职业
RoleTaskInfo4452 =
{
	parent = 4451,
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
RoleTaskInfo4453 =
{
	parent = 4451,
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
