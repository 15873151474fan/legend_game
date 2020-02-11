RoleTaskInfo10764 =
{
	subtask1 =
	{
		dropitem =
		{
			{10062, 35, 31088, 0, 1, "1-1"},
			{10063, 35, 31089, 0, 1, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60076, 60076}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31088,1,"RoleTaskInfo10764"}},
			{s_actionDeleteItemByBaseID,{31089,1,"RoleTaskInfo10764"}},
		},
	},
}
