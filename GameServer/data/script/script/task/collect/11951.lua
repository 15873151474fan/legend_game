RoleTaskInfo11951 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27113, 1, 5},
		},

		task = {s_taskCollect, {60049, 60049}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27113,5,"RoleTaskInfo11951",1}},
	},
}
