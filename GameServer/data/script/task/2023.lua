--拜访虫穴洞守卫
RoleTaskInfo2023 =          --母任务ID
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{6014,6015,6016}},  --子任务ID
		},
	},
}

-- 战士
RoleTaskInfo6014 =          --子任务ID
{
	parent = 2023,          --母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {1}},
		},
	},
}
-- 法师
RoleTaskInfo6015 =			--子任务ID
{
	parent = 2023,			--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {3}},
		},
	},
}
-- 道士
RoleTaskInfo6016 =   		--子任务ID
{
	parent = 2023,			--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {5}},
		},
	},
}

