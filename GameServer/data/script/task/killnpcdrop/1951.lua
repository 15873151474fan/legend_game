RoleTaskInfo1951 =
{
	subtask1 =
	{
		dropitem =
		{
			{10096, 70, 31112, 0, 42, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60086, 60086}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31112,42,"RoleTaskInfo1951"}},
		},
	},
}
