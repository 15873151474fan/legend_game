RoleTaskInfo1501 =
{
	subtask1 =
	{
		dropitem =
		{
			{10059, 65, 31079, 0, 25, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60075, 60075}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31079,25,"RoleTaskInfo1501"}},
		},
	},
}
