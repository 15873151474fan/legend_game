RoleTaskInfo3601 =
{
	subtasknum = 1,
	subtask1 =
	{
		tip1 = "你见过赌神么？他老人家身高八尺，胸围也是八尺，顶天立地，器宇轩昂，是个十足的败类！",
		tip2 = "和我翻牌，你是不是觉得自己钱太多，想要支持一下奥丁大陆的福利事业啊！？",
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
			{s_actionAddAndFinishTask,{3601}},
		},
		task = {s_taskGuessCard, {60038,3}},
	},
}
