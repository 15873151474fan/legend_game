--2012奥运活动足球训练副本
CopySceneInfo_1009 =
{
	--初始化副本的操作
	initcopy =
	{
		action =
		{
			{s_copySetLifeTime,{900}},
			{s_copySummonNpc,{22720,1,110,131,}},
			{s_copySummonNpc,{22721,1,100,143,}},
			{s_copySummonNpc,{22722,1,90,152,}},
			{s_copySummonNpc,{22723,1,100,118,}},
			{s_copySummonNpc,{22724,1,90,110,}},
			{s_copySetSceneVar,{1,1,0}},
		},
	},

	playerinto =
	{
		action =
		{
			{s_copyZoneOne,{"足球基础训练"}},
			{s_copyZoneTwo,{"                         目标：将5个足球踢入球门"}},
			{s_copyZoneThree,{"请打开技能界面（快捷键“V”），选择“生存”分页，学习“踢球”技能；使用该技能将场中的5个足球踢入球门即可完成训练"}},
			{s_copyTime,{900}},
		},
	},

	--副本变量改变时的操作
	varchange_1_1_1 =
	{
		action =
		{
			{s_copyZoneThree,{"成功踢入1个球，请再接再厉，将场上剩余的4个足球踢入球门！"}},
			--{s_copyAddItem,{31532,0,1,1,"1-1","足球训练"}},
			{s_copyAddRoleTaskOperate,{30294}},
		},
	},

	varchange_1_1_2 =
	{
		action =
		{
			{s_copyZoneThree,{"成功踢入2个球，请再接再厉，将场上剩余的3个足球踢入球门！"}},
			--{s_copyAddItem,{31532,0,1,1,"1-1","足球训练"}},
			{s_copyAddRoleTaskOperate,{30294}},
		},
	},

	varchange_1_1_3 =
	{
		action =
		{
			{s_copyZoneThree,{"成功踢入3个球，请再接再厉，将场上剩余的2个足球踢入球门！"}},
			--{s_copyAddItem,{31532,0,1,1,"1-1","足球训练"}},
			{s_copyAddRoleTaskOperate,{30294}},
		},
	},

	varchange_1_1_4 =
	{
		action =
		{
			{s_copyZoneThree,{"成功踢入4个球，请再接再厉，将场上剩余的1个足球踢入球门！"}},
			--{s_copyAddItem,{31532,0,1,1,"1-1","足球训练"}},
			{s_copyAddRoleTaskOperate,{30294}},
		},
	},

	varchange_1_1_5 =
	{
		action =
		{
			{s_copyZoneThree,{"成功踢入5个球，完成了本次训练！（10秒后自动离开副本）"}},
			--{s_copyAddItem,{31532,0,1,1,"1-1","足球训练"}},
			{s_copyAddRoleTaskOperate,{30294}},
			{s_copyAddTimer,{1,10}}
		},
	},

	npcintozone_1_22720 =
	{
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{22720}	},
			{s_copyAddBuff,{5044,1,10,0}},
		},
	},

	npcintozone_1_22721 =
	{
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{22721}	},
			{s_copyAddBuff,{5044,1,10,0}},
		},
	},

	npcintozone_1_22722 =
	{
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{22722}	},
			{s_copyAddBuff,{5044,1,10,0}},
		},
	},

	npcintozone_1_22723 =
	{
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{22723}	},
			{s_copyAddBuff,{5044,1,10,0}},
		},
	},

	npcintozone_1_22724 =
	{
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{22724}	},
			{s_copyAddBuff,{5044,1,10,0}},
		},
	},

	npcintozone_2_22720 =
	{
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{22720}	},
			{s_copyAddBuff,{5044,1,10,0}},
		},
	},

	npcintozone_2_22721 =
	{
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{22721}	},
			{s_copyAddBuff,{5044,1,10,0}},
		},
	},

	npcintozone_2_22722 =
	{
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{22722}	},
			{s_copyAddBuff,{5044,1,10,0}},
		},
	},

	npcintozone_2_22723 =
	{
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{22723}	},
			{s_copyAddBuff,{5044,1,10,0}},
		},
	},

	npcintozone_2_22724 =
	{
		action =
		{
			{s_copyAddSceneVar,{1,1,1}},
			{s_copyClearNpcByBaseID,{22724}	},
			{s_copyAddBuff,{5044,1,10,0}},
		},
	},

	timer_1 =
	{
		action =
		{
			{s_copyClearCopy,{}},
		},
	},

}
