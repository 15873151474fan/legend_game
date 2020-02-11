RoleTaskInfo32020 =
{
	parent = 31000,
	subtasknum = 1,
	subtask1 =
	{
		color = TaskColor_Blue,
		onaccept =
		{
			{s_actionSetVar,{116,43,0}},
			{s_actionCorpsInfo,{"同团的团员，在军乐城的超魔导师达芬奇处接取了蓝色品质的“达芬奇的秘密”任务！", 34}},
		},
		task = {s_taskKillNpc, {60789,60789,60866,1}},
		onfinish =
		{
			{s_actionSetVar,{116,43,0}},
			{s_actionRandomAction,{ 20, 100, { {s_actionAddItem,{31434, 0, 1,0, "1-1", "戎装公主奖励"}}} }, },
		},
	},
}
