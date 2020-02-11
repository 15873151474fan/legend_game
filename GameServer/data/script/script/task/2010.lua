--拜访锻造师
RoleTaskInfo2010 =          --母任务ID
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{6009,6010,6011}},  --子任务ID
		},
	},
}

-- 战士
RoleTaskInfo6009 =          --子任务ID
{
	parent = 2010,          --母任务ID
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
RoleTaskInfo6010 =			--子任务ID
{
	parent = 2010,			--母任务ID
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
RoleTaskInfo6011 =   		--子任务ID
{
	parent = 2010,			--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {5}},
		},
	},
}

