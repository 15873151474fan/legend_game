RoleTaskInfo3781 =
{
	subtask1 =
	{
		dropitem =
		{
			{10016, 60, 31172, 0, 14, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60028, 60028}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31172,14,"RoleTaskInfo3781"}},
		},
	},
}
