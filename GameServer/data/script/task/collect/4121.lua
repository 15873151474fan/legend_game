RoleTaskInfo4121 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27113, 1, 2},
		},

		task = {s_taskCollect, {60049, 60049}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27113,2,"RoleTaskInfo4121",1}},
	},
}
