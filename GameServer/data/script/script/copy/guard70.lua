--要塞守卫

CopySceneInfo_100 = { }

--副本创建初始化
function CopySceneInfo_100:InitCopyScene(cid)
	s_setSceneVar(cid,0,0,10)
	local npcid = s_sysSummon(144,cid,43,212)
	s_addbuff(SCENE_ENTRY_NPC,npcid,31,1,60*60)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_REBORN_INTERVAL,60*60*1000)
	s_setSceneVar(cid,0,100,npcid) --保卫npcid

	npcid = s_sysSummon(145,cid,45,54)
	s_setSceneVar(cid,0,101,npcid) --A1
	npcid = s_sysSummon(146,cid,39,109)
	s_setSceneVar(cid,0,102,npcid) --A2
	npcid = s_sysSummon(147,cid,27,182)
	s_setSceneVar(cid,0,103,npcid) --A3

	npcid = s_sysSummon(148,cid,202,221)
	s_setSceneVar(cid,0,104,npcid) --B1
	npcid = s_sysSummon(149,cid,149,221)
	s_setSceneVar(cid,0,105,npcid) --B2
	npcid = s_sysSummon(150,cid,73,230)
	s_setSceneVar(cid,0,106,npcid) --B3

	npcid = s_sysSummon(347,cid,186,79)
	s_setSceneVar(cid,0,111,npcid) --B1
	npcid = s_sysSummon(348,cid,98,166)
	s_setSceneVar(cid,0,112,npcid) --B2
	npcid = s_sysSummon(349,cid,56,206)
	s_setSceneVar(cid,0,113,npcid) --B3

	local cur_time = s_getCurTime(TIME_ALLSECONDS)
	s_setSceneVar(cid,0,200,cur_time)
end

function CopySceneInfo_100:OnPlayerIntoCopyScene(cid,uid)
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
	s_sysInfo(uid,"每坚持5秒钟就能获得经验奖励，坚持的时间越长经验越多。",ChatPos_Sys + ChatPos_Important)
	s_sysInfo(uid,"击败5个暗影杀手和5个超暗影杀手可出现隐藏怪物！",ChatPos_Sys + ChatPos_Important)
	s_sysInfo(uid,"击败强大的BOSS还能获得额外奖励。努力战斗吧！",ChatPos_Sys + ChatPos_Important)
end
function CopySceneInfo_100:OnPlayerLeaveCopyScene(cid,uid)
	local exp = s_getVar(uid,101,20)
	if exp ~= 0 then
		s_refreshExp(uid,exp,ExpType_GuardCopy,40)
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

--[[
function OnUseGuardCopyItemEvent_5(uid,itemid,value)
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
CopySceneInfo_100:refreshScore(uid)
end
]]--

function OnLoopCopyScene_1Sec_100(ctype,cid)
	local begin = s_getSceneVar(cid,0,0)
	if begin > 0 then
		s_copyInfo(cid,"倒计时:" .. begin)
		s_setSceneVar(cid,0,0,begin- 1)
		s_setSceneVar(cid,0,1,s_getCurTime(TIME_ALLSECONDS)- 2)  --开始时间
		if begin == 1 then
			CopySceneInfo_100:createMonster(cid,0)
		end
		return
	end
	local pass = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,1)
	if pass % 60 == 0 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			s_addVar(list[i+1],101,21,s_getVar(list[i+1],101,21) + 10 + pass / 120)
			CopySceneInfo_100:refreshScore(uid)
		end

		local turn = pass / 60
		if turn < 15 then
			CopySceneInfo_100:createMonster(cid,turn)
		end
		if turn <= 15 then
			local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
			for i = 1,table.getn(list), 2 do
				local level = s_getValue(list[i],list[i+1],VALUE_TYPE_LEVEL)
				local n = math.floor(pass / 60 )
				local exp = (3+0.1*(n^1.5))*(50+0.1*level^2.2)
				s_addVar(list[i+1],101,20,s_getVar(list[i+1],101,20)+ exp)
				CopySceneInfo_100:refreshScore(list[i+1])
			end
			if turn == 15 then
				local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
				for i = 1,table.getn(list), 2 do
					local level = s_getValue(list[i],list[i+1],VALUE_TYPE_LEVEL)
					local exp = 150 * level^1.5
					s_addVar(list[i+1],101,20,s_getVar(list[i+1],101,20)+ exp)
				end
			end
		end
	end
	if pass == 10 * 60 then
		local master = s_getSceneVar(cid,100,100)
		local name = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
		local country = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELADN_NAME)
		if country ~= nil and name ~= nil then
			s_worldInfo(country .."的".. name .. "带领英勇的同伴，已经在要塞守卫的战场上奋战超过10分钟啦！",ChatPos_Sys + ChatPos_Honor)
		end
	end
	--坚挺完成引导任务
	if pass == 1 * 60 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			AddRoleTaskOperate(list[i+1],13011)
		end
	end
	if pass == 5 * 60 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			AddRoleTaskOperate(list[i+1],13012)
			AddRoleTaskOperate(list[i+1],13013)
		end
	end
	--成就
	if pass == 10 * 60 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			AddAchieveTaskOperate(list[i+1],40012,1)
		end
	end
	if pass == 15 * 60 then
		s_copyInfo(cid,"正常副本即将结束，离开副本即可获取经验！",ChatPos_Sys + ChatPos_Important)
	end

	if s_getSceneVar(cid,0,2) == 0 then
		CopySceneInfo_100:checkOver(cid)
	end
end

function CopySceneInfo_100:checkOver(cid)
	--检查是否通关
	local cur_time = s_getCurTime(TIME_ALLSECONDS)
	local starttime = s_getSceneVar(cid,0,200)
	if cur_time > starttime + 20 * 60 then
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
	local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
	local guardid = s_getSceneVar(cid,0,100)
	if s_getValue(SCENE_ENTRY_NPC,guardid,VALUE_TYPE_HP) ~= 0 then
		if cur_time > starttime + 15 * 60 then
			for i = 1,table.getn(list), 2 do --清理NPC
				local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
				-- TODO 把0换成暗夜王者的baseid
				if baseid > 10000 and baseid ~= 24537 then
					s_clearNpc(list[i+1])
				end
			end
			if s_getSceneVar(cid,0,109) >= 5 and s_getSceneVar(cid,0,110) >= 5 and s_getSceneVar(cid,0,114) == 0 then
				local npcid = s_sysSummon(24537,cid,57,219)
				s_copyInfo(cid,"warning！暗夜王者亲自前来，他将会带来毁灭的力量！生死就在此刻了。",ChatPos_Sys + ChatPos_Important)
				if npcid ~= 0 and npcid ~= nil then
					s_setSceneVar(cid,0,114,npcid)
				end
			end
		end
		return VALUE_OK
	end
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

function CopySceneInfo_100:jumpTarget(baseid,uid)
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
	if baseid == 347 then
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
	if baseid == 348 then
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
	if baseid == 349 then
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

function CopySceneInfo_100:initMonster(cid,data)
	local POSITION = { {40,20}, {233,25}, {230,224} }
	for index = 0,table.getn(data)/3-1 do
		local ret = 0
		for i = 1,data[index*3+3] do
			local pos_index = data[index*3+2]
			local posx = POSITION[pos_index][1]
			local posy = POSITION[pos_index][2]
			local npcid = s_sysSummon(data[index*3+1],cid,posx,posy)
			local msg = ""
			if pos_index == 1 then
				msg = msg .. "A"
			elseif pos_index == 2 then
				msg = msg .. "B"
			elseif pos_index == 3 then
				msg = msg .. "C"
			end
			local BOSS =
				{24506,24525,24544,24563,24582,24601,24620,24639,24658,
					24511,24530,24549,24568,24587,24606,24625,24644,24663,
					24514,24533,24552,24571,24590,24609,24628,24647,24666,}
			for i = 1,table.getn(BOSS) do
				if data[index*3+1] == BOSS[i] then
					ret = 1
					local name = s_getNpcBase(BOSS[i],1)
					s_copyInfo(cid,"warning！warning！"..msg.."路发现BOSS["..name.."]，请赶快前往击败",ChatPos_Sys + ChatPos_Important)
					local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
					for i = 1,table.getn(list), 2 do
						Play2DEffect(list[i+1], 11) -- 客户端播放特效
					end
				end
			end
		end
		if ret == 0 then
			local pos_index = data[index*3+2]
			local msg = ""
			if pos_index == 1 then
				msg = msg .. "A"
			elseif pos_index == 2 then
				msg = msg .. "B"
			elseif pos_index == 3 then
				msg = msg .. "C"
			end
			local name = s_getNpcBase(data[index*3+1],1)
			s_copyInfo(cid,"warning！"..msg.."路发现["..name.."],请赶快前往击败（新的攻击也在集结中）",ChatPos_Sys + ChatPos_Important)
		end
	end
end

function CopySceneInfo_100:createMonster(cid,turn)
	--turn = 4
	local monster = { --npci,位置，数量
		--第一种
		{
			{24519,2,80},
			{24520,3,80},
			{24521,2,80},
			{24522,1,80},
			{24523,2,80},
			{24524,3,80},
			{24525,2,1 },
			{24526,1,80},
			{24527,2,80},
			{24528,3,80},
			{24529,2,80},
			{24530,1,1 },
			{24531,1,80},
			{24532,3,80},
			{24533,2,1 },
	},
	--第二种
{
	{24519,1,80},
	{24520,3,80},
	{24521,2,80},
	{24522,3,80},
	{24523,2,80},
	{24524,1,80},
	{24525,3,1 },
	{24526,2,80},
	{24527,1,80},
	{24528,2,80},
	{24529,1,80},
	{24530,1,1 },
	{24531,2,80},
	{24532,3,80},
	{24533,3,1 },
},
--第三种
{
	{24519,3,80},
	{24520,2,80},
	{24521,3,80},
	{24522,1,80},
	{24523,2,80},
	{24524,3,80},
	{24525,2,1 },
	{24526,3,80},
	{24527,1,80},
	{24528,1,80},
	{24529,1,80},
	{24530,2,1 },
	{24531,3,80},
	{24532,3,80},
	{24533,1,1 },
},
}

	s_copyInfo(cid,"前线发现怪物发起进攻",ChatPos_Sys + ChatPos_Important)
	local rand = math.random(1,table.getn(monster))
	CopySceneInfo_100:initMonster(cid,monster[rand][turn+1])
	local name = s_getNpcBase(monster[rand][turn+1][1],1)
	local msg = ""
	if monster[rand][turn+1][2] == 1 then
		msg = msg.."A"
	elseif monster[rand][turn+1][2] == 2 then
		msg = msg.."B"
	elseif monster[rand][turn+1][2] == 3 then
		msg = msg.."C"
	end
	s_sendCopyInfo(cid,name,turn+1,60,"抵御来自"..msg.."路的怪物的袭击，避免雕像被击毁！")
	-- TODO
	local killernum = s_getSceneVar(cid,0,107)--暗影杀手
	if killernum < 10 then
		local rate = math.floor((turn+1)*100/15)
		local rand1 = math.random(1,100)
		if rand1 <= rate then
			local POSITION = { {40,20}, {233,25}, {230,224} }
			local pos_index = monster[rand][turn+1][2]
			local posx = POSITION[pos_index][1]
			local posy = POSITION[pos_index][2]
			if turn+1 == 15 then
				for i=1,10-killernum do
					local npcid = s_sysSummon(24535,cid,posx,posy)
					s_setSceneVar(cid,0,107,s_getSceneVar(cid,0,107)+1)
				end
			else
				local npcid = s_sysSummon(24535,cid,posx,posy)
				s_setSceneVar(cid,0,107,killernum+1)
			end
		end
	end
	local superkillernum = s_getSceneVar(cid,0,108)--超暗影杀手
	if superkillernum < 10 then
		local rate = math.floor((turn+1)*100/15)
		local rand1 = math.random(1,100)
		if rand1 <= rate then
			local POSITION = { {40,20}, {233,25}, {230,224} }
			local pos_index = monster[rand][turn+1][2]
			local posx = POSITION[pos_index][1]
			local posy = POSITION[pos_index][2]
			if turn+1 == 15 then
				for i=1,10-superkillernum do
					local npcid = s_sysSummon(24536,cid,posx,posy)
					s_setSceneVar(cid,0,108,s_getSceneVar(cid,0,108)+1)
				end
			else
				local npcid = s_sysSummon(24536,cid,posx,posy)
				s_setSceneVar(cid,0,108,superkillernum+1)
			end
		end
	end
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
function CopySceneInfo_100:dead145(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"A路一号守卫被击杀，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_100:dead146(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"A路二号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_100:dead147(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"A路三号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_100:dead148(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"B路一号守卫被击杀，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_100:dead149(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"B路二号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_100:dead150(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"B路二号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_100:dead347(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"C路二号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_100:dead348(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"C路二号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_100:dead349(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"C路三号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end

function CopySceneInfo_100:refreshScore(uid)
	local exp = s_getVar(uid,101,20)
	local score = s_getVar(uid,101,21)
	s_sendGuardCopyScore(uid,exp,score)
end

--增加守卫要塞副本的排队
s_createQueueOneGroup(13,100,0,111,37,217,"守卫要塞71级",6,0,100)
