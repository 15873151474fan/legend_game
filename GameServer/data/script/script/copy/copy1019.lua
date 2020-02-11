--副本
--101,1 副本完成条件
--101,2 倒计时显示
--101,3 客户端动画

CopySceneInfo_1019 =
{
	--初始化副本的操作
	npcnum = 4, --NPC数量
	initcopy =
	{
		action =
		{
			{s_copySetLifeTime,{600}},

			{s_copySummonNpc,{10015,1,117,99,}},
			{s_copySummonNpc,{10015,1,120,99,}},
			{s_copySummonNpc,{10015,1,124,99,}},

			{s_copySummonNpc,{10015,1,148,99,}},
			{s_copySummonNpc,{10015,1,145,99,}},
			{s_copySummonNpc,{10015,1,153,99,}},

			{s_copySummonNpc,{10015,1,117,88,}},
			{s_copySummonNpc,{10015,1,116,93,}},

			{s_copySummonNpc,{10015,1,117,77,}},
			{s_copySummonNpc,{10015,1,120,77,}},
			{s_copySummonNpc,{10015,1,124,77,}},

			{s_copySummonNpc,{10015,1,148,77,}},
			{s_copySummonNpc,{10015,1,145,77,}},
			{s_copySummonNpc,{10015,1,153,77,}},

			{s_copySummonNpc,{10015,1,137,68,}},
			{s_copySummonNpc,{10015,1,133,68,}},
			{s_copySummonNpc,{10015,1,129,68,}},

			{s_copySummonNpc,{10015,1,129,105,}},
			{s_copySummonNpc,{10015,1,134,105,}},
			{s_copySummonNpc,{10015,1,139,105,}},
			{s_copySummonNpc,{10015,1,143,105,}},

			--大蜘蛛
			{s_copySummonNpc,{10512,1,133,87,}},

			--宝箱
			{s_copySummonNpc,{10503,1,133,94,}},
			{s_copySummonNpc,{10503,1,126,87,}},
			{s_copySummonNpc,{10503,1,133,81,}},
			{s_copySummonNpc,{10503,1,139,87,}},
			{s_copySetSceneVar,{101,2,0}},
			{s_copySetSceneVar,{101,3,1}},


		},
	},

	playerinto =
	{
		action =
		{
			{s_copyTime,{600}},
			{s_copyZoneOne,{"蜘蛛的巢穴"}},
			{s_copyZoneTwo,{""}},
			{s_copyZoneThree,{"击碎四个宝箱后，30秒内将会被传送出副本！"}},
		},
	},

	--副本变量改变时的操作
	--杀两个宝箱的时候刷怪
	varchange_101_1_2 =
	{
		action =
		{
			{s_copySummonNpc,{10015,1,21,34,}},
			{s_copySummonNpc,{10015,1,18,37,}},
		},
	},
	--副本结束
	varchange_101_1_4 =
	{
		action =
		{
			{s_copySetSceneVar,{101,2,30}},
			{s_copyTime,{30}},
		--	{s_copyPlayClientLua,{110}},
		},
	},

	playerintozone_2 =
	{
		check =
		{
			{s_copycheckSceneVar,{101,3,1,1}},
		},
		action =
		{
			{s_copyPlayClientLua,{110}},
			{s_copySetSceneVar,{101,3,2}},
			--GM弹窗：
			{s_copyCopyInfo,{"快去寻找蜘蛛收藏的宝藏吧！",8}},
		},
	},
	playerintozone_3 =
	{
		check =
		{
			{s_copycheckSceneVar,{101,3,1,1}},
		},
		action =
		{
			{s_copyPlayClientLua,{44}},
			{s_copySetSceneVar,{101,3,2}},
		},
	},
	playerintozone_4 =
	{
		check =
		{
			{s_copycheckSceneVar,{101,3,1,1}},
		},
		action =
		{
			{s_copyPlayClientLua,{44}},
			{s_copySetSceneVar,{101,3,2}},
		},
	},
}

function OnLoopCopyScene_1Sec_1019(ctype,cid)
	local time = s_getSceneVar(cid,101,2)
	if s_getSceneVar(cid,101,1) == CopySceneInfo_1019.npcnum then
		if time > 0 then
			s_copyInfo(cid,"副本即将回收，倒计时".. time .."",ChatPos_Sys)
			s_setSceneVar(cid,101,2,time-1)
		else
			s_clearCopy(cid)
		end
	end
end

RegisterCopyNpcDeadEvent(10503,60,1019,"CopySceneInfo_1019:Dead_10503($1,$2)")

function CopySceneInfo_1019:Dead_10503(sid,thisid)
	local num = s_getSceneVar(sid,101,1)
	s_setSceneVar(sid,101,1,num+1)
	s_copyInfo(sid,"已杀死怪物:" .. num + 1 .. "/" .. CopySceneInfo_1019.npcnum .."",ChatPos_Sys)
	local posx = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_POSX)
	local posy = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_POSY)
	local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
	for i=1,2 do	--升级宝石
		s_addSceneItem(55158,1,cid,posx,posy,0,"1-1")
	end
	for i=1,2 do	--魔法币
		s_addSceneItem(55152,1,cid,posx,posy,0,"1-1")
	end
	for i=1,6 do	--绑银
		s_addSceneItem(4,20,cid,posx,posy,0,"1-1")
	end
	for i=1,2 do	--生命药（小）
		s_addSceneItem(23037,10,cid,posx,posy,0,"1-1")
	end
	for i=1,2 do	--魔力药（小）
		s_addSceneItem(23041,10,cid,posx,posy,0,"1-1")
	end
end

