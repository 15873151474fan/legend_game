RoleTaskInfo3811 =
{
	subtasknum = 1,
	subtask1 =
	{
		{s_taskGuard,{60000,60052,60044}},
		onfinish =
		{
			{s_actionAddRolePrestige,{200}},
			{s_actionLevelUpMiliRank,{}},
		--	{s_actionOpenGuide,{381102}},
		--19级“坐骑”引导关闭
		--{s_actionSysRightRemoveNewFunction,{9}},
		},
		onaccept =
		{
			{s_actionOpenGuide,{3811}},
		},
	},
}
