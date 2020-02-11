function s_copyWorldLevelSummonNpc1015(uid, stype, customid, sid, paramlist)
	local worldlevel = s_getWorldLevel()
	if worldlevel == 1 then
		paramlist[1] = 22401
	elseif worldlevel == 2 then
		paramlist[1] = 22402
	elseif worldlevel == 3 then
		paramlist[1] = 22403
	elseif worldlevel == 4 then
		paramlist[1] = 22404
	elseif worldlevel == 5 then
		paramlist[1] = 22405
	elseif worldlevel == 6 then
		paramlist[1] = 22406
	elseif worldlevel == 7 then
		paramlist[1] = 22407
	elseif worldlevel == 8 then
		paramlist[1] = 22407
	elseif worldlevel == 9 then
		paramlist[1] = 22407
	elseif worldlevel == 10 then
		paramlist[1] = 22407
	end
	for i=1, paramlist[2] do
		s_sysSummon(paramlist[1],sid,paramlist[3],paramlist[4],paramlist[5],paramlist[6])
	end
end
--天帝宝库副本
CopySceneInfo_1015 =
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
			--{s_copyWorldLevelSummonNpcToKill,{22000,2,134,135,0,1,2,2,2}},
			{s_copyAddTimer,{1,10}},
		},
	},

	playerinto =
	{
		action =
		{

			{s_copySetVar,{116,67,1}},
			{s_copyRemoveMoney,{2,300,"天帝宝库收费"}},
			{s_copyZoneOne,{"天帝宝库"}},
			--{s_copyZoneTwo,{""}},
			{s_copyZoneThree,{"怪物即将侵袭，请做好防御准备！（10秒后怪物出现）"}},
			{s_copyTime,{900}},
		--{s_copySetSceneVar,{1,1,5}},
		},
	},

	--副本变量改变时的操作
	varchange_2_1_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波怪物的攻击，似乎又有新的怪物出现，击退它们！(第2波怪物，共10波)"}},
			{s_copyWorldLevelSummonNpcToKill,{60957,3,121,116,0,1,2,2,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60957,2,126,114,0,1,2,2,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60957,3,128,108,0,1,2,2,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60957,2,127,103,0,1,2,2,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60957,3,121,100,0,1,2,2,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60957,2,115,103,0,1,2,2,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60957,3,113,108,0,1,2,2,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60957,2,115,114,0,1,2,2,20,1}},
		},
	},

	varchange_2_2_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波怪物的攻击，似乎又有新的怪物出现，击退它们！(第3波怪物，共10波)"}},
			{s_copyWorldLevelSummonNpcToKill,{60958,3,121,116,0,1,2,3,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60958,2,126,114,0,1,2,3,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60958,3,128,108,0,1,2,3,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60958,2,127,103,0,1,2,3,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60958,3,121,100,0,1,2,3,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60958,2,115,103,0,1,2,3,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60958,3,113,108,0,1,2,3,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60958,2,115,114,0,1,2,3,20,1}},
		},
	},

	varchange_2_3_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波怪物的攻击，似乎又有新的怪物出现，击退它们！(第4波怪物，共10波)"}},
			{s_copyWorldLevelSummonNpcToKill,{60959,3,121,116,0,1,2,4,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60959,2,126,114,0,1,2,4,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60959,3,128,108,0,1,2,4,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60959,2,127,103,0,1,2,4,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60959,3,121,100,0,1,2,4,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60959,2,115,103,0,1,2,4,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60959,3,113,108,0,1,2,4,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60959,2,115,114,0,1,2,4,20,1}},
		},
	},

	varchange_2_4_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波怪物的攻击，似乎又有新的怪物出现，击退它们！(第5波怪物，共10波)"}},
			{s_copyWorldLevelSummonNpcToKill,{60960,3,121,116,0,1,2,5,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60960,2,126,114,0,1,2,5,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60960,3,128,108,0,1,2,5,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60960,2,127,103,0,1,2,5,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60960,3,121,100,0,1,2,5,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60960,2,115,103,0,1,2,5,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60960,3,113,108,0,1,2,5,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60960,2,115,114,0,1,2,5,20,1}},
		},
	},

	varchange_2_5_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波怪物的攻击，似乎又有新的怪物出现，击退它们！(第6波怪物，共10波)"}},
			{s_copyWorldLevelSummonNpcToKill,{60961,3,121,116,0,1,2,6,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60961,2,126,114,0,1,2,6,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60961,3,128,108,0,1,2,6,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60961,2,127,103,0,1,2,6,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60961,3,121,100,0,1,2,6,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60961,2,115,103,0,1,2,6,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60961,3,113,108,0,1,2,6,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60961,2,115,114,0,1,2,6,20,1}},
		},
	},

	varchange_2_6_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波怪物的攻击，似乎又有新的怪物出现，击退它们！(第7波怪物，共10波)"}},
			{s_copyWorldLevelSummonNpcToKill,{60962,3,121,116,0,1,2,7,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60962,2,126,114,0,1,2,7,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60962,3,128,108,0,1,2,7,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60962,2,127,103,0,1,2,7,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60962,3,121,100,0,1,2,7,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60962,2,115,103,0,1,2,7,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60962,3,113,108,0,1,2,7,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60962,2,115,114,0,1,2,7,20,1}},
		},
	},

	varchange_2_7_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波怪物的攻击，似乎又有新的怪物出现，击退它们！(第8波怪物，共10波)"}},
			{s_copyWorldLevelSummonNpcToKill,{60963,3,121,116,0,1,2,8,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60963,2,126,114,0,1,2,8,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60963,3,128,108,0,1,2,8,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60963,2,127,103,0,1,2,8,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60963,3,121,100,0,1,2,8,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60963,2,115,103,0,1,2,8,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60963,3,113,108,0,1,2,8,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60963,2,115,114,0,1,2,8,20,1}},
		},
	},

	varchange_2_8_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波怪物的攻击，似乎又有新的怪物出现，击退它们！(第9波怪物，共10波)"}},
			{s_copyWorldLevelSummonNpcToKill,{60964,3,121,116,0,1,2,9,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60964,2,126,114,0,1,2,9,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60964,3,128,108,0,1,2,9,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60964,2,127,103,0,1,2,9,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60964,3,121,100,0,1,2,9,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60964,2,115,103,0,1,2,9,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60964,3,113,108,0,1,2,9,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60964,2,115,114,0,1,2,9,20,1}},
		},
	},

	varchange_2_9_20 =
	{
		action =
		{
			{s_copyZoneThree,{"抵御了一波怪物的攻击，似乎又有新的怪物出现，击退它们！(第10波怪物，共10波)"}},
			{s_copyWorldLevelSummonNpcToKill,{60965,3,121,116,0,1,2,10,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60965,2,126,114,0,1,2,10,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60965,3,128,108,0,1,2,10,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60965,2,127,103,0,1,2,10,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60965,3,121,100,0,1,2,10,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60965,2,115,103,0,1,2,10,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60965,3,113,108,0,1,2,10,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60965,2,115,114,0,1,2,10,20,1}},
		},
	},

	varchange_2_10_20 =
	{
		action =
		{
			{s_copyZoneThree,{"魔军的头领黑魔出现了，小心协作，击倒它！（击倒后可以获得天地宝藏）"}},
			{s_copyWorldLevelSummonNpcToKill,{60966,1,121,116,0,1,2,11,1,1}},
		},
	},

	varchange_2_11_1 =
	{
		action =
		{
			{s_copyZoneThree,{"成功击退了黑魔军，成功拿到了天帝宝库的宝藏！（60秒后自动退出本副本）"}},
			{s_copyWorldLevelSummonNpc1015,{60966,1,123,109}},
			{s_copyAddTimer,{2,60}},
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
		},
	},

	timer_1 =
	{
		action =
		{
			{s_copyZoneThree,{"怪物出现了，击倒所有怪物可以获得宝藏！(第1波怪物，共10波)"}},
			{s_copyWorldLevelSummonNpcToKill,{60956,3,121,116,0,1,2,1,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60956,2,126,114,0,1,2,1,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60956,3,128,108,0,1,2,1,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60956,2,127,103,0,1,2,1,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60956,3,121,100,0,1,2,1,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60956,2,115,103,0,1,2,1,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60956,3,113,108,0,1,2,1,20,1}},
			{s_copyWorldLevelSummonNpcToKill,{60956,2,115,114,0,1,2,1,20,1}},
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

