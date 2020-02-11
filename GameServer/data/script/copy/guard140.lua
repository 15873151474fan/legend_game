--要塞守卫

CopySceneInfo_28 = { }

--副本创建初始化
function CopySceneInfo_28:InitCopyScene(cid)
	s_setSceneVar(cid,0,0,10)
	local npcid = s_sysSummon(144,cid,43,212)
	s_addbuff(SCENE_ENTRY_NPC,npcid,31,1,60*60)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_REBORN_INTERVAL,60*60*1000)
	s_setSceneVar(cid,0,100,npcid) --保卫npcid

	npcid = s_sysSummon(145,cid,45,54)
	s_setSceneVar(cid,0,101,npcid) --左1
	npcid = s_sysSummon(146,cid,39,109)
	s_setSceneVar(cid,0,102,npcid) --左2
	npcid = s_sysSummon(147,cid,27,182)
	s_setSceneVar(cid,0,103,npcid) --左3

	npcid = s_sysSummon(148,cid,202,221)
	s_setSceneVar(cid,0,104,npcid) --右1
	npcid = s_sysSummon(149,cid,149,221)
	s_setSceneVar(cid,0,105,npcid) --右2
	npcid = s_sysSummon(150,cid,73,230)
	s_setSceneVar(cid,0,106,npcid) --右3

	local cur_time = s_getCurTime(TIME_ALLSECONDS)
	s_setSceneVar(cid,0,200,cur_time)
end

function CopySceneInfo_28:OnPlayerIntoCopyScene(cid,uid)
	AddRoleTaskOperate(uid,1624)
	s_addVar(uid,101,20,0) --经验清零
	s_addVar(uid,101,21,0) --积分清零
	if s_getSceneVar(cid,100,101) == 0 then
		local daynum = s_getVar(uid,101,26)
		s_addVar(uid,101,26,daynum+1)
		local weeknum = s_getVar(uid,101,23)
		s_addVar(uid,101,23,weeknum+1)
		RefreshTaskDailyInfo(uid, 30033)
	end
	s_goto(SCENE_ENTRY_PLAYER,uid,50,50)
	s_sysInfo(uid,"团结起来抵御汹涌而来的怪物袭击",ChatPos_Sys + ChatPos_Important)
	s_sysInfo(uid,"每坚持5秒钟就能获得经验奖励，坚持的时间越长经验越多。",ChatPos_Sys + ChatPos_Important)
	s_sysInfo(uid,"击败强大的BOSS还能获得额外宝箱奖励。努力战斗吧！",ChatPos_Sys + ChatPos_Important)
end
function CopySceneInfo_28:OnPlayerLeaveCopyScene(cid,uid)
	local exp = s_getVar(uid,101,20)
	if exp ~= 0 then
		s_refreshExp(uid,exp,ExpType_GuardCopy,60)
		s_addVar(uid,101,20,0)
	end
	s_removebuff(SCENE_ENTRY_PLAYER,uid,54)
	local master = s_getSceneVar(cid,100,100)
	if master == uid then
		local cur_time = s_getCurTime(TIME_ALLSECONDS)
		local starttime = s_getSceneVar(cid,0,200)
		if cur_time > starttime then
			s_setField(master,UserVar_CopyGuard,cur_time - starttime)
		end
	end
end

function OnUseGuardCopyItemEvent_28(uid,itemid,value)
	local score = s_getVar(uid,101,21)
	if itemid == 29501 and score >= 20 then --女武神之吻
		s_addVar(uid,101,21,score - 20)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,31051,30,60)
	end
	if itemid == 29502 and score >= 25 then --女武神之吻
		s_addVar(uid,101,21,score - 25)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,31052,60,60)
	end
	if itemid == 29503 and score >= 30 then --女武神之吻
		s_addVar(uid,101,21,score - 30)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,31053,90,60)
	end
	if itemid == 29504 and score >= 35 then --女武神之吻
		s_addVar(uid,101,21,score - 35)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,31054,120,60)
	end
	if itemid == 29505 and score >= 40 then --女武神之吻
		s_addVar(uid,101,21,score - 40)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,31055,150,60)
	end
	if itemid == 29506 and score >= 10 then --雷神之怒
		s_addVar(uid,101,21,score - 10)
		local victim = {}
		local list = s_getNineEntry(SCENE_ENTRY_PLAYER,uid,10)
		for i = 1,table.getn(list), 2 do
			if list[i] ~= SCENE_ENTRY_PLAYER or list[i+1] ~= uid then
				if s_checkPK(1,SCENE_ENTRY_PLAYER,uid,list[i],list[i+1]) == VALUE_OK then
					local hp = s_getValue(list[i],list[i+1],VALUE_TYPE_HP)
					table.insert(victim,list[i])
					table.insert(victim,list[i+1])
					table.insert(victim,3000)
				end
			end
		end
		DirectAttack(5502,SCENE_ENTRY_PLAYER,uid,unpack(victim))
	end
	if itemid == 29507 and score >= 20 then --嘲讽号角
		s_addVar(uid,101,21,score - 40)
		local list = s_getNineEntry(SCENE_ENTRY_PLAYER,uid,5)
		for i = 1,table.getn(list), 2 do
			if list[i] == SCENE_ENTRY_NPC then
				if s_checkPK(10108,SCENE_ENTRY_PLAYER,uid,list[i],list[i+1]) == VALUE_OK then
					s_setEnemyEnmity(list[i+1],SCENE_ENTRY_PLAYER,uid,-1)
					s_setEnemy(list[i+1],SCENE_ENTRY_PLAYER,uid)
				end
			end
		end
		ShowAttack(10108,SCENE_ENTRY_PLAYER,uid,SCENE_ENTRY_PLAYER,uid)
	end
	if itemid == 29507 and score >= 50 then --月神守护
		s_addVar(uid,101,21,score - 50)
		local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
		local npcid = s_getSceneVar(cid,0,100) --保卫npcid
		local curhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
		local maxhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
		if curhp < maxhp then
			s_addValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP,maxhp * 0.05)
		end
		ShowAttack(10604,SCENE_ENTRY_PLAYER,uid,SCENE_ENTRY_NPC,npcid)
	end
	if itemid == 29509 and score >= 20 then --巨人枷锁
		s_addVar(uid,101,21,score - 20)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,10307,50,60)
	end
	if itemid == 29510 and score >= 15 then --光神羽翼
		s_addVar(uid,101,21,score - 15)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,10205,50,60)
	end
	if itemid == 29510 and score >= 10 then --空间密钥
		s_addVar(uid,101,21,score - 10)
		local x = math.floor(value/ (2^16))
		local y = value % (2^16)
		s_goto(SCENE_ENTRY_PLAYER,uid,x,y)
	end
	CopySceneInfo_28:refreshScore(uid)
end

function OnLoopCopyScene_1Sec_28(ctype,cid)
	local begin = s_getSceneVar(cid,0,0)
	if begin > 0 then
		s_copyInfo(cid,"倒计时:" .. begin)
		s_setSceneVar(cid,0,0,begin- 1)
		s_setSceneVar(cid,0,1,s_getCurTime(TIME_ALLSECONDS)- 2)  --开始时间
		if begin == 1 then
			CopySceneInfo_28:createMonster(cid,0)
		end
		return
	end
	local pass = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,1)
	if pass % 60 == 0 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			s_addVar(list[i+1],101,21,s_getVar(list[i+1],101,21) + 10 + pass / 120)
			CopySceneInfo_28:refreshScore(uid)
		end

		local turn = pass / 60
		if turn < 30 then
			CopySceneInfo_28:createMonster(cid,turn)
		end
		if turn <= 35 then
			local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
			for i = 1,table.getn(list), 2 do
				local level = s_getValue(list[i],list[i+1],VALUE_TYPE_LEVEL)
				local n = math.floor(pass / 60 )
				local exp = (2.5+0.06*(n^1.5))*(30+level^1.5)
				s_addVar(list[i+1],101,20,s_getVar(list[i+1],101,20)+ exp)
				CopySceneInfo_28:refreshScore(list[i+1])
			end
			if turn == 30 then
				local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
				for i = 1,table.getn(list), 2 do
					local level = s_getValue(list[i],list[i+1],VALUE_TYPE_LEVEL)
					local exp = 60 * level^1.5
					s_addVar(list[i+1],101,20,s_getVar(list[i+1],101,20)+ exp)
				end
			end
		end
	end
	if pass == 25 * 60 then
		local master = s_getSceneVar(cid,100,100)
		local name = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
		local country = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELADN_NAME)
		if country ~= nil and name ~= nil then
			s_worldInfo(country .."的".. name .. "带领英勇的同伴，已经在要塞守卫的战场上奋战超过25分钟啦！",ChatPos_Sys + ChatPos_Honor)
		end
	end
	--坚挺完成引导任务
	if pass == 5 * 60 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			AddRoleTaskOperate(list[i+1],13011)
		end
	end
	if pass == 10 * 60 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			AddRoleTaskOperate(list[i+1],13012)
			AddRoleTaskOperate(list[i+1],13013)
		end
	end

	--成就
	if pass == 20 * 60 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			AddAchieveTaskOperate(list[i+1],40012,1)
		end
	end
	if s_getSceneVar(cid,0,2) == 0 then
		CopySceneInfo_28:checkOver(cid)
	end
end

function CopySceneInfo_28:checkOver(cid)
	--检查是否通关
	local cur_time = s_getCurTime(TIME_ALLSECONDS)
	local starttime = s_getSceneVar(cid,0,200)
	if cur_time > starttime + 35 * 60 then
		s_setSceneVar(cid,0,2,1)
		local master = s_getSceneVar(cid,100,100)
		local name = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
		local country = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELADN_NAME)
		if country ~= nil and name ~= nil then
			s_worldInfo(country .."的".. name .. "带领英勇的同伴，成功的守住了要塞雕像,要塞守卫完美通关",ChatPos_Sys + ChatPos_Honor)
		end
		s_clearCopy(cid)
		return VALUE_OK
	end

	--检查是否守卫被打死
	local guardid = s_getSceneVar(cid,0,100)
	if s_getValue(SCENE_ENTRY_NPC,guardid,VALUE_TYPE_HP) ~= 0 then
		return VALUE_OK
	end
	local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list), 2 do --清理NPC
		local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
		if baseid > 10000 then
			s_clearNpc(list[i+1])
		end
	end
	s_clearCopy(cid)

	s_setSceneVar(cid,0,2,1)
	s_copyInfo(cid,"抵抗军雕像被击毁，守卫战失败",ChatPos_Sys + ChatPos_Important);
	return VALUE_FAIL
end

function CopySceneInfo_28:jumpTarget(baseid,uid)

	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	if baseid == 145 then
		local npcid = s_getSceneVar(cid,0,104)
		if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
			npcid = s_getSceneVar(cid,0,105)
			if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
				npcid = s_getSceneVar(cid,0,106)
				if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
					s_sysInfo(uid,"守卫已经阵亡，无法跳转",ChatPos_Sys + ChatPos_Important)
					return
				end
			end
		end
		local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
		return
	end
	if baseid == 146 then
		local npcid = s_getSceneVar(cid,0,105)
		if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
			npcid = s_getSceneVar(cid,0,106)
			if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
				s_sysInfo(uid,"守卫已经阵亡，无法跳转",ChatPos_Sys + ChatPos_Important)
				return
			end
		end
		local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
		return
	end
	if baseid == 147 then
		local npcid = s_getSceneVar(cid,0,106)
		if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
			s_sysInfo(uid,"守卫已经阵亡，无法跳转",ChatPos_Sys + ChatPos_Important)
			return
		end
		local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
		return
	end
	if baseid == 148 then
		local npcid = s_getSceneVar(cid,0,101)
		if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
			npcid = s_getSceneVar(cid,0,102)
			if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
				npcid = s_getSceneVar(cid,0,103)
				if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
					s_sysInfo(uid,"守卫已经阵亡，无法跳转",ChatPos_Sys + ChatPos_Important)
					return
				end
			end
		end
		local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
		return
	end
	if baseid == 149 then
		local npcid = s_getSceneVar(cid,0,102)
		if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
			npcid = s_getSceneVar(cid,0,103)
			if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
				s_sysInfo(uid,"守卫已经阵亡，无法跳转",ChatPos_Sys + ChatPos_Important)
				return
			end
		end
		local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
		return
	end
	if baseid == 150 then
		local npcid = s_getSceneVar(cid,0,103)
		if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == nil then
			s_sysInfo(uid,"守卫已经阵亡，无法跳转",ChatPos_Sys + ChatPos_Important)
			return
		end
		local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
		return
	end
end

function CopySceneInfo_28:initMonster(cid,data)
	local POSITION = { {40,20}, {233,25}, {230,224} }

	for index = 0,table.getn(data)/3-1 do
		for i = 1,data[index*3+3] do
			local pos_index = data[index*3+2]
			local posx = POSITION[pos_index][1]
			local posy = POSITION[pos_index][2]
			local npcid = s_sysSummon(data[index*3+1],cid,posx,posy)
			local BOSS = {23104,23110, 23115,23121, 23131,23137}
			for i = 1,table.getn(BOSS) do
				if data[index*3+1] == BOSS[i] then
					local name = s_getNpcBase(BOSS[i],1)
					s_copyInfo(cid,"BOSS["..name.."]出现,请所有人员注意戒备",ChatPos_Sys + ChatPos_Important)
					local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
					for i = 1,table.getn(list), 2 do
						Play2DEffect(list[i+1], 11) -- 客户端播放特效
					end
				end
			end
		end
	end
end

function CopySceneInfo_28:createMonster(cid,turn)
	--turn = 4
	local monster = {
		--npci,位置，数量
		{23100,1,80},
		{23101,1,80},
		{23102,1,80},
		{23103,3,80},
		{23107,3,80},
		{23108,3,80},
		{23104,1,1,23104,3,1},

		{23105,1,40,23105,3,40},
		{23109,1,40,23109,3,40},
		{23111,1,40,23111,3,40},
		{23110,1,1,23110,3,1},
		{23112,1,40,23112,3,40},
		{23113,1,40,23113,3,40},
		{23114,1,40,23114,3,40},
		{23115,1,1,23115,3,1},

		{23116,1,25,23116,2,25,23116,3,25},
		{23117,1,25,23117,2,25,23117,3,25},
		{23118,1,25,23118,2,25,23118,3,25},
		{23119,1,25,23119,2,25,23119,3,25},
		{23121,2,1},

		{23123,1,15,23123,2,15,23123,3,15,23124,1,2,23124,2,2,23124,3,2},
		{23125,1,15,23125,2,15,23125,3,15,23126,1,2,23126,2,2,23126,3,2},
		{23127,1,15,23127,2,15,23127,3,15,23128,1,2,23128,2,2,23128,3,2},
		{23129,1,15,23129,2,15,23129,3,15,23130,1,2,23130,2,2,23130,3,2},
		{23131,2,1},

		{23133,1,5,23133,2,9,23133,3,5},
		{23134,1,5,23134,2,9,23134,3,5},
		{23135,1,5,23135,2,9,23135,3,5},
		{23136,1,5,23136,2,9,23136,3,5},
		{23137,2,1} }

	s_copyInfo(cid,"前线发现怪物发起进攻",ChatPos_Sys + ChatPos_Important)
	CopySceneInfo_28:initMonster(cid,monster[turn+1])
	local name = s_getNpcBase(monster[turn+1][1],1)
	s_sendCopyInfo(cid,name,turn+1,60,"守护要塞")
	--记录怪物波数
	local num = s_getSceneVar(cid,0,201)
	s_setSceneVar(cid,0,201,num + 1)
	if num == 10 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			AddRoleTaskOperate(list[i+1],11873)
		end
	end
end
function CopySceneInfo_28:dead145(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 28 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"入口1第1岗哨守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_28:dead146(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 28 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"入口1第2岗哨守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_28:dead147(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 28 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"入口1第3岗哨守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_28:dead148(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 28 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"入口2第1岗哨守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_28:dead149(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 28 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"入口2第2岗哨守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_28:dead150(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 28 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"入口2第3岗哨守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_28:refreshScore(uid)
	local exp = s_getVar(uid,101,20)
	local score = s_getVar(uid,101,21)
	s_sendGuardCopyScore(uid,exp,score)
end
function CopySceneInfo_28:OnNpcDead(uid,thisid)
	if uid == nil or uid == 0 then return end

	s_addVar(uid,101,21,s_getVar(uid,101,21) + 1)
	CopySceneInfo_28:refreshScore(uid)
end
-- for i = 23100,23137 do
-- 	RegisterMyNpcDeadEvent(i,"CopySceneInfo_28:OnNpcDead($1,$2)")
-- end
-- RegisterMyNpcDeadEvent(145,"CopySceneInfo_28:dead145($2)")
-- RegisterMyNpcDeadEvent(146,"CopySceneInfo_28:dead146($2)")
-- RegisterMyNpcDeadEvent(147,"CopySceneInfo_28:dead147($2)")
-- RegisterMyNpcDeadEvent(148,"CopySceneInfo_28:dead148($2)")
-- RegisterMyNpcDeadEvent(149,"CopySceneInfo_28:dead149($2)")
-- RegisterMyNpcDeadEvent(150,"CopySceneInfo_28:dead150($2)")

--增加守卫要塞副本的排队
s_createQueueOneGroup(13,28,0,111,37,217,"守卫要塞121级",12,0,100)
