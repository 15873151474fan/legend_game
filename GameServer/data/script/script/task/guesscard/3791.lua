RoleTaskInfo3791 =
{
	subtasknum = 1,
	subtask1 =
	{
		tip1 = "你见过赌神么？他老人家身高八尺，胸围也是八尺，顶天立地，器宇轩昂，是个十足的败类！",
		tip2 = "在这片迷雾的林子里，没有我喜欢的女人，也再没有了能与我对抗的敌人。也许只有偶尔的小赌，能让我开心吧！",
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
			{s_actionAddAndFinishTask,{3791}},
		},
		task = {s_taskGuessCard, {60028}},
	},
}
