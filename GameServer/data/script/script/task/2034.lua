--除掉蛇妖
RoleTaskInfo2034 =          --母任务ID
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{6023,6024,6025}},  --子任务ID
		},
	},
}

-- 战士
RoleTaskInfo6023 =          --子任务ID
{
	parent = 2034,          --母任务ID
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
RoleTaskInfo6024 =			--子任务ID
{
	parent = 2034,			--母任务ID
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
RoleTaskInfo6025 =   		--子任务ID
{
	parent = 2034,			--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {5}},
		},
	},
}

