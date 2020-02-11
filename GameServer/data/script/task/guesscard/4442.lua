RoleTaskInfo4442 =
{
	subtasknum = 1,
	subtask1 =
	{
		tip1 = "你见过赌神么？他老人家身高八尺，胸围也是八尺，顶天立地，器宇轩昂，是个十足的败类！",
		tip2 = "男人就是应该不断追逐胜利的！不论是战斗，还是牌桌！",
		onsuccess =
		{
			{s_actionSetExpByPercent, {2}},
		},

		onfail =
		{
			{s_actionSetExpByPercent, {1}},
		},

		ongiveup =
		{
			{s_actionAddAndFinishTask,{4442}},
		},
		task = {s_taskGuessCard, {60165}},
	},
}
