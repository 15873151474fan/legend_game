--广寒仙境
--101_1  接取任务
CopySceneInfo_1017 =
{
	--初始化副本的操作
	initcopy =
	{
		action =
		{
			{s_copySetLifeTime,{1680}},
			{s_copySummonNpc,{364,1,41,60,}},
		--{s_copySetSceneVar,{99,1,1}},
		--{s_copySummonNpcToKill,{22000,2,134,135,0,0,2,2,2}},
		},
	},

	playerinto =
	{
		action =
		{
			{s_copyZoneOne,{"广寒仙境"}},
			--{s_copyZoneTwo,{""}},
			{s_copyZoneThree,{"快去嫦娥处听她讲述她的故事吧，还有活动等着您哟"}},
			{s_copyTime,{1680}},
		--{s_copySetSceneVar,{1,1,5}},
		},
	},
	--副本变量改变时的操作
	varchange_101_1_1 =
	{
		action =
		{
			{s_copyZoneThree,{"快去抓调皮的小兔子吧！"}},
		},
	},


}
--玩家离开副本
function CopySceneInfo_1017:OnPlayerLeaveCopyScene(cid,uid)
	s_resetTrafficType(uid)
end

