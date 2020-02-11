RoleTaskInfo3232 =
{
	subtasknum = 1,
	subtask1 =
	{
		ReQAInfo =
		{
			pass_option = 1,    --该问答有直接跳过去的选项
			talk = "你有什么想问我的么?",
			content = {
				{
					question = "军衔有什么用？",
					answer = "军衔越高，每日可以获得的福利绑银越多。",
				},
				{
					question = "下一次授勋是什么时候？",
					answer = "当你完成了下个场景所有的任务，将会前往光明教会的所在地——光明城。在光明城，你将会由伟大的光明骑士团团长授勋成为下士。",
				},
			},
		},
		task = {s_taskReQA, {60045}},
		onfinish =
		{
			{s_actionChangeRide,{50003, 60*5}},
		},
	},
}

