--除掉巨型甲虫
RoleTaskInfo2027 =				--母任务ID
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{6017,6018,6019,6020,6021,6022}},		--子任务ID
		},
	},
}

-- 战士男
RoleTaskInfo6017 =				--子任务ID
{
	parent = 2027,				--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {1}},
			{s_checkRoleSex,{1}},
		},
	},
}
-- 战士女
RoleTaskInfo6018 =				--子任务ID
{
	parent = 2027,				--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {1}},
			{s_checkRoleSex,{2}},
		},
	},
}
-- 法师男
RoleTaskInfo6019 =				--子任务ID
{
	parent = 2027,				--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {3}},
			{s_checkRoleSex,{1}},
		},
	},
}
-- 法师女
RoleTaskInfo6020 =				--子任务ID
{
	parent = 2027,				--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {3}},
			{s_checkRoleSex,{2}},
		},
	},
}
-- 道士男
RoleTaskInfo6021 =				--子任务ID
{
	parent = 2027,				--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {5}},
			{s_checkRoleSex,{1}},
		},
	},
}
-- 道士女
RoleTaskInfo6022 =				--子任务ID
{
	parent = 2027,				--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {5}},
			{s_checkRoleSex,{2}},
		},
	},
}

