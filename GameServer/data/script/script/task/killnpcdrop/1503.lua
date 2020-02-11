RoleTaskInfo1503 =
{
	subtask1 =
	{
		dropitem =
		{
			{10149,100, 31104, 0, 1, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60149, 60149}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31104,1,"RoleTaskInfo1503"}},
		},
	},
}
