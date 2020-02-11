RoleTaskInfo1755 =
{
	subtasknum = 1,
	subtask1 =
	{
		tip1 = "你见过赌神么？他老人家身高八尺，胸围也是八尺，顶天立地，器宇轩昂，是个十足的败类！",
		tip2 = "我越来越不喜欢这个地方了，我要去大城市生活，那里有美女、美食、还有不用提心吊胆的床。",
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
			{s_actionAddAndFinishTask,{1755}},
		},
		task = {s_taskGuessCard, {60158}},
	},
}
