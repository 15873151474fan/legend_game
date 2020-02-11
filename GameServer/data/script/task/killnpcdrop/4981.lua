RoleTaskInfo4981 =
{
	subtask1 =
	{
		dropitem =
		{
			{10209, 50, 31205, 0, 40, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60555, 60555}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31205,40,"RoleTaskInfo4981"}},
		},
	},
}
