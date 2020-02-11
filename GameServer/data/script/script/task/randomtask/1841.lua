RoleTaskInfo1841 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{1839, 1840}},
		},
		task = {s_taskRandomTask, {60088}},
	},
}

-- 物理职业
RoleTaskInfo1839 =
{
	parent = 1841,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
	},
}

-- 魔法职业
RoleTaskInfo1840 =
{
	parent = 1841,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
	},
}
