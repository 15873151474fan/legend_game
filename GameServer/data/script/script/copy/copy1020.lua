--副本
--101,1 副本完成条件
--101,2 倒计时显示
--101,3 客户端动画
CopySceneInfo_1020 =
{
	--初始化副本的操作
	initcopy =
	{
		action =
		{


			{s_copySetLifeTime,{600}},
			{s_copyAddTimer,{1,2}},
		},
	},

	playerinto =
	{
		action =
		{
			{s_copyTime,{600}},
			{s_copyZoneOne,{"攻入神殿"}},
			{s_copyZoneTwo,{""}},
			{s_copyZoneThree,{"击败5个神殿守卫，找到主神！"}},
		},
	},

	timer_1 =
	{
		action =
		{
			{s_copySummonNpc,{10500,1,112,193,}},
			{s_copySummonNpc,{10500,1,112,183,}},
			{s_copySummonNpc,{10500,1,112,173,}},
			{s_copySummonNpc,{10500,1,112,163,}},
			{s_copySummonNpc,{10500,1,112,153,}},
			{s_copySummonNpc,{10500,1,112,143,}},

			{s_copySummonNpc,{10500,1,104,193,}},
			{s_copySummonNpc,{10500,1,104,183,}},
			{s_copySummonNpc,{10500,1,104,173,}},
			{s_copySummonNpc,{10500,1,104,163,}},
			{s_copySummonNpc,{10500,1,104,153,}},
			{s_copySummonNpc,{10500,1,104,143,}},

			{s_copySummonNpc,{10500,1,81,193,}},
			{s_copySummonNpc,{10500,1,81,183,}},
			{s_copySummonNpc,{10500,1,81,173,}},
			{s_copySummonNpc,{10500,1,81,163,}},
			{s_copySummonNpc,{10500,1,81,153,}},
			{s_copySummonNpc,{10500,1,81,143,}},

			{s_copySummonNpc,{10500,1,73,193,}},
			{s_copySummonNpc,{10500,1,73,183,}},
			{s_copySummonNpc,{10500,1,73,173,}},
			{s_copySummonNpc,{10500,1,73,163,}},
			{s_copySummonNpc,{10500,1,73,153,}},
			{s_copySummonNpc,{10500,1,73,143,}},
			--宫女
			{s_copySummonNpc,{10501,1,112,188,}},
			{s_copySummonNpc,{10501,1,112,178,}},
			{s_copySummonNpc,{10501,1,112,168,}},
			{s_copySummonNpc,{10501,1,112,158,}},
			{s_copySummonNpc,{10501,1,112,148,}},

			{s_copySummonNpc,{10501,1,104,188,}},
			{s_copySummonNpc,{10501,1,104,178,}},
			{s_copySummonNpc,{10501,1,104,168,}},
			{s_copySummonNpc,{10501,1,104,158,}},
			{s_copySummonNpc,{10501,1,104,148,}},

			{s_copySummonNpc,{10501,1,81,188,}},
			{s_copySummonNpc,{10501,1,81,178,}},
			{s_copySummonNpc,{10501,1,81,168,}},
			{s_copySummonNpc,{10501,1,81,158,}},
			{s_copySummonNpc,{10501,1,81,148,}},

			{s_copySummonNpc,{10501,1,73,188,}},
			{s_copySummonNpc,{10501,1,73,178,}},
			{s_copySummonNpc,{10501,1,73,168,}},
			{s_copySummonNpc,{10501,1,73,158,}},
			{s_copySummonNpc,{10501,1,73,148,}},
			{s_copySummonNpcToKill,{10500,5,101,121,0,0,101,1,5}},
			{s_copyPlayClientLua,{301}},
			{s_copyAddTimer,{2,4}},

		},
	},

	timer_2 =
	{
		action =
		{
			--GM弹窗：
			{s_copyCopyInfo,{"击败5个神殿守卫，寻找主神。",8}},
		},
	},


	--副本变量改变时的操作
	--杀5个士兵的时候播放动画

	varchange_101_1_5 =
	{
		action =
		{
			{s_copyPlayClientLua,{302}},
			{s_copySummonNpc,{10502,1,93,63,}},	--召唤主神
			--GM弹窗：
			{s_copyCopyInfo,{"找到主神所在的平台！",8}},
			{s_copyZoneThree,{"找到主神所在的平台！"}},
		},
	},

	playerintozone_1 =
	{
		check =
		{
			{s_copycheckSceneVar,{101,1,5,100}},
		},
		action =
		{
			{s_copyPlayClientLua,{303}},--团长号召进攻主神
			{s_copyAddTimer,{3,25}},
			{s_copySetSceneVar,{101,1,2}},
			{s_copyCopyInfo,{"进攻主神！",8}},
			{s_copyZoneThree,{"进攻主神！"}},
		},
	},


	timer_3 =
	{
		action =
		{
			{s_copyPlayClientLua,{304}},
			{s_copyAddTimer,{4,18}},

		},
	},

	timer_4 =
	{
		action =
		{
			{s_copyClearCopy,{}},
		},
	},
}
