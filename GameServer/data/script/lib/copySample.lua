--[[

--副本样例
CopySceneInfo_XXXX = 
{
	--副本最大人数
	maxplayernum = 6,

	--副本存活时间：单位（秒）
	time = 30*60,

	--初始化副本的操作
	initcopy = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--玩家进入副本时的操作
	playerinto = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--玩家离开副本时的操作
	playerleave = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--玩家死亡时的操作
	playerdie = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--副本变量改变时的操作
	varchange_key1_key2_value1 = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},
	varchange_key1_key2_value2 = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	varchange_key3_key4_value1 = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},
	varchange_key3_key4_value2 = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--进入区域触发
	playerintozone_n = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--离开区域触发
	playerleavezone_n = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--Npc进入区域触发
	npcintozone_n_npcbaseid = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--Npc离开区域触发
	npcleavezone_n_npcbaseid = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--定时器触发
	timer_n = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--1秒循环做的操作
	1sec = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},

	--销毁副本时的操作
	finalcopy = 
	{
		check = 
		{
			{check1,{param1,param2,param3}},
			{check2,{param1,param2,param3}},
		},
		action = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
		actionnot = 
		{
			{action1,{param1,param2,param3}},
			{action2,{param1,param2,param3}},
		},
	},
}

--副本创建初始化 
function CopySceneInfo_XXXX:InitCopyScene(sid)
end

--玩家进入副本提示
function CopySceneInfo_XXXX:OnPlayerIntoCopyScene(sid,uid)
end

--玩家离开副本
function CopySceneInfo_XXXX:OnPlayerLeaveCopyScene(sid,uid)
end

--销毁副本
function CopySceneInfo_XXXX:FinalCopyScene(sid)
end

--玩家死亡 
function CopySceneInfo_XXXX:OnPlayerDie(sid,uid,murder,dtype)
end

--变量改变 
function CopySceneInfo_XXXX:OnCopySceneVarChange(sid, key1, key2, newvalue, oldvalue)
end

--玩家进入区域
function CopySceneInfo_XXXX:OnCopyScenePlayerIntoZone(sid, uid, zoneid)
end

--玩家离开区域
function CopySceneInfo_XXXX:OnCopyScenePlayerLeaveZone(sid, uid, zoneid)
end

--NPC进入区域
function CopySceneInfo_XXXX:OnCopySceneNpcIntoZone(sid, npcid, zoneid)
end

--NPC离开区域
function CopySceneInfo_XXXX:OnCopySceneNpcLeaveZone(sid, npcid, zoneid)
end

--定时器触发
function CopySceneInfo_XXXX:OnCopySceneTimer(sid, timerid)
end

--副本主循环
function CopySceneInfo_1Sec_XXXX(ctype,cid)
end

--副本向排队系统申请加人
function CopySceneInfo_XXXX:OnCopyRequestPlayer(sid,uid)
	local country = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_HOMELAND)
	if country == 0 then country = 0 end
	s_copyRequestPlayer(sid, 60, XXXX, country, maxplayernum, "副本XXXX目前进行到什么进程，邀请您加入，是否加入？", posx, posy)
end


--增加副本的排队
s_createQueueOneGroup(13,60,XXXX,11,142,150,"副本1001",CopySceneInfo_XXXX.maxplayernum,0,100)

]]--