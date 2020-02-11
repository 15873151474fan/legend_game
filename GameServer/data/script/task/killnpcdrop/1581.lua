RoleTaskInfo1581 =
{
	subtask1 =
	{
		dropitem =
		{
			{10064, 65, 31084, 0, 28, "1-1"},
		},
		task = {s_taskKillNpcDrop, {60152, 60152}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31084,28,"RoleTaskInfo1581"}},
		--42级“5星武器”引导关闭
		--{s_actionSysRightRemoveNewFunction,{58}},
		},
	},
}
