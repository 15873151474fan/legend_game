RoleTaskInfo3521 =
{
	subtasknum = 1,

	subtask1 =
	{
		--读条前的检查
		oncheck =
		{
			{s_checkRolePosition, {2, 163, 314, 5, "<n color=GXColorBlueSky>请在</n><goto x=163 y=314 mapid=2 click=1/><n color=GXColorBlueSky>附近使用</n>"}},
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
			{s_actionAddBuff,{5044, 0, 15, 0}},
		},
		onfail =
		{
			{s_actionSysInfo, {"读条失败", 34}},
		},
		--使用道具
		useitem = {31185,0,1,"1-1",0,3000,100,100},
		task = {s_taskUseItem, {60019, 60019}},
		onfinish =
		{
			{s_actionAddBuff,{5046, 0, 180}},
		},
		onaccept =
		{
			{s_actionOpenGuide,{3521}},

		},
	},
}
