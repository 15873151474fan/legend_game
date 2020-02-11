RoleTaskInfo4031 =
{
	subtask1 =
	{
		dropitem =
		{
			{10031, 65, 31054, 0, 18, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60166, 60166}},
	},

	onfinish =
	{
		{s_actionDeleteItemByBaseID,{31054,18,"RoleTaskInfo4031"}},
	},
}
