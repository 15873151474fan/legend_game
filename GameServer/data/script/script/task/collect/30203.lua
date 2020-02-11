
RoleTaskInfo30203 =
{
	subtasknum = 1,
	subtask1 =
	{

		onstartbar =
		{
			{s_actionSysInfo, {"开始读条", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"结束读条", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"读条成功", 34}},
			{s_actionAddItem,{63045, 0, 1,0, "1-1", "RoleTaskInfo30203_1"}},
		},
		onfail =
		{
			{s_actionSysInfo, {"读条失败", 34}},
		},
		clicknpc = {10517, 0, 0, 3500, 100, 100},
		collectitem =
		{
			{63045, 0, 5},
		},
		task = {s_taskClickNpc, {10504, 10504}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{63045,5,"RoleTaskInfo30203"}},
		},
	},

}
