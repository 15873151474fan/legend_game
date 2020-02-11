--拜访药店老板
RoleTaskInfo2011 =				--母任务ID
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{6012,6013}},	--子任务ID
		},
	},
}

-- 男
RoleTaskInfo6012 =				--子任务ID
{
	parent = 2011,				--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
            
            {s_checkRoleSex,{1}},
		},
		--clicknpc = {250, 1, 0, 3000, 100, 100},
		--task = {s_taskClickNpc, {101, 147}},
	},
}
-- 女
RoleTaskInfo6013 =				--子任务ID
{
	parent = 2011,				--母任务ID
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
           
            {s_checkRoleSex,{2}},
		},
		--		clicknpc = {250, 1, 0, 3000, 100, 100},
		--task = {s_taskClickNpc, {101, 147}},
	},
}


