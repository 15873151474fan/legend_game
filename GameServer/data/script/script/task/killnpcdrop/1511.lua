RoleTaskInfo1511 =
{
	selectitem =
	{
		{17105,3,1,1,"1-1,6-1,7-1,502-10"},
		{17205,3,1,1,"1-1,6-1,7-1,502-10"},
	},
	subtask1 =
	{
		dropitem =
		{
			{10060, 65, 31080, 0, 25, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60149, 60149}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31080,25,"RoleTaskInfo1511"}},
		},
	},
}
