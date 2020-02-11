RoleTaskInfo1521 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{1524, 1525}},
		},
		task = {s_taskRandomTask, {60150}},
		onaccept =
		{
		},
	},
}

-- 物理职业
RoleTaskInfo1524 =
{
	parent = 1521,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		dropitem =
		{
			{10061, 65, 31081, 0, 25, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60150, 60150}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31081,25,"RoleTaskInfo1521"}},
		},
	},
}

-- 魔法职业
RoleTaskInfo1525 =
{
	parent = 1521,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		dropitem =
		{
			{10061, 65, 31081, 0, 25, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60150, 60150}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31081,25,"RoleTaskInfo1521"}},
		},
	},
}
