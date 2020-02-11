RoleTaskInfo4312 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck1 = {
			{s_checkIntoCopy,{}},
		},
		onaccept =
		{
			{s_actionIntoCopyCustomSingle,{1002,144,145,118}},
			{s_actionSysInfo,{"与婚礼使者对话，参加公主的婚礼",8}}
		},
		onfinish =
		{
			{s_actionAddRolePrestige,{250}},
			{s_actionLevelUpMiliRank,{}},
			{s_actionOpenGuide,{4312}},
		},
	},
}
