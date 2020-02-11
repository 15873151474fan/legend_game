RoleTaskInfo1731 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{1729, 1730}},
		},
		task = {s_taskRandomTask, {60098}},
	},
}

-- 物理职业
RoleTaskInfo1729 =
{
	parent = 1731,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		task={s_taskKillNpc, {60098,60098,10080,45}},
	},
}

-- 魔法职业
RoleTaskInfo1730 =
{
	parent = 1731,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		task={s_taskKillNpc, {60098,60098,10080,45}},
	},
}
