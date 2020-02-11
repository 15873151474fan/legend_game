RoleTaskInfo22004 =
{
	subtasknum = 1,
	parent = 20001,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkTaskCurRing,{20001,4,8}},
			{s_checkCorps,},
		},
		oncheck =
		{
			{s_checkRolePosition, {3, 567, 189, 3, "在光明城坐标(567,189)附近使用"}},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"开始勘探", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"结束勘探", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"勘探成功", 34}},
			{s_actionAddItem,{31177, 0, 1,0, "1-1", "RoleTaskInfo22004_1"}},
		},
		onfail =
		{
			{s_actionSysInfo, {"勘探失败", 34}},
		},
		--使用道具
		useitem = {29016,0,1,"1-1",0,3000,100,100},
		task = {s_taskUseItem, {45112, 45112}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31177,1,"RoleTaskInfo22004_1"}},
		},
	},
}
