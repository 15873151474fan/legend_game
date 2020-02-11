RoleTaskInfo3911 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{3912, 3913}},
		},
		task = {s_taskRandomTask, {60051}},
		onaccept =
		{
		},
	},
}

-- 物理职业
RoleTaskInfo3912 =
{
	parent = 3911,
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
RoleTaskInfo3913 =
{
	parent = 3911,
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
