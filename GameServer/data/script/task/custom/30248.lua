RoleTaskInfo30248 =
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
			{31378, 0, 1},
		},

		task = {s_taskCollect, {232,232}},

		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31378,1,"520活动扣除"}},
		},
	},
}
