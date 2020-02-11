--要塞守卫

CopySceneInfo_5 = { }

CopySceneInfo_killer =
{
	[24516] = true,
	[24535] = true,
	[24554] = true,
	[24573] = true,
	[24592] = true,
	[24611] = true,
	[24630] = true,
	[24649] = true,
	[24668] = true,
}

CopySceneInfo_superkiller =
{
	[24517] = true,
	[24536] = true,
	[24555] = true,
	[24574] = true,
	[24593] = true,
	[24612] = true,
	[24631] = true,
	[24650] = true,
	[24669] = true,
}

--副本创建初始化
function CopySceneInfo_5:InitCopyScene(cid)
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

function CopySceneInfo_5:OnPlayerIntoCopyScene(cid,uid)
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
function CopySceneInfo_5:OnPlayerLeaveCopyScene(cid,uid)
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
CopySceneInfo_5:refreshScore(uid)
end
]]--

function OnLoopCopyScene_1Sec_5(ctype,cid)
	local begin = s_getSceneVar(cid,0,0)
	if begin > 0 then
		s_copyInfo(cid,"倒计时:" .. begin)
		s_setSceneVar(cid,0,0,begin- 1)
		s_setSceneVar(cid,0,1,s_getCurTime(TIME_ALLSECONDS)- 2)  --开始时间
		if begin == 1 then
			CopySceneInfo_5:createMonster(cid,0)
		end
		return
	end
	local pass = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,1)
	if pass % 60 == 0 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			s_addVar(list[i+1],101,21,s_getVar(list[i+1],101,21) + 10 + pass / 120)
			CopySceneInfo_5:refreshScore(uid)
		end

		local turn = pass / 60
		if turn < 15 then
			CopySceneInfo_5:createMonster(cid,turn)
		end
		if turn <= 15 then
			local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
			for i = 1,table.getn(list), 2 do
				local level = s_getValue(list[i],list[i+1],VALUE_TYPE_LEVEL)
				local n = math.floor(pass / 60 )
				local exp = (3+0.1*(n^1.5))*(50+0.1*level^2.2)
				s_addVar(list[i+1],101,20,s_getVar(list[i+1],101,20)+ exp)
				CopySceneInfo_5:refreshScore(list[i+1])
			end
			if turn == 15 then
				local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
				for i = 1,table.getn(list), 2 do
					local level = s_getValue(list[i],list[i+1],VALUE_TYPE_LEVEL)
					local exp = 150 * level^1.5
					s_addVar(list[i+1],101,20,s_getVar(list[i+1],101,20)+ exp)
				end
				s_sysInfo(uid,"副本即将完成，完成后离开副本即可获得经验奖励。",ChatPos_Sys + ChatPos_Important)
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

	if s_getSceneVar(cid,0,2) == 0 then
		CopySceneInfo_5:checkOver(cid)
	end
end

function CopySceneInfo_5:checkOver(cid)
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
				if baseid > 10000 and baseid ~= 24518 then
					s_clearNpc(list[i+1])
				end
			end
			if s_getSceneVar(cid,0,109) >= 5 and s_getSceneVar(cid,0,110) >= 5 and s_getSceneVar(cid,0,114) == 0 then
				local npcid = s_sysSummon(24518,cid,posx,posy)
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

function CopySceneInfo_5:jumpTarget(baseid,uid)
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

function CopySceneInfo_5:initMonster(cid,data)
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

function CopySceneInfo_5:createMonster(cid,turn)
	--turn = 4
	local monster = { --npci,位置，数量
		--第一种
		{
			{24500,1,80}, --第1波
			{24501,2,80}, --第2波
			{24502,3,80}, --第3波
			{24503,2,80}, --第4波
			{24504,3,80}, --第5波
			{24505,1,80}, --第6波
			{24506,2,1}, --第7波
			{24507,2,80}, --第8波
			{24508,3,80}, --第9波
			{24509,1,80}, --第10波
			{24510,2,80}, --第11波
			{24511,2,1}, --第12波
			{24512,2,80}, --第13波
			{24513,2,80}, --第14波
			{24514,1,1}, --第15波
	},
	--第二种
{
	{24500,3,80}, --第1波
	{24501,2,80}, --第2波
	{24502,1,80}, --第3波
	{24503,3,80}, --第4波
	{24504,2,80}, --第5波
	{24505,2,80}, --第6波
	{24506,2,1}, --第7波
	{24507,1,80}, --第8波
	{24508,3,80}, --第9波
	{24509,2,80}, --第10波
	{24510,3,80}, --第11波
	{24511,2,1}, --第12波
	{24512,3,80}, --第13波
	{24513,1,80}, --第14波
	{24514,2,1}, --第15波
},
--第三种
{
	{24500,2,80}, --第1波
	{24501,1,80}, --第2波
	{24502,2,80}, --第3波
	{24503,2,80}, --第4波
	{24504,3,80}, --第5波
	{24505,3,80}, --第6波
	{24506,2,1}, --第7波
	{24507,1,80}, --第8波
	{24508,2,80}, --第9波
	{24509,3,80}, --第10波
	{24510,1,80}, --第11波
	{24511,2,1}, --第12波
	{24512,1,80}, --第13波
	{24513,2,80}, --第14波
	{24514,3,1}, --第15波
},
}

	s_copyInfo(cid,"前线发现怪物发起进攻",ChatPos_Sys + ChatPos_Important)
	local rand = math.random(1,table.getn(monster))
	CopySceneInfo_5:initMonster(cid,monster[rand][turn+1])
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
					local npcid = s_sysSummon(22641,cid,posx,posy)
					s_setSceneVar(cid,0,107,s_getSceneVar(cid,0,107)+1)
				end
			else
				local npcid = s_sysSummon(22641,cid,posx,posy)
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
					local npcid = s_sysSummon(22642,cid,posx,posy)
					s_setSceneVar(cid,0,108,s_getSceneVar(cid,0,108)+1)
				end
			else
				local npcid = s_sysSummon(22642,cid,posx,posy)
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
function CopySceneInfo_5:dead145(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"A路一号守卫被击杀，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_5:dead146(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"A路二号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_5:dead147(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"A路三号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_5:dead148(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"B路一号守卫被击杀，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_5:dead149(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"B路二号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_5:dead150(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"B路二号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_5:dead347(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"C路二号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_5:dead348(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"C路二号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end
function CopySceneInfo_5:dead349(thisid)
	local ctype = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 5 then
		local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
		s_copyInfo(cid,"C路三号守卫被击败，赶快前去帮助。",ChatPos_Sys + ChatPos_Important)
	end
end

function CopySceneInfo_5:refreshScore(uid)
	local exp = s_getVar(uid,101,20)
	local score = s_getVar(uid,101,21)
	s_sendGuardCopyScore(uid,exp,score)
end

function CopySceneInfo_5:OnNpcDead(uid,thisid)
	if uid == nil or uid == 0 then return end
	local baseid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_BASE_ID)
	local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
	local posx = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_POSX)
	local posy = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_POSY)
	if CopySceneInfo_killer[baseid] or CopySceneInfo_superkiller[baseid] then -- TODO 需要刷新采集NPC的怪物
		local rand1 = math.random(1,1000)
		if rand1 <= 1000 then -- 1/10的几率
			local npcid = s_sysSummon(345,cid,posx,posy) -- TODO 设置存活时间
		end
	end
	local rand2 = math.random(1,10000)
	if rand2 <= 150 then -- 1.5%的几率道具
		s_addItem(uid,31570,0,1,0,"1-1","要塞随机")
	end
	local rand3 = math.random(1,10000)
	if rand3 <= 50 then -- 0.5%的几率道具
		s_addItem(uid,31571,0,1,0,"1-1","要塞机枪兵")
	end
	local rand4 = math.random(1,10000)
	if rand4 <= 50 then -- 0.5%的几率道具
		s_addItem(uid,31572,0,1,0,"1-1","要塞炮塔")
	end
	local rand5 = math.random(1,10000)
	if rand5 <= 100 then -- 1%的几率道具
		s_addItem(uid,31573,0,1,0,"1-1","要塞战旗")
	end
	local rand6 = math.random(1,10000)
	if rand6 <= 100 then -- 1%的几率招NPC 恶魔果实
		local npcid = s_sysSummon(341,cid,posx,posy) -- TODO 设置存活时间
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,90*1000)
	elseif rand6 >= 101 and rand6 <= 250 then -- 1.5%的几率招NPC 上帝果实
		local npcid = s_sysSummon(342,cid,posx,posy)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,90*1000)
	elseif rand6 >= 251 and rand6 <= 300 then  -- 0.5%的几率招NPC 自爆果实
		local npcid = s_sysSummon(343,cid,posx,posy) -- TODO 设置存活时间
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,90*1000)
	end
	--[[此处填充需要召唤的NPC，注意战旗要加buff]]
	if CopySceneInfo_killer[baseid] then
		s_setSceneVar(cid,0,109,s_getSceneVar(cid,0,109)+1)
		local killernum = s_getSceneVar(cid,0,109)
		local superkillernum = s_getSceneVar(cid,0,110)
		s_copyInfo(cid,"正义永不沉睡，你们已击败了"..killernum.."个暗影杀手，"..superkillernum.."个超暗影杀手。",ChatPos_Sys + ChatPos_Important)
	end
	if CopySceneInfo_superkiller[baseid] then
		s_setSceneVar(cid,0,110,s_getSceneVar(cid,0,110)+1)
		local killernum = s_getSceneVar(cid,0,109)
		local superkillernum = s_getSceneVar(cid,0,110)
		s_copyInfo(cid,"正义永不沉睡，你们已击败了"..killernum.."个暗影杀手，"..superkillernum.."个超暗影杀手。",ChatPos_Sys + ChatPos_Important)
	end
	s_addVar(uid,101,21,s_getVar(uid,101,21) + 1)
	CopySceneInfo_5:refreshScore(uid)
end

--其他要塞守卫副本里不用再copy以下采集NPC处理部分
--采集NPC的click事件
function OnClickNpc_341(uid,npcid)
	local callback = "guard_copy_pick("..npcid..","..uid..")"
	s_showbar(uid,5000,callback,0,1)
end

function OnClickNpc_342(uid,npcid)
	local callback = "guard_copy_pick("..npcid..","..uid..")"
	s_showbar(uid,5000,callback,0,1)
end

function OnClickNpc_343(uid,npcid)
	local callback = "guard_copy_pick("..npcid..","..uid..")"
	s_showbar(uid,5000,callback,0,1)
end

function OnClickNpc_344(uid,npcid)
	local callback = "guard_copy_pick("..npcid..","..uid..")"
	s_showbar(uid,5000,callback,0,1)
end

function OnClickNpc_345(uid,npcid)
	local callback = "guard_copy_pick("..npcid..","..uid..")"
	s_showbar(uid,5000,callback,0,1)
end

function guard_copy_pick(npcid, uid)
	local baseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
	-- 根据不同的baseid，加不同的buff，或者给奖励
	if baseid == 341 then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,20500)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,20500,50,30)
	end
	if baseid == 342 then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,20501)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,20501,20,200)
	end
	if baseid == 343 then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,10410)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,10410,1,10)
	end
	if baseid == 344 then
		s_addMoney(uid,MoneyType_Money,50,"守卫要塞遗落的铁箱")
	end
	if baseid == 345 then
		s_addMoney(uid,MoneyType_MoneyTicket,250,"守卫要塞遗落木箱")
	end
	s_clearNpc(npcid)
end

--61级怪物事件
-- for i = 24500,24800 do
-- 	RegisterMyNpcDeadEvent(i,"CopySceneInfo_5:OnNpcDead($1,$2)")
-- end

-- RegisterMyNpcDeadEvent(145,"CopySceneInfo_5:dead145($2)")
-- RegisterMyNpcDeadEvent(146,"CopySceneInfo_5:dead146($2)")
-- RegisterMyNpcDeadEvent(147,"CopySceneInfo_5:dead147($2)")
-- RegisterMyNpcDeadEvent(148,"CopySceneInfo_5:dead148($2)")
-- RegisterMyNpcDeadEvent(149,"CopySceneInfo_5:dead149($2)")
-- RegisterMyNpcDeadEvent(150,"CopySceneInfo_5:dead150($2)")
-- RegisterMyNpcDeadEvent(347,"CopySceneInfo_5:dead347($2)")
-- RegisterMyNpcDeadEvent(348,"CopySceneInfo_5:dead348($2)")
-- RegisterMyNpcDeadEvent(349,"CopySceneInfo_5:dead349($2)")

--增加守卫要塞副本的排队
s_createQueueOneGroup(13,5,0,111,37,217,"守卫要塞41级",6,0,100)
