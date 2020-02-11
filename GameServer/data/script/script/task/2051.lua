--除掉恐怖蜥蜴
RoleTaskInfo2051 =          --母任务ID
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{6029,6030,6031}},  --子任务ID
		},
	},
}

-- 战士
RoleTaskInfo6029 =          --子任务ID
{
	parent = 2051,          --母任务ID
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
RoleTaskInfo6030 =			--子任务ID
{
	parent = 2051,			--母任务ID
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
RoleTaskInfo6031 =   		--子任务ID
{
	parent = 2051,			--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {5}},
		},
	},
}

