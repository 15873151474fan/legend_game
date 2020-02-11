RoleTaskInfo1542 =
{
	subtasknum = 1,
	subtask1 =
	{
		tip1 = "你见过赌神么？他老人家身高八尺，胸围也是八尺，顶天立地，器宇轩昂，是个十足的败类！",
		tip2 = "我这辈子最倒霉的就是在牌桌上碰到了索罗斯，那家伙就是个恶棍！",
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
			{s_actionAddAndFinishTask,{1542}},
		},
		task = {s_taskGuessCard, {60064}},
	},
}
