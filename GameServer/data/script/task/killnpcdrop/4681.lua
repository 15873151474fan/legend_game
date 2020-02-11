RoleTaskInfo4681 =
{
	subtask1 =
	{
		dropitem =
		{
			{10204, 75, 31201, 0, 1, "1-1"},
			{10303, 75, 31202, 0, 1, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60553, 60553}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31201,1,"RoleTaskInfo4681"}},
			{s_actionDeleteItemByBaseID,{31202,1,"RoleTaskInfo4681"}},
		},
	},
}
