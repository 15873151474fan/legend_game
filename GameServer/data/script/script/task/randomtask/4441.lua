RoleTaskInfo4441 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{4439, 4440}},
		},
		task = {s_taskRandomTask, {60165}},
	},
}

-- 物理职业
RoleTaskInfo4439 =
{
	parent = 4441,
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
RoleTaskInfo4440 =
{
	parent = 4441,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
	},
}
