RoleTaskInfo3281 =
{
	subtasknum = 1,
	subtask1 =
	{
		tip1 = "（选择上方一张牌，点“开牌”，胜利可获得加倍经验奖励）敢和我赌的人可不多，来，开牌吧！",
		tip2 = "（选择上方一张牌，点“开牌”，胜利可获得加倍经验奖励）敢和我赌的人可不多，来，开牌吧！",
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
			{s_actionAddAndFinishTask,{3281}},
		},
		task = {s_taskGuessCard, {60017,3}},
	},
}
