RoleTaskInfo3271 =
{
	subtask1 =
	{
		dropitem =
		{
			{10117, 90, 31039, 0, 10, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60017, 60017}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31039,10,"RoleTaskInfo3271"}},
		},
		onaccept =
		{
			{s_actionOpenGuide,{3271}},
		},
	},
}
