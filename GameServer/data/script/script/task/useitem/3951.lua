RoleTaskInfo3951 =
{
	subtasknum = 1,

	subtask1 =
	{
		onaccept = {
			{s_actionOpenGuide,{3951}},
		},
		--读条前的检查
		oncheck =
		{
			{s_checkRolePosition, {4, 102, 190, 5, "在燃烧平原坐标(102,190)附近使用"}},
		},
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
		},
		onfail =
		{
			{s_actionSysInfo, {"读条失败", 34}},
		},
		--使用道具
		useitem = {31189,0,1,"1-1",0,3000,100,100},
		task = {s_taskUseItem, {60051, 60051}},
	},
}
