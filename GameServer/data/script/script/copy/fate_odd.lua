--命运房间

CopySceneInfo_40 = { }
--副本创建初始化
function CopySceneInfo_40:InitCopyScene(cid)
	s_setSceneVar(cid,0,100,10)
end
--玩家进入副本提示
function CopySceneInfo_40:OnPlayerIntoCopyScene(cid,uid)
	s_addVar(uid,101,3,0)
	local daynum = s_getVar(uid,101,24)
	s_addVar(uid,101,24,daynum+1)
	local weeknum = s_getVar(uid,101,25)
	s_addVar(uid,101,25,weeknum+1)
	RefreshTaskDailyInfo(uid, 30028)
	--AddRoleTaskOperate(uid,4312)
	--活力点
	s_addVigorPoint(uid, 5)
	s_debugUser(uid,"完成一次命运，获得5点活力点")
	local level = s_getSceneVar(cid,0,1) + 1
	local game = s_getSceneVar(cid,0,4)
	s_sendCopyInfo(cid,level,0,CopySceneInfo_40:info(game))
end
--玩家离开副本
function CopySceneInfo_40:OnPlayerLeaveCopyScene(cid,uid)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,32)	--移除倒计时buff
end
--销毁副本
function CopySceneInfo_40:FinalCopyScene(sid)
end
--副本主循环
function OnLoopCopyScene_1Sec_40(ctype,cid)
	local init = s_getSceneVar(cid,0,100)
	if init > 0 then
		s_copyInfo(cid,"倒计时:" .. init)
		s_setSceneVar(cid,0,100,init - 1)
		if init == 1 then
			CopySceneInfo_40:init(cid,1)
		end
	end
	local wait = s_getSceneVar(cid,0,0)
	if wait > 0 then
		s_copyInfo(cid,"倒计时:" .. wait)
		s_setSceneVar(cid,0,0,wait - 1)
		return
	end
	--    TeamCard:GetObject(cid):Loop()
	local level = s_getSceneVar(cid,0,1)
	local card = s_getSceneVar(cid,0,101)
	if card > 0 then
		s_copyInfo(cid,"倒计时:" .. card ,ChatPos_Sys);
		if card == 1 then
			if level >= 10 then
				CopySceneInfo_40:state(cid,3)
			else
				CopySceneInfo_40:init(cid,level+1)
			end
		end
		s_setSceneVar(cid,0,101,card - 1)
		return
	end
	local state = s_getSceneVar(cid,0,2)
	if state == 0 then		--初始化
		return
	elseif state == 1 then	--游戏中
		local ret = CopySceneInfo_40:check(ctype,cid,level+1)
		if ret == VALUE_OK then
			CopySceneInfo_40:state(cid,2)
		elseif ret == VALUE_FAIL then
			CopySceneInfo_40:state(cid,3)
		end
	elseif state == 2 then	--完成
		if CopySceneInfo_40:done(ctype,cid,level+1) == VALUE_OK then
			CopySceneInfo_40:state(cid,0)
	end
	elseif state == 3 then	--失败
		s_clearCopy(cid)
	end
end
--初始化关卡
function CopySceneInfo_40:init(cid,level)
	s_setSceneVar(cid,1,1,0)    --计数清零
	if level <= 3 then
		CopySceneInfo_40:start(cid,1)
	elseif level <= 7 then
		local game = math.random(1,100)
		if game <= 70 then
			CopySceneInfo_40:start(cid,1)
		else
			CopySceneInfo_40:start(cid,2)
		end
	else
		local game = math.random(1,100)
		if game <= 40 then
			CopySceneInfo_40:start(cid,1)
		else
			CopySceneInfo_40:start(cid,2)
		end
	end
	CopySceneInfo_40:state(cid,1)
	s_setSceneVar(cid,0,3,s_getCurTime(TIME_ALLSECONDS))	--开始时间
	return VALUE_OK
end

--开始游戏关卡
function CopySceneInfo_40:start(cid,game)
	--game = 1 --TODO 调试

	local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list), 2 do --清理NPC
		local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
		if baseid > 10000 then
			s_clearNpc(list[i+1])
		end
	end

	local time = 0
	local level = s_getSceneVar(cid,0,1) + 1

	if game == 1 then		--普通小怪房间
		local monster =
			{
				{{22000,1,134,135},{22000,1,119,132},{22000,1,120,100},{22000,1,150,100}},
				{{22001,1,134,135},{22001,1,119,132},{22001,1,120,100},{22001,1,150,100}},
				{{22002,1,134,135},{22002,1,119,132},{22002,1,120,100},{22002,1,150,100}},
				{{22003,1,134,135},{22003,1,119,132},{22003,1,120,100},{22003,1,150,100}},
				{{22004,1,134,135},{22004,1,119,132},{22004,1,120,100},{22004,1,150,100}},
				{{22005,1,134,135},{22005,1,119,132},{22005,1,120,100},{22005,1,150,100}},
				{{22006,1,134,135},{22006,1,119,132},{22006,1,120,100},{22006,1,150,100}},
				{{22007,1,134,135},{22007,1,119,132},{22007,1,120,100},{22007,1,150,100}},
				{{22008,1,134,135},{22008,1,119,132},{22008,1,120,100},{22008,1,150,100}},
				{{22009,1,134,135},{22009,1,119,132},{22009,1,120,100},{22009,1,150,100}},
			}

	local dam = {1,1.15,1.3,1.45,1.6,1.75,1.9,2.05,2.2,2.35,2.5,2.65}
	local def = {1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,2,2.2,2.4}
	local hp = {1,1.15,1.3,1.5,1.7,1.9,2.3,2.7,3.1,3.7,4.3,5.9}

	local which = math.random(level,math.min(level+2,10))
	for i = 1,table.getn(monster[which]) do
		local baseid = monster[which][i][1]
		local num = monster[which][i][2]
		local posx = monster[which][i][3]
		local posy = monster[which][i][4]
		for j = 1,num do
			local npcid = s_sysSummon(baseid,cid,posx,posy)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,math.floor((dam[level]-1)*10000),10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,103,math.floor((dam[level]-1)*10000),10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,104,math.floor((def[level]-1)*10000),10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,math.floor((hp[level]-1)*10000),10)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_REBORN_INTERVAL,0)
		end
	end
	time = 180
	end
	if game == 2 then		--精英怪房间
		local monster =
			{
				{22100,1,134,117},{22101,1,134,117},{22102,1,134,117},{22103,1,134,117},{22104,1,134,117},
			}

	local dam = {1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8}
	local def = {1,1.04,1.08,1.12,1.16,1.2,1.25,1.3,1.35}
	local hp = {1,1.2,1.4,1.65,1.9,2.15,2.5,2.85,3.2}

	local which = math.random(1,table.getn(monster))
	local baseid = monster[which][1]
	local num = monster[which][2]
	local posx = monster[which][3]
	local posy = monster[which][4]
	for i = 1,num do
		local npcid = s_sysSummon(baseid,cid,posx,posy)
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,math.floor((dam[level-3]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,103,math.floor((dam[level-3]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,math.floor((def[level-3]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,math.floor((hp[level-3]-1)*10000),10)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BONE_INTERVAL,1000)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_REBORN_INTERVAL,1000)
	end
	time = 180
	end
	s_setSceneVar(cid,0,4,game)
	s_sendCopyInfo(cid,level,time,CopySceneInfo_40:info(game))
	s_copyInfo(cid,"命运房间第" .. level .. "层开启");
end

--检查关卡完成
function CopySceneInfo_40:check(ctype,cid,level)
	local game = s_getSceneVar(cid,0,4)
	if game == 1 then --普通小怪房间
		local time = s_getSceneVar(cid,0,3)
		if s_getCurTime(TIME_ALLSECONDS) > time + 3 * 60 then
			s_copyInfo(cid,"任务失败,10秒钟后回收副本",ChatPos_Sys + ChatPos_Important);
			CopySceneInfo_40:wait(cid,10)
			return VALUE_FAIL
		end
		if s_getSceneVar(cid,1,1) >= 6 then
			s_copyInfo(cid,"LV" .. level .. "任务完成",ChatPos_Sys + ChatPos_Important);
			return VALUE_OK
		end
	end
	if game == 2 then --精英怪房间
		local time = s_getSceneVar(cid,0,3)
		if s_getCurTime(TIME_ALLSECONDS) > time + 3 * 60 then
			s_copyInfo(cid,"任务失败,10秒钟后回收副本",ChatPos_Sys + ChatPos_Important);
			CopySceneInfo_40:wait(cid,10)
			return VALUE_FAIL
		end
		if s_getSceneVar(cid,1,1) >= 2 then
			s_copyInfo(cid,"LV" .. level .. "任务完成",ChatPos_Sys + ChatPos_Important);
			return VALUE_OK
		end
	end
end
--完成奖励及回收
function CopySceneInfo_40:done(ctype,cid,level)
	s_setSceneVar(cid,1,1,0)	--计数清零
	local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list), 2 do --清理NPC
		local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
		if baseid > 10000 then
			s_clearNpc(list[i+1])
		end
	end
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_relive(list[i],list[i+1])		--复活所有玩家
	end
	local game = s_getSceneVar(cid,0,4)
	--开始翻牌
	s_setSceneVar(cid,0,101,30)
	--	TeamCard:GetObject(cid):Start(list,TeamCard.fate20,game)
	s_sysSummon(22400,cid,134,117)

	CopySceneInfo_40:levelup(cid)
	return VALUE_OK
end
-------------------------------------------------------------------------------
--游戏状态
function CopySceneInfo_40:state(cid,state)
	s_setSceneVar(cid,0,2,state)
end
--等待
function CopySceneInfo_40:wait(cid,time)
	s_setSceneVar(cid,0,0,time)
	return VALUE_OK
end
--下一关
function CopySceneInfo_40:levelup(cid)
	local level = s_getSceneVar(cid,0,1)
	s_setSceneVar(cid,0,1,level+1)
end
--过关提示
function CopySceneInfo_40:info(game)
	if game == 1 then
		return "请在3分钟内击败6只怪物"
	elseif game == 2 then
		return "请在3分钟内击败2只精英怪物"
	end
end
function CopySceneInfo_40:dead22000_22009(cid,thisid)
	local state = s_getSceneVar(cid,0,2)
	if state ~= 1 then
		return
	end
	local num = s_getSceneVar(cid,1,1)
	s_setSceneVar(cid,1,1,num+1)
	s_copyInfo(cid,"已杀死怪物:" .. num + 1 .. "/6",ChatPos_Sys + ChatPos_Important)
end
function CopySceneInfo_40:dead22100_22104(cid,thisid)
	local state = s_getSceneVar(cid,0,2)
	if state ~= 1 then
		return
	end
	local num = s_getSceneVar(cid,1,1)
	s_setSceneVar(cid,1,1,num+1)
	s_copyInfo(cid,"已杀死怪物:" .. num + 1 .. "/2",ChatPos_Sys + ChatPos_Important)
end
RegisterCopyNpcDeadEvent(22000,40,0,"CopySceneInfo_40:dead22000_22009($1,$2)")
RegisterCopyNpcDeadEvent(22001,40,0,"CopySceneInfo_40:dead22000_22009($1,$2)")
RegisterCopyNpcDeadEvent(22002,40,0,"CopySceneInfo_40:dead22000_22009($1,$2)")
RegisterCopyNpcDeadEvent(22003,40,0,"CopySceneInfo_40:dead22000_22009($1,$2)")
RegisterCopyNpcDeadEvent(22004,40,0,"CopySceneInfo_40:dead22000_22009($1,$2)")
RegisterCopyNpcDeadEvent(22005,40,0,"CopySceneInfo_40:dead22000_22009($1,$2)")
RegisterCopyNpcDeadEvent(22006,40,0,"CopySceneInfo_40:dead22000_22009($1,$2)")
RegisterCopyNpcDeadEvent(22007,40,0,"CopySceneInfo_40:dead22000_22009($1,$2)")
RegisterCopyNpcDeadEvent(22008,40,0,"CopySceneInfo_40:dead22000_22009($1,$2)")
RegisterCopyNpcDeadEvent(22009,40,0,"CopySceneInfo_40:dead22000_22009($1,$2)")

RegisterCopyNpcDeadEvent(22100,40,0,"CopySceneInfo_40:dead22100_22104($1,$2)")
RegisterCopyNpcDeadEvent(22101,40,0,"CopySceneInfo_40:dead22100_22104($1,$2)")
RegisterCopyNpcDeadEvent(22102,40,0,"CopySceneInfo_40:dead22100_22104($1,$2)")
RegisterCopyNpcDeadEvent(22103,40,0,"CopySceneInfo_40:dead22100_22104($1,$2)")
RegisterCopyNpcDeadEvent(22104,40,0,"CopySceneInfo_40:dead22100_22104($1,$2)")

