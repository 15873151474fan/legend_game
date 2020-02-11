RoleTaskInfo50030 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleSex,{2}},
		},
		collectitem =
		{
			{29033, 0, 1},
		},
		task = {s_taskCollect, {45131,45131}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{29033,1,"删除白玫瑰"}},
		},
	},
}

RoleTaskInfo50031 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleSex,{1}},
		},
		collectitem =
		{
			{29030, 0, 1},
		},
		task = {s_taskCollect, {45110,45110}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{29030,1,"删除四叶草"}},
		},
	},
}

RoleTaskInfo50032 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{55103, 0, 5},
		},
		task = {s_taskCollect, {60992,60992}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{55103,5,"删除樱花花瓣"}},
		},
	},
}

