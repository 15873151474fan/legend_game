--除掉鸡
RoleTaskInfo2002 =				--母任务ID
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{6001,6002}},	--子任务ID
		},
	},
}

-- 男
RoleTaskInfo6001 =				--子任务ID
{
	parent = 2002,				--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            
            {s_checkRoleSex,{1}},
		},

	},
}
-- 女
RoleTaskInfo6002 =				--子任务ID
{
	parent = 2002,				--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
           
            {s_checkRoleSex,{2}},
		},

	},
}


