RoleTaskInfo4445 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{4446, 4447}},
		},
		task = {s_taskRandomTask, {60165}},
		onaccept =
		{
		},
	},
}

-- 物理职业
RoleTaskInfo4446 =
{
	parent = 4445,
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
RoleTaskInfo4447 =
{
	parent = 4445,
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
