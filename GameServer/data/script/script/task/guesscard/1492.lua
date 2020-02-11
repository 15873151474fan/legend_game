RoleTaskInfo1492 =
{
	subtasknum = 1,
	subtask1 =
	{
		tip1 = "你见过赌神么？他老人家身高八尺，胸围也是八尺，顶天立地，器宇轩昂，是个十足的败类！",
		tip2 = "虽然我叫韦德，但是我从来不打篮球！当然，你可以称呼我为虔诚之睿智者！",
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
			{s_actionAddAndFinishTask,{1492}},
		},
		task = {s_taskGuessCard, {60148}},
	},
}
