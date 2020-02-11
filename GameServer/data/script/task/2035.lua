--除掉蛇妖
RoleTaskInfo2035 =          --母任务ID
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{6026,6027,6028}},  --子任务ID
		},
	},
}

-- 战士
RoleTaskInfo6026 =          --子任务ID
{
	parent = 2035,          --母任务ID
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
RoleTaskInfo6027 =			--子任务ID
{
	parent = 2035,			--母任务ID
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
RoleTaskInfo6028 =   		--子任务ID
{
	parent = 2035,			--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {5}},
		},
	},
}

