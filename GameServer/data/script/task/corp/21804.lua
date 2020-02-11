RoleTaskInfo21804 =
{
	subtasknum = 1,
	parent = 20001,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkTaskCurRing,{20001,3,10}},
			{s_checkCorps,},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"开始修理", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"结束修理", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"修理成功", 34}},
		},
		onfail =
		{
			{s_actionSysInfo, {"修理失败", 34}},
		},
		useitem = {31180,0,1,"1-1",0,3000,100,100},
		task = {s_taskUseItem, {45112, 45112}},
	},
}
