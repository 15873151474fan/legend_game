RoleTaskInfo4991 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{31206, 0, 1},
			{31207, 0, 1},
		},

		task = {s_taskCollect, {60555, 60555}},

		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31206,1,"RoleTaskInfo4991"}},
			{s_actionDeleteItemByBaseID,{31207,1,"RoleTaskInfo4991"}},
		},
	},
}
