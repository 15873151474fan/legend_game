--达芬奇任务（戎装公主副本）
CopySceneInfo_1008 =
{
	--初始化副本的操作
	initcopy =
	{
		action =
		{
			{s_copySetLifeTime,{900}},
			--{s_copySummonNpc,{44334,1,116,109,}},
			--{s_copySummonNpc,{44335,1,119,103,}},
			--{s_copySetSceneVar,{99,1,1}},
			--{s_copySummonNpcToKill,{22000,2,134,135,0,1,2,2,2}},
			{s_copyAddTimer,{1,10}},
		},
	},

	playerinto =
	{
		action =
		{
			{s_copyZoneOne,{"维多利亚之战"}},
			--{s_copyZoneTwo,{""}},
			{s_copyZoneThree,{"魔军即将侵袭，请协助安妮公主和艾伦王子做好防御准备！（10秒后敌军出现）"}},
			{s_copyTime,{900}},
		--{s_copySetSceneVar,{1,1,5}},
		},
	},

	--副本变量改变时的操作
	varchange_2_1_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波敌人的攻击，似乎又有新的伏兵出现，击退它们！(第2波怪物，共10波)"}},
			{s_copySummonNpcToKill,{60857,3,121,116,0,1,2,2,20}},
			{s_copySummonNpcToKill,{60857,2,126,114,0,1,2,2,20}},
			{s_copySummonNpcToKill,{60857,3,128,108,0,1,2,2,20}},
			{s_copySummonNpcToKill,{60857,2,127,103,0,1,2,2,20}},
			{s_copySummonNpcToKill,{60857,3,121,100,0,1,2,2,20}},
			{s_copySummonNpcToKill,{60857,2,115,103,0,1,2,2,20}},
			{s_copySummonNpcToKill,{60857,3,113,108,0,1,2,2,20}},
			{s_copySummonNpcToKill,{60857,2,115,114,0,1,2,2,20}},
		},
	},

	varchange_2_2_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波敌人的攻击，似乎又有新的伏兵出现，击退它们！(第3波怪物，共10波)"}},
			{s_copySummonNpcToKill,{60858,3,121,116,0,1,2,3,20}},
			{s_copySummonNpcToKill,{60858,2,126,114,0,1,2,3,20}},
			{s_copySummonNpcToKill,{60858,3,128,108,0,1,2,3,20}},
			{s_copySummonNpcToKill,{60858,2,127,103,0,1,2,3,20}},
			{s_copySummonNpcToKill,{60858,3,121,100,0,1,2,3,20}},
			{s_copySummonNpcToKill,{60858,2,115,103,0,1,2,3,20}},
			{s_copySummonNpcToKill,{60858,3,113,108,0,1,2,3,20}},
			{s_copySummonNpcToKill,{60858,2,115,114,0,1,2,3,20}},
		},
	},

	varchange_2_3_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波敌人的攻击，似乎又有新的伏兵出现，击退它们！(第4波怪物，共10波)"}},
			{s_copySummonNpcToKill,{60859,3,121,116,0,1,2,4,20}},
			{s_copySummonNpcToKill,{60859,2,126,114,0,1,2,4,20}},
			{s_copySummonNpcToKill,{60859,3,128,108,0,1,2,4,20}},
			{s_copySummonNpcToKill,{60859,2,127,103,0,1,2,4,20}},
			{s_copySummonNpcToKill,{60859,3,121,100,0,1,2,4,20}},
			{s_copySummonNpcToKill,{60859,2,115,103,0,1,2,4,20}},
			{s_copySummonNpcToKill,{60859,3,113,108,0,1,2,4,20}},
			{s_copySummonNpcToKill,{60859,2,115,114,0,1,2,4,20}},
		},
	},

	varchange_2_4_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波敌人的攻击，似乎又有新的伏兵出现，击退它们！(第5波怪物，共10波)"}},
			{s_copySummonNpcToKill,{60860,3,121,116,0,1,2,5,20}},
			{s_copySummonNpcToKill,{60860,2,126,114,0,1,2,5,20}},
			{s_copySummonNpcToKill,{60860,3,128,108,0,1,2,5,20}},
			{s_copySummonNpcToKill,{60860,2,127,103,0,1,2,5,20}},
			{s_copySummonNpcToKill,{60860,3,121,100,0,1,2,5,20}},
			{s_copySummonNpcToKill,{60860,2,115,103,0,1,2,5,20}},
			{s_copySummonNpcToKill,{60860,3,113,108,0,1,2,5,20}},
			{s_copySummonNpcToKill,{60860,2,115,114,0,1,2,5,20}},
		},
	},

	varchange_2_5_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波敌人的攻击，似乎又有新的伏兵出现，击退它们！(第6波怪物，共10波)"}},
			{s_copySummonNpcToKill,{60861,3,121,116,0,1,2,6,20}},
			{s_copySummonNpcToKill,{60861,2,126,114,0,1,2,6,20}},
			{s_copySummonNpcToKill,{60861,3,128,108,0,1,2,6,20}},
			{s_copySummonNpcToKill,{60861,2,127,103,0,1,2,6,20}},
			{s_copySummonNpcToKill,{60861,3,121,100,0,1,2,6,20}},
			{s_copySummonNpcToKill,{60861,2,115,103,0,1,2,6,20}},
			{s_copySummonNpcToKill,{60861,3,113,108,0,1,2,6,20}},
			{s_copySummonNpcToKill,{60861,2,115,114,0,1,2,6,20}},
		},
	},

	varchange_2_6_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波敌人的攻击，似乎又有新的伏兵出现，击退它们！(第7波怪物，共10波)"}},
			{s_copySummonNpcToKill,{60862,3,121,116,0,1,2,7,20}},
			{s_copySummonNpcToKill,{60862,2,126,114,0,1,2,7,20}},
			{s_copySummonNpcToKill,{60862,3,128,108,0,1,2,7,20}},
			{s_copySummonNpcToKill,{60862,2,127,103,0,1,2,7,20}},
			{s_copySummonNpcToKill,{60862,3,121,100,0,1,2,7,20}},
			{s_copySummonNpcToKill,{60862,2,115,103,0,1,2,7,20}},
			{s_copySummonNpcToKill,{60862,3,113,108,0,1,2,7,20}},
			{s_copySummonNpcToKill,{60862,2,115,114,0,1,2,7,20}},
		},
	},

	varchange_2_7_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波敌人的攻击，似乎又有新的伏兵出现，击退它们！(第8波怪物，共10波)"}},
			{s_copySummonNpcToKill,{60863,3,121,116,0,1,2,8,20}},
			{s_copySummonNpcToKill,{60863,2,126,114,0,1,2,8,20}},
			{s_copySummonNpcToKill,{60863,3,128,108,0,1,2,8,20}},
			{s_copySummonNpcToKill,{60863,2,127,103,0,1,2,8,20}},
			{s_copySummonNpcToKill,{60863,3,121,100,0,1,2,8,20}},
			{s_copySummonNpcToKill,{60863,2,115,103,0,1,2,8,20}},
			{s_copySummonNpcToKill,{60863,3,113,108,0,1,2,8,20}},
			{s_copySummonNpcToKill,{60863,2,115,114,0,1,2,8,20}},
		},
	},

	varchange_2_8_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波敌人的攻击，似乎又有新的伏兵出现，击退它们！(第9波怪物，共10波)"}},
			{s_copySummonNpcToKill,{60864,3,121,116,0,1,2,9,20}},
			{s_copySummonNpcToKill,{60864,2,126,114,0,1,2,9,20}},
			{s_copySummonNpcToKill,{60864,3,128,108,0,1,2,9,20}},
			{s_copySummonNpcToKill,{60864,2,127,103,0,1,2,9,20}},
			{s_copySummonNpcToKill,{60864,3,121,100,0,1,2,9,20}},
			{s_copySummonNpcToKill,{60864,2,115,103,0,1,2,9,20}},
			{s_copySummonNpcToKill,{60864,3,113,108,0,1,2,9,20}},
			{s_copySummonNpcToKill,{60864,2,115,114,0,1,2,9,20}},
		},
	},

	varchange_2_9_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波敌人的攻击，似乎又有新的伏兵出现，击退它们！(第10波怪物，共10波)"}},
			{s_copySummonNpcToKill,{60865,3,121,116,0,1,2,10,20}},
			{s_copySummonNpcToKill,{60865,2,126,114,0,1,2,10,20}},
			{s_copySummonNpcToKill,{60865,3,128,108,0,1,2,10,20}},
			{s_copySummonNpcToKill,{60865,2,127,103,0,1,2,10,20}},
			{s_copySummonNpcToKill,{60865,3,121,100,0,1,2,10,20}},
			{s_copySummonNpcToKill,{60865,2,115,103,0,1,2,10,20}},
			{s_copySummonNpcToKill,{60865,3,113,108,0,1,2,10,20}},
			{s_copySummonNpcToKill,{60865,2,115,114,0,1,2,10,20}},
		},
	},

	varchange_2_10_20 =
	{
		action =
		{
			{s_copyZoneThree,{"魔军的头领黑魔出现了，小心协作，击倒它！（击倒后10秒自动退出副本）"}},
			{s_copySummonNpcToKill,{60866,1,121,116,0,1,2,11,1}},
		},
	},

	varchange_2_11_1 =
	{
		action =
		{
			{s_copyZoneThree,{"成功击退了黑魔军，保护了王国，赢得了维多利亚战役的胜利！（10秒后自动退出本副本）"}},
			{s_copyAddTimer,{2,10}},
		},
	},

	playerintozone_1 =
	{
		check =
		{
			{s_copycheckSceneVar,{99,1,2,2}},
		},
		action =
		{
			{s_copyAddTimer,{2,25}},
			{s_copySetSceneVar,{99,1,0}},
			{s_copyPlayClientLua,{2}},
		},
	},

	timer_1 =
	{
		action =
		{
			{s_copyZoneThree,{"黑魔的军团士兵出现了，击退它们，守卫王的国土！(第1波怪物，共10波)"}},
			{s_copySummonNpcToKill,{60856,3,121,116,0,1,2,1,20}},
			{s_copySummonNpcToKill,{60856,2,126,114,0,1,2,1,20}},
			{s_copySummonNpcToKill,{60856,3,128,108,0,1,2,1,20}},
			{s_copySummonNpcToKill,{60856,2,127,103,0,1,2,1,20}},
			{s_copySummonNpcToKill,{60856,3,121,100,0,1,2,1,20}},
			{s_copySummonNpcToKill,{60856,2,115,103,0,1,2,1,20}},
			{s_copySummonNpcToKill,{60856,3,113,108,0,1,2,1,20}},
			{s_copySummonNpcToKill,{60856,2,115,114,0,1,2,1,20}},
		},
	},

	timer_2 =
	{
		action =
		{
			{s_copyClearCopy,{}},
		},
	},

}
