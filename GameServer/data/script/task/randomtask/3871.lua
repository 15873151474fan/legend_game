RoleTaskInfo3871 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{3872, 3873}},
		},
		task = {s_taskRandomTask, {60036}},
	},
}

-- 物理职业
RoleTaskInfo3872 =
{
	parent = 3871,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		dropitem =
		{
			{10027, 60, 31052, 0, 14, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60036, 60036}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{31052,14,"RoleTaskInfo3872"}},
	},
}

-- 魔法职业
RoleTaskInfo3873 =
{
	parent = 3871,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		dropitem =
		{
			{10027, 60, 31052, 0, 14, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60036, 60036}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{31052,14,"RoleTaskInfo3873"}},
	},
}
