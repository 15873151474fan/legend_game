RoleTaskInfo4061 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{4062, 4063}},
		},
		task = {s_taskRandomTask, {60051}},
		onaccept =
		{
		},
	},
}

-- 物理职业
RoleTaskInfo4062 =
{
	parent = 4061,
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
RoleTaskInfo4063 =
{
	parent = 4061,
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
