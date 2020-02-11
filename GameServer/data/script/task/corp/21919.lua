RoleTaskInfo21919 =
{
	subtasknum = 1,
	parent = 20001,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkTaskCurRing,{20001,7,10}},
			{s_checkCorps,},
		},
		dropitem =
		{
			{10216, 80, 31179, 0, 1, "1-1"},
		},
		task = {s_taskKillNpcDrop, {45112, 45112}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31179,1,"RoleTaskInfo21919"}},
		},
	},
}
