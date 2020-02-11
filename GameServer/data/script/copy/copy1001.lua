--副本样例
CopySceneInfo_1001 =
{
	maxplayernum = 1,

	--初始化副本的操作
	initcopy =
	{
		action =
		{
			{s_copySetLifeTime,{900}},
			{s_copySummonNpc,{22000,2,134,135,}},
			{s_copySummonNpcToKill,{22000,2,134,135,0,0,2,2,2}},
		--{s_copyAddTimer,{4,10}}
		},
	},

	timer_4 =
	{
		action =
		{
			{s_copyAddTimer,{5,10}},
			{s_copyClearNpcByBaseID,{22000}},
			{s_copyCopyInfo,{"副本消息",}},
			{s_copyAddItem,{31446,0,1,1,"1-1","副本1001,定时器4"}},
			{s_copyAddBuff,{5045,1,20,0}},
			{s_copyGoto,{100,200,0}},
		},
	},

	timer_5 =
	{
		action =
		{
			{s_copyDeleteItemByBaseID,{31446,1,"副本1001,定时器5",0}},
			{s_copyRemoveBuff,{5045,0}},
			{s_copyAddSfx,{46}},
			{s_copySmile,{2}},
		},
	},

	playerinto =
	{
		action =
		{
			{s_copyZoneOne,{"区域一"}},
			{s_copyZoneTwo,{"区域二"}},
			{s_copyZoneThree,{"区域三"}},
			{s_copyTime,{800}},

			{s_copySetSceneVar,{1,1,5}},
			{s_copyRandomSetSceneVar,{1,5,1,1}},
		},
	},

	--副本变量改变时的操作
	varchange_2_2_2 =
	{
		action =
		{
			{s_copyClearCopy,{}},
		},
	},

	varchange_1_1_1 =
	{
		action =
		{
			{s_copyZoneThree,{"区域三-1-1-1"}},
		},
	},
	varchange_1_1_2 =
	{
		action =
		{
			{s_copyZoneThree,{"区域三-1-1-2"}},
		},
	},
	varchange_1_1_3 =
	{
		action =
		{
			{s_copyZoneThree,{"区域三-1-1-3"}},
		},
	},
	varchange_1_1_4 =
	{
		action =
		{
			{s_copyZoneThree,{"区域三-1-1-4"}},
		},
	},
	varchange_1_1_5 =
	{
		action =
		{
			{s_copyZoneThree,{"区域三-1-1-5"}},
		},
	},

	--[[
	playerintozone_1 =
	{
	action =
	{
	{s_copyZoneThree,{"区域三-Into-zone1"}},
	},
	},
	playerleavezone_1 =
	{
	check =
	{
	{s_copycheckSceneVar,{1,2,0,1}},
	},
	action =
	{
	{s_copyZoneThree,{"区域三-Leave-zone1"}},
	{s_copyAddTimer,{1,5}},
	{s_copySetSceneVar,{1,2,2}},
	},
	},
	]]
	npcintozone_1_22000 =
	{
		action =
		{
			{s_copyZoneThree,{"区域三-Npc-Into-zone1"}},
		},
	},
	npcleavezone_1_22000 =
	{
		--check =
		--{
		--	{s_copycheckSceneVar,{1,2,0,1}},
		--},
		action =
		{
			{s_copyZoneThree,{"区域三-Npc-Leave-zone1"}},
		--{s_copyAddTimer,{1,5}},
		--{s_copySetSceneVar,{1,2,2}},
		},
	},

	timer_1 =
	{
		action =
		{
			{s_copyZoneTwo,{"区域二-timer_1"}},
			{s_copyAddTimer,{2,5}},
		},
	},

	timer_2 =
	{
		action =
		{
			{s_copyZoneTwo,{"区域二-timer_2"}},
		},
	},

}

--副本向排队系统申请加人
function CopySceneInfo_1001:OnCopyRequestPlayer(sid,uid)
	local country = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_HOMELAND)
	if country == 0 then country = 0 end
	s_copyRequestPlayer(sid, 60, 1001, country, self.maxplayernum, "副本1001目前进行到什么进程，邀请您加入，是否加入？", 142, 150)
end


--增加副本的排队
s_createQueueOneGroup(13,60,1001,144,145,118,"副本1001",CopySceneInfo_1001.maxplayernum,0,100)
