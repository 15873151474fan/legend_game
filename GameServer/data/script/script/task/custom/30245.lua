RoleTaskInfo30245 =
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
			{36101, 0, 1},
		},

		task = {s_taskCollect, {233,233}},

		onfinish =
		{
			{s_actionDeleteItemByBaseID,{26102,1,"520活动扣除"}},
		},
	},
}
