--命运房间

CopySceneInfo_48 = { }
--副本创建初始化
function CopySceneInfo_48:InitCopyScene(cid)
	s_setSceneVar(cid,0,100,10)
end
--玩家进入副本提示
function CopySceneInfo_48:OnPlayerIntoCopyScene(cid,uid)
	s_addVar(uid,101,3,0)
	local daynum = s_getVar(uid,101,24)
	s_addVar(uid,101,24,daynum+1)
	local weeknum = s_getVar(uid,101,25)
	s_addVar(uid,101,25,weeknum+1)
	RefreshTaskDailyInfo(uid, 30028)
	AddRoleTaskOperate(uid,4312)
	--活力点
	s_addVigorPoint(uid, 5)
	s_debugUser(uid,"完成一次命运，获得5点活力点")
	s_sysInfo(uid,"深邃的命运大厅隐藏着无尽的秘密和宝藏，每完成一层就可获得丰厚奖励。",ChatPos_Sys + ChatPos_Important)

	local level = s_getSceneVar(cid,0,1) + 1
	local game = s_getSceneVar(cid,0,4)
	s_sendCopyInfo(cid,level,0,CopySceneInfo_48:info(game))
end
--玩家离开副本
function CopySceneInfo_48:OnPlayerLeaveCopyScene(cid,uid)
	local master = s_getSceneVar(cid,100,100)
	if uid == master then
		local level = s_getSceneVar(cid,0,1)
		if s_getField(master,UserVar_CopyFate) < level then
			s_setField(master,UserVar_CopyFate,level)
		end
	end
end
--副本主循环
function OnLoopCopyScene_1Sec_48(ctype,cid)
	local init = s_getSceneVar(cid,0,100)
	if init > 0 then
		s_copyInfo(cid,"倒计时:" .. init)
		s_setSceneVar(cid,0,100,init - 1)
		if init == 1 then
			CopySceneInfo_48:init(cid,1)
		end
	end
	local wait = s_getSceneVar(cid,0,0)
	if wait > 0 then
		s_copyInfo(cid,"倒计时:" .. wait)
		s_setSceneVar(cid,0,0,wait - 1)
		return
	end
	--TeamCard:GetObject(cid):Loop()
	local level = s_getSceneVar(cid,0,1)
	local card = s_getSceneVar(cid,0,101)
	if card > 0 then
		s_copyInfo(cid,"进入下一层倒计时:" .. card ,ChatPos_Sys);
		if card == 1 then
			if level >= 12 then
				s_copyInfo(cid,"恭喜你们，达到了最后一关.",ChatPos_Sys + ChatPos_Important);
				CopySceneInfo_48:state(cid,3)
			else
				CopySceneInfo_48:init(cid,level+1)
			end
		end
		s_setSceneVar(cid,0,101,card - 1)
		return
	end
	local state = s_getSceneVar(cid,0,2)
	if state == 0 then		--初始化
		return
	elseif state == 1 then	--游戏中
		local ret = CopySceneInfo_48:check(ctype,cid,level+1)
		if ret == VALUE_OK then
			CopySceneInfo_48:state(cid,2)
		elseif ret == VALUE_FAIL then
			CopySceneInfo_48:state(cid,3)
		end
	elseif state == 2 then	--完成
		if CopySceneInfo_48:done(ctype,cid,level+1) == VALUE_OK then
			CopySceneInfo_48:state(cid,0)
	end
	elseif state == 3 then	--失败
		s_clearCopy(cid)
	end
end
--初始化关卡
function CopySceneInfo_48:init(cid,level)
	s_setSceneVar(cid,1,1,0)    --计数清零
	if level <= 3 then
		CopySceneInfo_48:start(cid,1)
	elseif level <= 6 then
		local game = math.random(1,100)
		if game <= 60 then
			CopySceneInfo_48:start(cid,1)
		else
			CopySceneInfo_48:start(cid,2)
		end
	elseif level <= 9 then
		local game = math.random(1,100)
		if game <= 35 then
			CopySceneInfo_48:start(cid,1)
		elseif game <= 75 then
			CopySceneInfo_48:start(cid,2)
		else
			CopySceneInfo_48:start(cid,3)
		end
	else
		local game = math.random(1,100)
		if game <= 20 then
			CopySceneInfo_48:start(cid,1)
		elseif game <= 60 then
			CopySceneInfo_48:start(cid,2)
		elseif game <= 85 then
			CopySceneInfo_48:start(cid,3)
		else
			CopySceneInfo_48:start(cid,4)
		end
	end
	CopySceneInfo_48:state(cid,1)
	s_setSceneVar(cid,0,3,s_getCurTime(TIME_ALLSECONDS))  --开始时间
	return VALUE_OK
end

--开始游戏关卡
function CopySceneInfo_48:start(cid,game)
	--game = 3 --TODO 调试

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
				{{22046,2,134,135},{22046,2,119,132},{22046,2,120,100},{22046,2,150,100},{22046,2,150,130}},
				{{22047,2,134,135},{22047,2,119,132},{22047,2,120,100},{22047,2,150,100},{22047,2,150,130}},
				{{22048,2,134,135},{22048,2,119,132},{22048,2,120,100},{22048,2,150,100},{22048,2,150,130}},
				{{22049,2,134,135},{22049,2,119,132},{22049,2,120,100},{22049,2,150,100},{22049,2,150,130}},
				{{22050,2,134,135},{22050,2,119,132},{22050,2,120,100},{22050,2,150,100},{22050,2,150,130}},
			}

	local dam = { 1, 1.15, 1.3, 1.45, 1.6, 1.75, 1.9, 2.05, 2.2, 2.35, 2.5, 2.65}
	local def = { 1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 2, 2.2, 2.4}
	local hp = { 1, 1.15, 1.3, 1.5, 1.7, 1.9, 2.3, 2.7, 3.1, 3.7, 4.3, 5.9}

	local which = math.random(1,5)
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
	time =180
	end
	if game == 2 then		--精英怪房间
		local monster =
			{
				{22141,1,134,117},{22142,1,134,117},{22143,1,134,117},{22144,1,134,117},{22145,1,134,117},
			}

	local dam = { 1,1,1, 1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8}
	local def = { 1, 1, 1, 1, 1.04, 1.08, 1.12, 1.16, 1.2, 1.25, 1.3, 1.35}
	local hp = {1,1,1, 1, 1.2, 1.4, 1.65, 1.9, 2.15, 2.5, 2.85, 3.2}

	local which = math.random(1,table.getn(monster))
	local baseid = monster[which][1]
	local num = monster[which][2]
	local posx = monster[which][3]
	local posy = monster[which][4]
	for i = 1,num do
		local npcid = s_sysSummon(baseid,cid,posx,posy)
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,math.floor((dam[level]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,103,math.floor((dam[level]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,math.floor((def[level]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,math.floor((hp[level]-1)*10000),10)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BONE_INTERVAL,1000)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_REBORN_INTERVAL,1000)
	end
	time = 180
	end
	if game == 3 then		--BOSS房间
		local monster =
			{
				{22230,1,134,117},{22231,1,134,117},
			}

	local dam = { 1,1,1,1,1,1, 1, 1.08, 1.16, 1.24, 1.32, 1.4}
	local def = { 1,1,1,1,1,1, 1, 1.05, 1.1, 1.15, 1.2, 1.25}
	local hp = { 1,1,1,1,1,1, 1, 1.2, 1.4, 1.7, 2, 2.3,}

	local which = math.random(1,table.getn(monster))
	local baseid = monster[which][1]
	local num = monster[which][2]
	local posx = monster[which][3]
	local posy = monster[which][4]
	for i = 1,num do
		local npcid = s_sysSummon(baseid,cid,posx,posy)
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,math.floor((dam[level]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,103,math.floor((dam[level]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,math.floor((def[level]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,math.floor((hp[level]-1)*10000),10)
	end
	time = 300
	end
	if game == 4 then		--终极BOSS房间
		local monster =
			{
				{22232,1,134,117},{22233,1,134,117}
			}

	local dam = {1,1,1,1,1,1,1,1,1,1,1.2,1.4}
	local def = {1,1,1,1,1,1,1,1,1,1,1.1,1.2}
	local hp = {1,1,1,1,1,1,1,1,1,1,1.2,1.4}

	local which = math.random(1,table.getn(monster))
	local baseid = monster[which][1]
	local num = monster[which][2]
	local posx = monster[which][3]
	local posy = monster[which][4]
	for i = 1,num do
		local npcid = s_sysSummon(baseid,cid,posx,posy)
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,math.floor((dam[level]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,103,math.floor((dam[level]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,math.floor((def[level]-1)*10000),10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,math.floor((hp[level]-1)*10000),10)
	end
	time = 300
	end
	s_setSceneVar(cid,0,4,game)
	s_sendCopyInfo(cid,level,time,CopySceneInfo_48:info(game))
	s_copyInfo(cid,"命运房间第" .. level .. "层开启");
end

--检查关卡完成
function CopySceneInfo_48:check(ctype,cid,level)
	local game = s_getSceneVar(cid,0,4)
	if game == 1 then --普通小怪房间
		local time = s_getSceneVar(cid,0,3)
		if s_getCurTime(TIME_ALLSECONDS) > time + 3 * 60 then
			s_copyInfo(cid,"任务失败,10秒钟后回收副本",ChatPos_Sys + ChatPos_Important);
			CopySceneInfo_48:wait(cid,10)
			return VALUE_FAIL
		end
		if s_getSceneVar(cid,1,1) >= 36 then
			s_copyInfo(cid,"LV" .. level .. "任务完成",ChatPos_Sys + ChatPos_Important);
			return VALUE_OK
		end
	end
	if game == 2 then --精英怪房间
		local time = s_getSceneVar(cid,0,3)
		if s_getCurTime(TIME_ALLSECONDS) > time + 3 * 60 then
			s_copyInfo(cid,"任务失败,10秒钟后回收副本",ChatPos_Sys + ChatPos_Important);
			CopySceneInfo_48:wait(cid,10)
			return VALUE_FAIL
		end
		if s_getSceneVar(cid,1,1) >= 6 then
			s_copyInfo(cid,"LV" .. level .. "任务完成",ChatPos_Sys + ChatPos_Important);
			return VALUE_OK
		end
	end
	if game == 3 then --BOSS房间
		local time = s_getSceneVar(cid,0,3)
		if s_getCurTime(TIME_ALLSECONDS) > time + 5 * 60 then
			s_copyInfo(cid,"任务失败,10秒钟后回收副本",ChatPos_Sys + ChatPos_Important);
			CopySceneInfo_48:wait(cid,10)
			return VALUE_FAIL
		end
		if s_getSceneVar(cid,1,1) > 0 then
			s_copyInfo(cid,"LV" .. level .. "任务完成",ChatPos_Sys + ChatPos_Important);
			return VALUE_OK
		end
	end
	if game == 4 then --终极BOSS房间
		local time = s_getSceneVar(cid,0,3)
		if s_getCurTime(TIME_ALLSECONDS) > time + 5 * 60 then
			s_copyInfo(cid,"任务失败,10秒钟后回收副本",ChatPos_Sys + ChatPos_Important);
			CopySceneInfo_48:wait(cid,10)
			return VALUE_FAIL
		end
		if s_getSceneVar(cid,1,1) > 0 then
			s_copyInfo(cid,"LV" .. level .. "任务完成",ChatPos_Sys + ChatPos_Important);
			return VALUE_OK
		end
	end
end
--完成奖励及回收
function CopySceneInfo_48:done(ctype,cid,level)
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
	s_sysSummon(22400,cid,134,117)
	--TeamCard:GetObject(cid):Start(list,TeamCard.fate40,game)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		--完成命运引导任务
		if level == 3 then
			AddRoleTaskOperate(list[i+1],13001)
		elseif level == 6 then
			AddRoleTaskOperate(list[i+1],13002)
		elseif level == 7 then
			AddRoleTaskOperate(list[i+1],13003)
		end
	end

	if level >= 12 then
		local master = s_getSceneVar(cid,100,100)
		local name = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
		local country = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELADN_NAME)
		if country ~= nil and name ~= nil then
			s_worldInfo("<p><n color=GXColorBlueSky>" .. country .. "的</n><q buttonid=6005 ownerid=" .. master .. ">" .. name .. "</q><n color=GXColorBlueSky>带领英勇的同伴，居然通过了命运大厅第"..level.."层！</n></p>",ChatPos_Sys + ChatPos_Honor)
		end
	end
	CopySceneInfo_48:levelup(cid)
	return VALUE_OK
end
-------------------------------------------------------------------------------
--游戏状态
function CopySceneInfo_48:state(cid,state)
	s_setSceneVar(cid,0,2,state)
end
--等待
function CopySceneInfo_48:wait(cid,time)
	s_setSceneVar(cid,0,0,time)
	return VALUE_OK
end
--下一关
function CopySceneInfo_48:levelup(cid)
	local level = s_getSceneVar(cid,0,1)
	s_setSceneVar(cid,0,1,level+1)
end
--过关提示
function CopySceneInfo_48:info(game)
	if game == 1 then
		return "请在3分钟内击败36只怪物"
	elseif game == 2 then
		return "请在3分钟内击败6只精英怪物"
	elseif game == 3 then
		return "请在5分钟内击败BOSS"
	elseif game == 4 then
		return "请在5分钟内击败终极BOSS"
	end
end
function CopySceneInfo_48:dead22046_22050(cid,thisid)
	local state = s_getSceneVar(cid,0,2)
	if state ~= 1 then
		return
	end
	local num = s_getSceneVar(cid,1,1)
	s_setSceneVar(cid,1,1,num+1)
	s_copyInfo(cid,"已杀死怪物:" .. num + 1 .. "/36",ChatPos_Sys + ChatPos_Important)
end
function CopySceneInfo_48:dead22141_22145(cid)
	local state = s_getSceneVar(cid,0,2)
	if state ~= 1 then
		return
	end
	local num = s_getSceneVar(cid,1,1)
	s_setSceneVar(cid,1,1,num+1)
	s_copyInfo(cid,"已杀死怪物:" .. num + 1 .. "/6",ChatPos_Sys + ChatPos_Important)
end
function CopySceneInfo_48:dead22230_22231(cid,thisid)
	local state = s_getSceneVar(cid,0,2)
	if state ~= 1 then
		return
	end
	s_setSceneVar(cid,1,1,1)
end
function CopySceneInfo_48:dead22232_22233(cid,thisid)
	local state = s_getSceneVar(cid,0,2)
	if state ~= 1 then
		return
	end
	s_setSceneVar(cid,1,1,1)
end

RegisterCopyNpcDeadEvent(22046,48,0,"CopySceneInfo_48:dead22046_22050($1,$2)")
RegisterCopyNpcDeadEvent(22047,48,0,"CopySceneInfo_48:dead22046_22050($1,$2)")
RegisterCopyNpcDeadEvent(22048,48,0,"CopySceneInfo_48:dead22046_22050($1,$2)")
RegisterCopyNpcDeadEvent(22049,48,0,"CopySceneInfo_48:dead22046_22050($1,$2)")
RegisterCopyNpcDeadEvent(22050,48,0,"CopySceneInfo_48:dead22046_22050($1,$2)")

RegisterCopyNpcDeadEvent(22141,48,0,"CopySceneInfo_48:dead22141_22145($1,$2)")
RegisterCopyNpcDeadEvent(22142,48,0,"CopySceneInfo_48:dead22141_22145($1,$2)")
RegisterCopyNpcDeadEvent(22143,48,0,"CopySceneInfo_48:dead22141_22145($1,$2)")
RegisterCopyNpcDeadEvent(22144,48,0,"CopySceneInfo_48:dead22141_22145($1,$2)")
RegisterCopyNpcDeadEvent(22145,48,0,"CopySceneInfo_48:dead22141_22145($1,$2)")

RegisterCopyNpcDeadEvent(22230,48,0,"CopySceneInfo_48:dead22230_22231($1,$2)")
RegisterCopyNpcDeadEvent(22231,48,0,"CopySceneInfo_48:dead22230_22231($1,$2)")

RegisterCopyNpcDeadEvent(22232,48,0,"CopySceneInfo_48:dead22232_22233($1,$2)")
RegisterCopyNpcDeadEvent(22233,48,0,"CopySceneInfo_48:dead22232_22233($1,$2)")

--增加命运大厅副本的排队
s_createQueueOneGroup(13,48,0,107,135,116,"命运大厅111级",6,0,100)
