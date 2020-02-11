RoleTaskInfo3621 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{3622, 3623}},
		},
		task = {s_taskRandomTask, {60038}},
		onaccept =
		{
			{s_actionChangeRide,{50012, 60*5}},
		},
	},
}

-- 物理职业
RoleTaskInfo3622 =
{
	parent = 3621,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		dropitem =
		{
			{10014, 65, 31070, 0, 10, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60038, 60028}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31070,10,"RoleTaskInfo3391"}},
			{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 魔法职业
RoleTaskInfo3623 =
{
	parent = 3621,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		dropitem =
		{
			{10014, 65, 31070, 0, 10, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60038, 60028}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31070,10,"RoleTaskInfo3391"}},
			{s_actionChangeRide,{0, 0}},
		},
	},
}
