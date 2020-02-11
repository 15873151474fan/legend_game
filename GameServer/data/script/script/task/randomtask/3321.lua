RoleTaskInfo3321 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{3322, 3323}},
		},
		dropitem =
		{
			{10007, 80, 31040, 0, 8, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60034, 60034}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31040,8,"RoleTaskInfo3321"}},
			{s_actionOpenGuide,{3321}},
		},
	},
}

-- 物理职业
RoleTaskInfo3322 =
{
	parent = 3321,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		dropitem =
		{
			{10007, 80, 31040, 0, 8, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60034, 60034}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31040,8,"RoleTaskInfo3321"}},
		},
	},
}

-- 魔法职业
RoleTaskInfo3323 =
{
	parent = 3321,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		dropitem =
		{
			{10007, 80, 31040, 0, 8, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60034, 60034}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31040,8,"RoleTaskInfo3321"}},
		},
	},
}
