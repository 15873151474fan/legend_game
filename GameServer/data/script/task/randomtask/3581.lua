RoleTaskInfo3581 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{3582, 3583}},
		},
		task = {s_taskRandomTask, {60038}},
		onaccept =
		{
			{s_actionOpenGuide,{3581}},
		},
	},
}

-- 物理职业
RoleTaskInfo3582 =
{
	parent = 3581,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		onaccept =
		{
		--{s_actionChangeRide,{50003, 60*5}},
		},
		onfinish =
		{
		--{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 魔法职业
RoleTaskInfo3583 =
{
	parent = 3581,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		onaccept =
		{
		--{s_actionChangeRide,{50003, 60*5}},
		},
		onfinish =
		{
		--{s_actionChangeRide,{0, 0}},
		},
	},
}
