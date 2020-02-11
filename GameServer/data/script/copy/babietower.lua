--命运房间
--//////////////////////////////////////////////////////////////////////////////////////////////
--副本场景变量定义
--0_100 开始倒计时
--0_101 开始时间
--0_102 今天已pass层数
--0_103 当前层数
--1-0	当前副本需要杀怪数
--1-1	当前副本杀怪计数
--1-2	进入副本的uid
CopySceneInfo_74 = { }
local bossInfo = { 0,0,0,0,0,0,0 }
--副本创建初始化
function CopySceneInfo_74:InitCopyScene(cid)
	s_setSceneVar(cid,0,100,15)
	s_setSceneVar(cid,0,101,s_getCurTime(TIME_ALLSECONDS))--开始时间
	s_setSceneVar(cid,0,104,0)
	s_setSceneVar(cid,1,3,0)
end
--玩家进入副本提示
function CopySceneInfo_74:OnPlayerIntoCopyScene(cid,uid)
	if s_getVar(uid,101,47) > 7 then
		s_setVar(uid,101,47,7)
	end
	local todayEnterNum = s_getVar(uid,101,47)
	local successPassWithoutFailNum = s_getVar(uid,101,49)
	if successPassWithoutFailNum == 0  then
		s_setVar(uid,101,49,successPassWithoutFailNum + 1)
		if todayEnterNum >=1 then
			s_setVar(uid,101,47,todayEnterNum - 1)
		end
	elseif successPassWithoutFailNum > 0 and successPassWithoutFailNum ~= 3 then
		s_setVar(uid,101,49,successPassWithoutFailNum + 1)
	else
		if todayEnterNum >=1 then
			s_setVar(uid,101,47,todayEnterNum - 1)
		end
	end
	s_setVar(uid,101,48,s_getCurTime(TIME_ALLDAYS))
	s_setSceneVar(cid,1,2,uid)
	local passLevel = s_getVar(uid,101,49)
	s_setSceneVar(cid,0,102,passLevel)
	local curLevel = s_getVar(uid,101,50) + 1
	s_setSceneVar(cid,0,103,curLevel)
	--s_copyInfo(cid,"curLevel = " .. s_getVar(uid,101,50)+1,ChatPos_Important + ChatPos_Sys)
	s_sendCopyInfo(cid,curLevel,317,CopySceneInfo_74:info(curLevel))
end
--玩家离开副本
function CopySceneInfo_74:OnPlayerLeaveCopyScene(cid,uid)
	initNumAndTime(uid)
	if s_getSceneVar(cid,0,2) ~= 2 then
		s_setVar(uid,101,49,3)
	end
end

--副本主循环
function OnLoopCopyScene_1Sec_74(ctype,cid)

	--s_copyInfo(cid,"level = " .. s_getVar(s_getSceneVar(cid,1,2),101,50) + 1,ChatPos_Important + ChatPos_Sys)
	local initTime = s_getSceneVar(cid,0,100)
	local level = s_getSceneVar(cid,0,103)
	local start = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,101)
	if initTime == 10 then
		s_copyInfo(cid,"当前挑战".. level .."层，挑战10秒后开始,请在5分钟内击败所有出现的怪物！",ChatPos_Important + ChatPos_Sys)
	end
	if initTime > 0 then
		if initTime <= 10 then
			s_copyInfo(cid,"倒计时:" .. initTime)
		end
		s_setSceneVar(cid,0,100,initTime - 1)
		if initTime == 1 then
			CopySceneInfo_74:init(cid,level)
		end
	end
	local wait = s_getSceneVar(cid,0,0)
	if wait > 0 then
		s_copyInfo(cid,"副本回收倒计时:" .. wait)
		s_setSceneVar(cid,0,0,wait - 1)
		return
	end

	if start == 4*60 then
		s_copyInfo(cid,"副本挑战时间还剩下1分钟，请抓紧时间！",ChatPos_Sys )
	end

	local state = s_getSceneVar(cid,0,2)
	if state == 0 then		--初始化
		return
	elseif state == 1 then	--游戏中
		local result = CopySceneInfo_74:check(ctype,cid,level)
		if result == VALUE_OK then
			CopySceneInfo_74:state(cid,2)
		elseif result == VALUE_FAIL then
			CopySceneInfo_74:state(cid,3)
		end
	elseif state == 2 then	--完成
		CopySceneInfo_74:done(ctype,cid,level)
		s_clearCopy(cid)
	elseif state == 3 then	--失败
		s_clearCopy(cid)
	end
end
--初始化关卡
function CopySceneInfo_74:init(cid,level)
	s_setSceneVar(cid,1,1,0)	--杀怪计数清零
	s_setSceneVar(cid,1,0,0)	--当前副本会刷出的总怪物数量清零
	CopySceneInfo_74:start(cid,level)
	if s_getSceneVar(cid,0,2) ~= 3 then
		CopySceneInfo_74:state(cid,1)
	end
	s_setSceneVar(cid,0,3,s_getCurTime(TIME_ALLSECONDS))
	return VALUE_OK
end

--开始游戏关卡
function CopySceneInfo_74:start(cid,level)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list), 2 do --清理NPC
		local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
		if baseid >= 26001 and  baseid <= 27000 then
			s_clearNpc(list[i+1])
		end
	end
	--[[
	示例
	--level 1
{
worldLevel = 4,	--该层预期通过人类进程
{
80,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
{20300, {2512,2512,2512,5071,5071,1805,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
{22000, {1,1,1,1,1,1,1}},
{22000, {1,1,1,1,1,1,1}},
},
{
10,
{22000, {1,1,1,1,1,1,1}},
{22000, {1,1,1,1,1,1,1}},
},
{
10,
{22000, {1,1,1,1,1,1,1}},
},
},
]]--
local monster =
	{
		--level 1
		{
			worldLevel = 4,	--该层预期通过人类进程
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26001, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 2
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26011, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 3
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26021, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 4
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26031, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 5
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26041, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				--小怪
				{26042, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26043, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26044, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26045, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 6
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26051, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 7
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26061, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 8
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26071, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 9
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26081, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 10
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26091, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				--小怪
				{26092, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26093, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26094, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26095, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 11
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26101, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				--小怪
				{26102, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26103, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 12
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26111, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				--小怪
				{26112, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26113, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 13
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26121, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				--小怪
				{26122, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26123, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 14
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26131, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				--小怪
				{26132, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26133, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 15
		{
			worldLevel = 4,
			{
				100,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26141, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				--小怪
				{26142, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26143, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26144, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
				{26145, {0,0,0,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
		},
		--level 16
		{
			worldLevel = 4,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26151, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26151, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26151, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26151, {0,0,0,0,0,0,20}},
			},
		},
		--level 17
		{
			worldLevel = 4,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26161, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26161, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26161, {20,0,0,0,0,0,0}},
			},
		},
		--level 18
		{
			worldLevel = 4,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26171, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26171, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26171, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26171, {0,0,0,0,0,0,20}},
			},
		},
		--level 19
		{
			worldLevel = 4,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26181, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26181, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26181, {20,0,0,0,0,0,0}},
			},
		},
		--level 20
		{
			--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			worldLevel = 4,	--该层预期通过人类进程
			{
				20,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26191, {0,0,10,10,0,0,0}},--忽视+反伤
			},
			{
				20,
				{26191, {20,0,0,0,0,20,0}},--重击+物减
			},
			{
				20,
				{26191, {20,0,0,0,0,0,20}},--重击+魔减
			},
			{
				20,
				{26191, {20,0,0,0,10,0,0}},--重击+闪避
			},
			{
				20,
				{26191, {20,20,0,0,0,0,0}},--重击+致命
			},
		},
		--level 21
		{
			worldLevel = 5,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26201, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26201, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26201, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26201, {0,0,0,0,0,0,20}},
			},
		},
		--level 22
		{
			worldLevel = 5,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26211, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26211, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26211, {20,0,0,0,0,0,0}},
			},
		},
		--level 23
		{
			worldLevel = 5,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26221, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26221, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26221, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26221, {0,0,0,0,0,0,20}},
			},
		},
		--level 24
		{
			worldLevel = 5,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26231, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26231, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26231, {20,0,0,0,0,0,0}},
			},
		},
		--level 25
		{
			--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			worldLevel = 5,	--该层预期通过人类进程
			{
				20,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26241, {0,0,10,10,0,0,0}},--忽视+反伤
			},
			{
				20,
				{26241, {20,0,0,0,0,20,0}},--重击+物减
			},
			{
				20,
				{26241, {20,0,0,0,0,0,20}},--重击+魔减
			},
			{
				20,
				{26241, {20,0,0,0,10,0,0}},--重击+闪避
			},
			{
				20,
				{26241, {20,20,0,0,0,0,0}},--重击+致命
			},
		},
		--level 26
		{
			worldLevel = 5,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26251, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26251, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26251, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26251, {0,0,0,0,0,0,20}},
			},
		},
		--level 27
		{
			worldLevel = 5,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26261, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26261, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26261, {20,0,0,0,0,0,0}},
			},
		},
		--level 28
		{
			worldLevel = 5,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26271, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26271, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26271, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26271, {0,0,0,0,0,0,20}},
			},
		},
		--level 29
		{
			worldLevel = 5,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26281, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26281, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26281, {20,0,0,0,0,0,0}},
			},
		},
		--level 30
		{
			--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			worldLevel = 5,	--该层预期通过人类进程
			{
				20,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26291, {0,0,10,10,0,0,0}},--忽视+反伤
			},
			{
				20,
				{26291, {20,0,0,0,0,20,0}},--重击+物减
			},
			{
				20,
				{26291, {20,0,0,0,0,0,20}},--重击+魔减
			},
			{
				20,
				{26291, {20,0,0,0,10,0,0}},--重击+闪避
			},
			{
				20,
				{26291, {20,20,0,0,0,0,0}},--重击+致命
			},
		},
		--level 31
		{
			worldLevel = 6,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26301, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26301, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26301, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26301, {0,0,0,0,0,0,20}},
			},
		},
		--level 32
		{
			worldLevel = 6,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26311, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26311, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26311, {20,0,0,0,0,0,0}},
			},
		},
		--level 33
		{
			worldLevel = 6,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26321, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26321, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26321, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26321, {0,0,0,0,0,0,20}},
			},
		},
		--level 34
		{
			worldLevel = 6,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26331, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26331, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26331, {20,0,0,0,0,0,0}},
			},
		},
		--level 35
		{
			--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			worldLevel = 6,	--该层预期通过人类进程
			{
				20,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26341, {0,0,10,10,0,0,0}},--忽视+反伤
			},
			{
				20,
				{26341, {20,0,0,0,0,20,0}},--重击+物减
			},
			{
				20,
				{26341, {20,0,0,0,0,0,20}},--重击+魔减
			},
			{
				20,
				{26341, {20,0,0,0,10,0,0}},--重击+闪避
			},
			{
				20,
				{26341, {20,20,0,0,0,0,0}},--重击+致命
			},
		},
		--level 36
		{
			worldLevel = 6,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26351, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26351, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26351, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26351, {0,0,0,0,0,0,20}},
			},
		},
		--level 37
		{
			worldLevel = 6,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26361, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26361, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26361, {20,0,0,0,0,0,0}},
			},
		},
		--level 38
		{
			worldLevel = 6,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26371, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26371, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26371, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26371, {0,0,0,0,0,0,20}},
			},
		},
		--level 39
		{
			worldLevel = 6,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26381, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26381, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26381, {20,0,0,0,0,0,0}},
			},
		},
		--level 40
		{
			--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			worldLevel = 6,	--该层预期通过人类进程
			{
				20,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26391, {0,0,10,10,0,0,0}},--忽视+反伤
			},
			{
				20,
				{26391, {20,0,0,0,0,20,0}},--重击+物减
			},
			{
				20,
				{26391, {20,0,0,0,0,0,20}},--重击+魔减
			},
			{
				20,
				{26391, {20,0,0,0,10,0,0}},--重击+闪避
			},
			{
				20,
				{26391, {20,20,0,0,0,0,0}},--重击+致命
			},
		},
		--level 41
		{
			worldLevel = 7,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26401, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26401, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26401, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26401, {0,0,0,0,0,0,20}},
			},
		},
		--level 42
		{
			worldLevel = 7,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26411, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26411, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26411, {20,0,0,0,0,0,0}},
			},
		},
		--level 43
		{
			worldLevel = 7,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26421, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26421, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26421, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26421, {0,0,0,0,0,0,20}},
			},
		},
		--level 44
		{
			worldLevel = 7,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26431, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26431, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26431, {20,0,0,0,0,0,0}},
			},
		},
		--level 45
		{
			--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			worldLevel = 7,	--该层预期通过人类进程
			{
				20,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26441, {0,0,10,10,0,0,0}},--忽视+反伤
			},
			{
				20,
				{26441, {20,0,0,0,0,20,0}},--重击+物减
			},
			{
				20,
				{26441, {20,0,0,0,0,0,20}},--重击+魔减
			},
			{
				20,
				{26441, {20,0,0,0,10,0,0}},--重击+闪避
			},
			{
				20,
				{26441, {20,20,0,0,0,0,0}},--重击+致命
			},
		},
		--level 46
		{
			worldLevel = 7,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26451, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26451, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26451, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26451, {0,0,0,0,0,0,20}},
			},
		},
		--level 47
		{
			worldLevel = 7,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26461, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26461, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26461, {20,0,0,0,0,0,0}},
			},
		},
		--level 48
		{
			worldLevel = 7,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26471, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26471, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26471, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26471, {0,0,0,0,0,0,20}},
			},
		},
		--level 49
		{
			worldLevel = 7,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26481, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26481, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26481, {20,0,0,0,0,0,0}},
			},
		},
		--level 50
		{
			--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			worldLevel = 7,	--该层预期通过人类进程
			{
				20,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26491, {0,0,10,10,0,0,0}},--忽视+反伤
			},
			{
				20,
				{26491, {20,0,0,0,0,20,0}},--重击+物减
			},
			{
				20,
				{26491, {20,0,0,0,0,0,20}},--重击+魔减
			},
			{
				20,
				{26491, {20,0,0,0,10,0,0}},--重击+闪避
			},
			{
				20,
				{26491, {20,20,0,0,0,0,0}},--重击+致命
			},
		},
		--level 51
		{
			worldLevel = 8,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26501, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26501, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26501, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26501, {0,0,0,0,0,0,20}},
			},
		},
		--level 52
		{
			worldLevel = 8,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26511, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26511, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26511, {20,0,0,0,0,0,0}},
			},
		},
		--level 53
		{
			worldLevel = 8,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26521, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26521, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26521, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26521, {0,0,0,0,0,0,20}},
			},
		},
		--level 54
		{
			worldLevel = 8,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26531, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26531, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26531, {20,0,0,0,0,0,0}},
			},
		},
		--level 55
		{
			--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			worldLevel = 8,	--该层预期通过人类进程
			{
				20,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26541, {0,0,10,10,0,0,0}},--忽视+反伤
			},
			{
				20,
				{26541, {20,0,0,0,0,20,0}},--重击+物减
			},
			{
				20,
				{26541, {20,0,0,0,0,0,20}},--重击+魔减
			},
			{
				20,
				{26541, {20,0,0,0,10,0,0}},--重击+闪避
			},
			{
				20,
				{26541, {20,20,0,0,0,0,0}},--重击+致命
			},
		},
		--level 56
		{
			worldLevel = 8,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26551, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26551, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26551, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26551, {0,0,0,0,0,0,20}},
			},
		},
		--level 57
		{
			worldLevel = 8,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26561, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26561, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26561, {20,0,0,0,0,0,0}},
			},
		},
		--level 58
		{
			worldLevel = 8,	--该层预期通过人类进程
			{
				25,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26571, {0,0,0,10,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				25,
				{26571, {0,0,0,0,10,0,0}},
			},
			{
				25,
				{26571, {0,0,0,0,0,20,0}},
			},
			{
				25,
				{26571, {0,0,0,0,0,0,20}},
			},
		},
		--level 59
		{
			worldLevel = 8,	--该层预期通过人类进程
			{
				35,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26581, {0,0,10,0,0,0,0}},--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			},
			{
				35,
				{26581, {0,20,0,0,0,0,0}},
			},
			{
				30,
				{26581, {20,0,0,0,0,0,0}},
			},
		},
		--level 60
		{
			--{怪物ID,{重击，致命，忽视，反伤，闪避，物减，魔减}}
			worldLevel = 8,	--该层预期通过人类进程
			{
				20,		--怪物刷新几率,这个大括号中的下列怪物共享这一刷新几率，如果随机到则一起出现
				{26591, {0,0,10,10,0,0,0}},--忽视+反伤
			},
			{
				20,
				{26591, {20,0,0,0,0,20,0}},--重击+物减
			},
			{
				20,
				{26591, {20,0,0,0,0,0,20}},--重击+魔减
			},
			{
				20,
				{26591, {20,0,0,0,10,0,0}},--重击+闪避
			},
			{
				20,
				{26591, {20,20,0,0,0,0,0}},--重击+致命
			},
		},
	}--结束括号

local worldlevel = s_getWorldLevel()
local rateFlag = 0
local select = math.random(1,100)
--测试
--s_copyInfo(cid,"随即选择的概率是" .. select)
--s_copyInfo(cid,"level:"..level.."")
if monster[level] == nil then
	s_debug("巴别塔怪物表格读取异常")
else
	for i=1,table.getn(monster[level]) do
		rateFlag = rateFlag + monster[level][i][1]
		if rateFlag > 100 then
			s_debug("怪物生成比例配置错误！")
		end
		if select <= rateFlag then
			local worldLevelDiff = monster[level].worldLevel - worldlevel
			--当前人类进程和当前塔层标记人类进程的差值
			for k=2,table.getn(monster[level][i]) do
				local bossid = monster[level][i][k][1]
				if bossid == nil then
					s_debug("巴别塔生成怪物ID:%u不存在!",bossid)
				else
					local npcid = s_sysSummon(bossid,cid,math.random(135 - k  ,135  + k),math.random(115 - k ,115 + k ))
					if (worldLevelDiff > 0) then
						local levelOrder = level % 10	--在以10层的同档中的相对位置
						local forceEnhanceRate = (worldLevelDiff*20) + (levelOrder*2)
						local defEnhanceRate = (worldLevelDiff*30) + (levelOrder*2)
						local hpEnhanceRate = (worldLevelDiff*40) + (levelOrder-1)*4
						local enhanceRate = forceEnhanceRate * 0.2
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,math.ceil(forceEnhanceRate*100,0),10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,103,math.ceil(enhanceRate*100,0),10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,104,math.ceil(defEnhanceRate*100,0),10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,math.ceil(hpEnhanceRate*100,0),10)
					end
					for j=1,7 do
						s_addbuff(SCENE_ENTRY_NPC,npcid,159+j,monster[level][i][k][2][j]*100,10)
						if monster[level][i][k][2][j] ~= 0 then
							bossInfo[j] = 1
						else
							bossInfo[j] = 0
						end
					end

					s_setSceneVar(cid,1,0,s_getSceneVar(cid,1,0)+1)	--召唤一个怪当前副本完成需要杀怪数加1
				end
			end
			break
		end
	end
end

if s_getSceneVar(cid,1,0) == 0 or s_getSceneVar(cid,1,0) == nil then
	s_debug("怪物生成错误！")
	s_sendCopyInfo(cid,level,300,CopySceneInfo_74:info(level))
	s_copyInfo(cid,"抱歉,由于数据读取错误，巴别塔第" .. level .. "层开启失败！")
	s_setSceneVar(cid,0,2,3)
end
s_sendCopyInfo(cid,level,300,CopySceneInfo_74:bossMsg(level))
end

function CopySceneInfo_74:check(ctype,cid,level)
local time = s_getSceneVar(cid,0,101)
if s_getCurTime(TIME_ALLSECONDS) > (time + 317) or s_isDead(s_getSceneVar(cid,1,2)) == VALUE_OK then
	s_copyInfo(cid,"很不幸您被BOSS击败了，请再接再厉，来日再战！60秒钟后回收副本，失败奖励将会邮寄到您的邮箱，请注意查收！",ChatPos_Sys + ChatPos_Important);
	s_setVar(s_getSceneVar(cid,1,2),101,49,3)
	CopySceneInfo_74:failRward(ctype,cid,level) --失败奖励
	--s_sysSummon(60969,cid,134,127)
	CopySceneInfo_74:wait(cid,60)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list), 2 do --清理NPC
		local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
		if baseid >= 26001 and baseid <= 27000 then
			s_clearNpc(list[i+1])
		end
	end
	return VALUE_FAIL
end
if s_getSceneVar(cid,1,0) == s_getSceneVar(cid,1,1)  and s_getCurTime(TIME_ALLSECONDS) <= time + 317 and s_getCurTime(TIME_ALLSECONDS) >= time + 5 then
	s_setVar(s_getSceneVar(cid,1,2),101,50,level)
	s_sysSummon(60968,cid,135,117) --召唤胜利宝箱
	--挑战成功发经验
	local exp = math.floor((90+3*level)*(50+0.1*(60+level)^2.2))
	s_copyInfo(cid,"LV" .. level .. "层挑战成功！获得"..exp.."点经验奖励！打开胜利宝箱可获得道具奖励！",ChatPos_Important + ChatPos_Sys);
	s_refreshExp(s_getSceneVar(cid,1,2),exp,ExpType_Babyloncopy,0)
	s_updateBaBieTower(s_getSceneVar(cid,1,2),level)
	CopySceneInfo_74:wait(cid,60)
	return VALUE_OK
end
end

function CopySceneInfo_74:done(ctype,cid,level)
s_setSceneVar(cid,1,1,0)	--玩家杀死的怪物计数清零
local todayPassedLevel = s_getSceneVar(cid,0,102)
local curPassLevel = s_getSceneVar(cid,0,103)

local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
for i = 1,table.getn(list), 2 do --清理NPC
	local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
	if baseid >= 26001 and baseid <= 27000 then
		s_clearNpc(list[i+1])
	end
end

--如果是首次通过的玩家，加排行榜相关的处理
CopySceneInfo_74:levelup(cid)
return VALUE_OK
end
----------------------------------------------------------------------------------------------------------
--游戏状态
function CopySceneInfo_74:state(cid,state)
s_setSceneVar(cid,0,2,state)
end
--等待
function CopySceneInfo_74:wait(cid,time)
s_setSceneVar(cid,0,0,time)
return VALUE_OK
end
--下一层
function CopySceneInfo_74:levelup(cid)
local level = s_getSceneVar(cid,0,103)
s_setSceneVar(cid,0,1,level+1)
end
--过关提示
function CopySceneInfo_74:info(level)
local msg = ""
--5层，10-15层
local floorlevel = {5,10,11,12,13,14,15}
for i = 1,table.getn(floorlevel) do
	if floorlevel[i] == level then
		msg = "优先杀死小怪，降低怪物对自己的伤害量"
	end
end
--攻击层数
local list = {17,19,22,24,27,29,32,34,37,39,42,44,47,49,52,54,57,59}
for i = 1,table.getn(list) do
	if list[i] == level then
		msg = "BOSS随机拥有攻击型灵魂属性"
	end
end
--防御层数
local list = {16,18,21,23,26,28,31,33,36,38,41,43,46,48,51,53,56,58}
for i = 1,table.getn(list) do
	if list[i] == level then
		msg = "BOSS随机拥有防御型灵魂属性"
	end
end
--20-100双属性层文字
local list = {20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100}
for i = 1,table.getn(list) do
	if list[i] == level then
		msg = "BOSS随机拥有双灵魂属性"
	end
end
return msg
end

--怪物属性描述 重击，致命，忽视，反伤，闪避，物减，魔减
function CopySceneInfo_74:bossMsg(level)
local msg = CopySceneInfo_74:info(level)
local attribute = ""
for i=1,7 do
	attribute = attribute .. bossInfo[i]
end
if level > 15 then
	if attribute == "0011000" then
		msg = msg .. "，拥有忽视与反伤能力，考验生命力。"
	elseif attribute == "1000010" then
		msg = msg .. "，伤害较高，物理抗性较高，考验物理输出。"
	elseif attribute == "1000001" then
		msg = msg .. "，伤害较高，魔法抗性较高，考验魔法输出。"
	elseif attribute == "1000100" then
		msg = msg .. "，物理、魔防抗性较高，考验攻击力。"
	elseif attribute == "1100000" then
		msg = msg .. "，拥有超高伤害，考验生存能力。"
	elseif attribute == "1000000" then --重击
		msg = msg .. "，拥有高重击能力，考验生命力。"
	elseif attribute == "0100000" then --致命
		msg = msg .. "，拥有高致命能力，考验防御力。"
	elseif attribute == "0010000" then
		msg = msg .. "，拥有高忽视能力，考验生命力。"
	elseif attribute == "0001000" then
		msg = msg .. "，拥有高反伤能力，考验生命力。"
	elseif attribute == "0000100" then
		msg = msg .. "，拥有高闪避能力，考验攻击力。"
	elseif attribute == "0000010" then
		msg = msg .. "，拥有物理抗性，考验物理输出。"
	elseif attribute == "0000001" then
		msg = msg .. "，拥有魔法抗性，考验魔法输出。"
	end
end
return msg
end

function CopySceneInfo_74:npcdead(cid,thisid)
local state = s_getSceneVar(cid,0,2)
if state ~= 1 then
	return
end
local num = s_getSceneVar(cid,1,1)
s_setSceneVar(cid,1,1,num+1)
s_copyInfo(cid,"已杀死怪物:" .. num + 1 .. "/" .. s_getSceneVar(cid,1,0),ChatPos_Sys + ChatPos_Important)
end

for i=26001,26991 do
RegisterCopyNpcDeadEvent(i,74,0,"CopySceneInfo_74:npcdead($1,$2)")
end

--失败奖励
function CopySceneInfo_74:failRward(ctype,cid,level)
local owner = s_getSceneVar(cid,1,2)
--s_sysMail(owner,"挑战巴比伦塔失败奖励",0,26102,2,"1-1")
--s_sysMail(owner,"挑战巴比伦塔失败奖励",0,23033,10,"1-1")
end

--成功奖励
function CopySceneInfo_74:dead60968(cid,thisid)
if s_getSceneVar(cid,0,102) < 3 or s_getVar(s_getSceneVar(cid,1,2),101,47) then
	s_sysSummon(60967,cid,135,125)
end
local copylevel = s_getSceneVar(cid,0,103)
local posx= s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_POSX)
local posy = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_POSY)
local num = 5 + math.floor((copylevel-1)/5)
for i=1,num do	--声望券
	s_addSceneItem(8,1,cid,posx,posy,0,"1-1")
end
--s_copyInfo(cid,"声望券个数："..num.."")
for i=1,2 do	--重铸材料
	s_addSceneItem(26104,1,cid,posx,posy,0,"1-1")
end
if copylevel > 10 then
	s_addSceneItem(math.random(26115,26117),1,cid,posx,posy,0,"1-1")
end
end

function CopySceneInfo_74:dead60969(cid,thisid)
local level = s_getSceneVar(cid,0,103)
end

RegisterCopyNpcDeadEvent(60968,74,0,"CopySceneInfo_74:dead60968($1,$2)")
RegisterCopyNpcDeadEvent(60969,74,0,"CopySceneInfo_74:dead60969($1,$2)")

