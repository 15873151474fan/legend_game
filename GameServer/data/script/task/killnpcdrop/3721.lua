RoleTaskInfo3721 =
{
	subtask1 =
	{
		onaccept =
		{
			{s_actionChangeRide,{50003, 60*5}},
		},
		dropitem =
		{
			{10134, 100, 31033, 0, 1, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60028, 60028}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31033,1,"RoleTaskInfo3721"}},
			{s_actionChangeRide,{0, 0}},
		},
	},
}
