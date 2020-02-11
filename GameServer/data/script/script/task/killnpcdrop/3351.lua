RoleTaskInfo3351 =
{
	subtask1 =
	{
		dropitem =
		{
			{10132, 80, 31171, 0, 10, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60035, 60035}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31171,10,"RoleTaskInfo3351"}},
		},
		onaccept =
		{
			{s_actionOpenGuide,{3351}},
		},
	},
}
