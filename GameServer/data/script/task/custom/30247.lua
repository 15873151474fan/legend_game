RoleTaskInfo30247 =
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
			{31379, 0, 1},
		},

		task = {s_taskCollect, {233,233}},

		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31379,1,"520活动扣除"}},
		},
	},
}
