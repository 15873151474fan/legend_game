RoleTaskInfo11902 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27112, 2, 5},
		},

		task = {s_taskCollect, {60049, 60049}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27112,5,"RoleTaskInfo11902",2}},
	},
}
