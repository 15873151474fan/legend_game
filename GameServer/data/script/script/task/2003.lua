--掏取鹿肉
RoleTaskInfo2003 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{6003,6004,6005}},
		},
	},
}

-- 战士
RoleTaskInfo6003 =
{
	parent = 2003,
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
RoleTaskInfo6004 =
{
	parent = 2003,
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
RoleTaskInfo6005 =
{
	parent = 2003,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            {s_checkRoleProfession, {5}},
		},
	},
}

