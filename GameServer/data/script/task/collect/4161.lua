RoleTaskInfo4161 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27112, 1, 2},
		},

		task = {s_taskCollect, {60049, 60049}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27112,2,"RoleTaskInfo4161",1}},
	},
}
