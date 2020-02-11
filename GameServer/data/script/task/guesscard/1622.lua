RoleTaskInfo1622 =
{
	subtasknum = 1,
	subtask1 =
	{
		tip1 = "你见过赌神么？他老人家身高八尺，胸围也是八尺，顶天立地，器宇轩昂，是个十足的败类！",
		tip2 = "好吧，好吧。你说什么都行，但是得和我玩把牌！",
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
			{s_actionAddAndFinishTask,{1622}},
		},
		task = {s_taskGuessCard, {60093}},
	},
}
