RoleTaskInfo11900 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27118, 0, 5},
		},

		task = {s_taskCollect, {60049, 60049}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27118,5,"RoleTaskInfo11900",0}},
	},
}
