--广寒仙境
--变量102_1汲取任务
CopySceneInfo_1018 =
{
	--初始化副本的操作
	initcopy =
	{
		action =
		{
			{s_copySetLifeTime,{1680}},
			{s_copySummonNpc,{365,1,18,60,}},
			{s_copySummonNpc,{48014,1,33,47,}},
			{s_copySummonNpc,{48014,1,39,77,}},
			{s_copySummonNpc,{48014,1,25,97,}},
		--{s_copySetSceneVar,{99,1,1}},
		--{s_copySummonNpcToKill,{22000,2,134,135,0,0,2,2,2}},
		--{s_copySetSceneVar,{99,1,2}},
		--{s_copySetSceneVar,{98,1,2}},
		},
	},

	playerinto =
	{
		action =
		{
			{s_copyZoneOne,{"广寒仙境"}},
			--{s_copyZoneTwo,{""}},
			{s_copyZoneThree,{"快去嫦娥处看看吧，她有麻烦了"}},
			{s_copyTime,{1680}},
		--{s_copySummonNpcToKill,{22000,2,134,135,0,0,2,2,5}}
		--{s_copySetSceneVar,{1,1,5}},
		},
	},
	--副本变量改变时的操作
	varchange_102_1_1 =
	{
		action =
		{
			{s_copyZoneThree,{"变身老虎后追捕3头饥饿的狼道指定区域"}},
		},
	},

	varchange_103_1_1 =
	{
		action =
		{
			{s_copyZoneThree,{"快去地图周边寻找并击败3个狼族指挥官吧！"}},
		},
	},

	varchange_1_1_1 =
	{
		action =
		{
			{s_copyZoneThree,{"成功追捕1只饥饿的狼，请再接再厉，将场景上剩余的2只饥饿的狼赶入指定区域！"}},
			--{s_copyAddItem,{31532,0,1,1,"1-1","足球训练"}},
			{s_copyAddRoleTaskOperate,{50040}},
		},
	},
	varchange_1_1_2 =
	{
		action =
		{
			{s_copyZoneThree,{"成功追捕2只饥饿的狼，请再接再厉，将场景上剩余的1只饥饿的狼赶入指定区域！"}},
			--{s_copyAddItem,{31532,0,1,1,"1-1","足球训练"}},
			{s_copyAddRoleTaskOperate,{50040}},
		},
	},
	varchange_1_1_3 =
	{
		action =
		{
			{s_copyZoneThree,{"成功追捕3只饥饿的狼，事件的源头就要出现了!快去嫦娥那里接下一步任务吧"}},
			--{s_copyAddItem,{31532,0,1,1,"1-1","足球训练"}},
			{s_copyAddRoleTaskOperate,{50040}},
		},
	},

	--1号区检查追捕是否有效果
	npcintozone_1_56031 =
	{
		--check =
		--{
		--{s_copycheckSceneVar,{99,1,2,2}},
		--},
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{56031}	},
			{s_copyAddBuff,{5046,1,10,0}},
			{s_copySummonNpc,{56031,1,14,62,}},
		},
	--[[actionnot =
	{
	{s_copyClearNpcByBaseID,{56031}	},
	{s_copySummonNpc,{56031,1,14,62,}},
	{s_copyAddBuff,{5046,1,4,0}},
	},	]]--
	},

	npcintozone_1_56032 =
	{
		--[[check =
		{
		{s_copycheckSceneVar,{99,1,2,2}},
		},]]--
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{56032}	},
			{s_copyAddBuff,{5046,1,10,0}},
			{s_copySummonNpc,{56032,1,18,66,}},
		},
	--[[actionnot =
	{
	{s_copyClearNpcByBaseID,{22721}	},
	{s_copySummonNpc,{56032,1,18,66,}},
	{s_copyAddBuff,{5046,1,4,0}},
	},		]]--
	},

	npcintozone_1_56033 =
	{
		--[[check =
		{
		{s_copycheckSceneVar,{99,1,2,2}},
		},]]--
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{56033}	},
			{s_copyAddBuff,{5046,1,10,0}},
			{s_copySummonNpc,{56033,1,22,61,}},
		},
	--[[actionnot =
	{
	{s_copyClearNpcByBaseID,{56033}	},
	{s_copySummonNpc,{56033,1,22,61,}},
	{s_copyAddBuff,{5046,1,4,0}},
	},		]]--
	},

	--2号区检查追捕是否有效果
	npcintozone_2_56031 =
	{
		--[[check =
		{
		{s_copycheckSceneVar,{99,1,2,2}},
		},]]--
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{56031}	},
			{s_copyAddBuff,{5046,1,10,0}},
			{s_copySummonNpc,{56031,1,14,62,}},
		},
	--[[actionnot =
	{
	{s_copyClearNpcByBaseID,{56031}	},
	{s_copySummonNpc,{56031,1,14,62,}},
	{s_copyAddBuff,{5046,1,4,0}},
	},	]]--
	},

	npcintozone_2_56032 =
	{
		--[[check =
		{
		{s_copycheckSceneVar,{99,1,2,2}},
		},]]--
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{56032}	},
			{s_copyAddBuff,{5046,1,10,0}},
			{s_copySummonNpc,{56032,1,18,66,}},
		},
	--[[actionnot =
	{
	{s_copyClearNpcByBaseID,{56032}	},
	{s_copySummonNpc,{56032,1,18,66,}},
	{s_copyAddBuff,{5046,1,4,0}},
	},	]]--
	},

	npcintozone_2_56033 =
	{
		--[[check =
		{
		{s_copycheckSceneVar,{99,1,2,2}},
		},]]--
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{56033}	},
			{s_copyAddBuff,{5046,1,10,0}},
			{s_copySummonNpc,{56033,1,22,61,}},
		},
	--[[actionnot =
	{
	{s_copyClearNpcByBaseID,{56033}	},
	{s_copySummonNpc,{56033,1,22,61,}},
	{s_copyAddBuff,{5046,1,4,0}},
	},		]]--
	},

	--3号区检查入球是否有效果
	npcintozone_3_56031 =
	{
		--[[check =
		{
		{s_copycheckSceneVar,{99,1,2,2}},
		},]]--
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{56031}	},
			{s_copyAddBuff,{5046,1,10,0}},
			{s_copySummonNpc,{56031,1,14,62,}},
		},
	--[[actionnot =
	{
	{s_copyClearNpcByBaseID,{56031}	},
	{s_copySummonNpc,{56031,1,14,62,}},
	{s_copyAddBuff,{5046,1,4,0}},
	},		]]--
	},

	npcintozone_3_56032 =
	{
		--[[check =
		{
		{s_copycheckSceneVar,{99,1,2,2}},
		},]]--
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{56032}	},
			{s_copyAddBuff,{5046,1,10,0}},
			{s_copySummonNpc,{56032,1,18,66,}},
		},
	--[[actionnot =
	{
	{s_copyClearNpcByBaseID,{56032}	},
	{s_copySummonNpc,{56032,1,18,66,}},
	{s_copyAddBuff,{5046,1,4,0}},
	},	]]--
	},

	npcintozone_3_56033 =
	{
		--[[check =
		{
		{s_copycheckSceneVar,{99,1,2,2}},
		},]]--
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{56033}	},
			{s_copyAddBuff,{5046,1,10,0}},
			{s_copySummonNpc,{56033,1,22,61,}},
		},
	--[[actionnot =
	{
	{s_copyClearNpcByBaseID,{56033}	},
	{s_copySummonNpc,{56033,1,22,61,}},
	{s_copyAddBuff,{5046,1,4,0}},
	},	]]--
	},

}
--玩家离开副本
function CopySceneInfo_1018:OnPlayerLeaveCopyScene(cid,uid)
	s_resetTrafficType(uid)
end
