RoleTaskInfo1591 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{1589, 1590}},
		},
		task = {s_taskRandomTask, {60152}},
	},
}

-- 物理职业
RoleTaskInfo1589 =
{
	parent = 1591,
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
RoleTaskInfo1590 =
{
	parent = 1591,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
	},
}
