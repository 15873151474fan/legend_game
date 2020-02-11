RoleTaskInfo4791 =
{
	subtask1 =
	{
		dropitem =
		{
			{10304, 100, 31219, 0, 1, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60558, 60558}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31219,1,"RoleTaskInfo4791"}},
		},
	},
}
