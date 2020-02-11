RoleTaskInfo30050 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{55043, 0, 3},
		},

		task = {s_taskCollect, {48036, 48036}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{55043,3,"RoleTaskInfo11900",0}},
	},
}
