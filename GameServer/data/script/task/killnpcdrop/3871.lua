RoleTaskInfo3871 =
{
	subtask1 =
	{
		dropitem =
		{
			{10027, 60, 31052, 0, 14, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60036, 60036}},
	},

	onfinish =
	{
		{s_actionDeleteItemByBaseID,{31052,14,"RoleTaskInfo3871"}},
	},
}
