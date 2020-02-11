RoleTaskInfo3341 =
{
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom, {60035, 60035, 1, 0}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31008,1,"RoleTaskInfo3341"}},
		--10级“装备合成”引导关闭
		--{s_actionSysRightRemoveNewFunction,{5}},
		},
		onaccept =
		{
			{s_actionOpenGuide,{3341}},
		},
	},
}
