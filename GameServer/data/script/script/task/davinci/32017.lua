RoleTaskInfo32017 =
{
	parent = 31000,
	subtasknum = 1,
	subtask1 =
	{
		color = TaskColor_Blue,
		onaccept =
		{
			{s_actionCorpsInfo,{"同团的团员，在军乐城的超魔导师达芬奇处接取了蓝色品质的“达芬奇的秘密”任务！", 34}},
		},
		task = {s_taskKillNpc, {60789,60789,60809,1}},
		onfinish =
		{
			{s_actionAddItem,{31443, 0, 1,0, "1-1", "奖章"}},
			{s_actionRandomAction,{ 40, 100, { {s_actionAddItem,{31436, 0, 1,0, "1-1", "怪味晶果奖励"}}} }, },
		},
	},
}
