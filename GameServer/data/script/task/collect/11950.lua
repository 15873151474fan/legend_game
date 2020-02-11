RoleTaskInfo11950 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27119, 0, 5},
		},

		task = {s_taskCollect, {60049, 60049}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27119,5,"RoleTaskInfo11950",0}},
	},
}
