-------------------------------------------------------------------------
--只读取攻击的物功和化功技能定义在LuaScriptIgnore.cpp文件里
-------------------------------------------------------------------------
--通用BOSS虚弱技能
s_registerNpcTimeSkill(10000,60)
s_registerNpcTimeSkill(7127,30)
function OnUseSkill_7127(level,etype1,eid1,etype2,eid2)
	local DAMAGE =
		{ {15,15,25,35},
			{25,30,45,65},
			{40,50,70,105},
			{60,80,100,120},
			{80,100,130,160},
			{110,140,170,210},
			{140,180,230,280},
			{180,230,290,360},
			{220,290,350,440},
			{260,340,410,520},
			{340,440,540,670},
			{390,510,630,780},
			{440,580,710,890},
			{500,650,800,1000},
			{550,720,880,1110},
		}

	local slv = 1
	local baseid = s_getValue(etype1,eid1,VALUE_TYPE_BASE_ID)
	if baseid == 20001 then slv = 1 end
	if baseid == 20002 then slv = 2 end
	if baseid == 20003 then slv = 1 end
	if baseid == 20004 then slv = 2 end
	if baseid == 20005 then slv = 2 end
	if baseid == 20006 then slv = 2 end
	if baseid == 20007 then slv = 3 end
	if baseid == 20008 then slv = 3 end
	if baseid == 20009 then slv = 3 end

	local level = s_getValue(etype1,eid1,VALUE_TYPE_LEVEL)
	level = math.floor((level -1)/10)+1
	local damage = DAMAGE[level][slv]
	s_addbuff(etype2,eid2,20064,slv,10,damage)
	ShowAttack(7127,etype1,eid1,etype2,eid2)
end
--守卫攻击
function OnUseSkill_5520(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local hurt = s_getValue(etype1,eid1,VALUE_TYPE_LDAM)
	if hurt == 0 then
		hurt = s_getValue(etype1,eid1,VALUE_TYPE_WDAM)
	end
	table.insert(victim,etype2)
	table.insert(victim,eid2)
	table.insert(victim,hurt)
	local list = s_getNineEntry(etype2,eid2,3)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_NPC then
			if list[i+1] ~= eid1 and list[i+1] ~= eid2 then
				if s_checkPK(48001,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
					local driver = s_getValue(list[i],list[i+1],VALUE_TYPE_DRIVER)
					if driver == 0 then
						table.insert(victim,list[i])
						table.insert(victim,list[i+1])
						table.insert(victim,30)
					end
				end
				if table.getn(victim) >= 15 then break end
			end
		end
	end
	DirectAttack(48001,etype1,eid1,unpack(victim))
end

--守卫攻击
function OnUseSkill_7196(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local hurt = s_getValue(etype1,eid1,VALUE_TYPE_LDAM)
	if hurt == 0 then
		hurt = s_getValue(etype1,eid1,VALUE_TYPE_WDAM)
	end
	table.insert(victim,etype2)
	table.insert(victim,eid2)
	table.insert(victim,hurt)
	local list = s_getNineEntry(etype2,eid2,3)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_NPC then
			if list[i+1] ~= eid1 and list[i+1] ~= eid2 then
				if s_checkPK(48001,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
					local driver = s_getValue(list[i],list[i+1],VALUE_TYPE_DRIVER)
					if driver == 0 then
						s_removebuff(list[i],list[i+1],10706)
						s_removebuff(list[i],list[i+1],10707)
						s_addbuff(list[i],list[i+1],10706,50,5)
						s_addbuff(list[i],list[i+1],10707,50,5)
						table.insert(victim,list[i])
						table.insert(victim,list[i+1])
						table.insert(victim,30)
					end
				end
				if table.getn(victim) >= 15 then break end
			end
		end
	end
	DirectAttack(48001,etype1,eid1,unpack(victim))
end

--影分身攻击
function OnUseSkill_5007(level,etype1,eid1,etype2,eid2)
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	MagicAttack(5007,atype,etype1,eid1,etype2,eid2,damage)
end
--百分比伤害
function OnUseSkill_5505(level,etype1,eid1,etype2,eid2)
	local maxhp = s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	MagicAttack(5505,atype,etype1,eid1,etype2,eid2,maxhp*0.35)
end
--树干追打
function OnUseSkill_6007(level,etype1,eid1,etype2,eid2)
	local atype = VALUE_TYPE_PDAM
	local baseid = s_getValue(etype1,eid1,VALUE_TYPE_BASE_ID)
	if baseid == 10009 then atype = VALUE_TYPE_MDAM end
	local damage = s_getValue(etype1,eid1,atype)
	MagicAttack(6007,atype,etype1,eid1,etype2,eid2,damage)
end
--致盲幻听
function OnUseSkill_6016(level,etype1,eid1,etype2,eid2)
	s_removebuff(etype1,eid1,20005)
	s_addbuff(etype1,eid1,20005,30*level,10)
	ShowAttack(6016,etype1,eid1,etype2,eid2)
end
--剧毒蛛丝
function OnUseSkill_6017(level,etype1,eid1,etype2,eid2)
	SpeadPoison(etype1,eid1,etype2,eid2,1)
	ShowAttack(6017,etype1,eid1,etype2,eid2)
end
--召唤异性
function OnUseSkill_6018(level, etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	local baseid = s_getValue(etype1,eid1,VALUE_TYPE_BASE_ID)
	if baseid == 10009 then
		baseid = 10010
	elseif baseid == 10010 then
		baseid = 10009
	end
	s_seekHelp(eid1, baseid, 1)
	ShowAttack(6018,etype1,eid1,etype2,eid2)
end
--群狼战术
function OnUseSkill_6019(level, etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	s_seekHelp(eid1, 10013, 2)
	ShowAttack(6019,etype1,eid1,etype2,eid2)
end
--毒素爆发
function OnUseSkill_6020(level,etype1,eid1,etype2,eid2)
	SpeadPoison(etype1,eid1,etype2,eid2,3)
	ShowAttack(6020,etype1,eid1,etype2,eid2)
end
--缠绕藤蔓
function OnUseSkill_6021(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype2,eid2,20006) == 0 then
		s_addbuff(etype2,eid2,20006,1,5)
	end
	ShowAttack(6021,etype1,eid1,etype2,eid2)
	local dist = GetEntryPosition(etype1,eid1,etype2,eid2)
	if dist ~= nil and dist < 5 and etype2 == SCENE_ENTRY_PLAYER then
		-- NPC远离攻击者
		BeatBack(etype2,eid2,etype1,eid1,2,3)
	end
end
--飞速逃逸
function OnUseSkill_6022(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype1,eid1,20001,1,300)
	ShowAttack(6022,etype1,eid1,etype2,eid2)
end
--爆破野蛮人，自曝
function OnUseSkill_6023(level,etype1,eid1,etype2,eid2)
	if eid2 ~= nil and eid2 ~= 0 then
		local dx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
		local dy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
		s_goto(etype1,eid1,dx,dy,1)
	end
	local posx= s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local damage = 100
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,3)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			table.insert(victim,damage)
		end
	end
	s_setValue(etype1,eid1,VALUE_TYPE_HP,0)
	DirectAttack(6023,etype1,eid1,unpack(victim))
end
--致命打击
s_registerNpcTimeSkill(6024,20)
function OnUseSkill_6024(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	local htype,damage = BossDamage(etype1,eid1,1)
	MagicHurtAttack(6024,etype1,eid1,htype,damage,unpack(victim))
end
--疯狂践踏
s_registerNpcHpSkill(6025,20)
function OnUseSkill_6025(level,etype1,eid1,etype2,eid2)
	local posx= s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	local htype,damage = BossDamage(etype1,eid1,1)
	MagicHurtAttack(6025,etype1,eid1,htype,damage,unpack(victim))
end
--钳制一击
function OnUseSkill_6026(level,etype1,eid1,etype2,eid2)
	local etype,eid = GetRandomPlayer(etype1,eid1,etype2,eid2)
	if etype == SCENE_ENTRY_PLAYER and eid > 0 then
		local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
		local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
		s_goto(etype,eid,x1,y1,2)
		s_addbuff(etype1,eid1,20002,50,5)
		OnUseSkill_6024(level,etype1,eid1,etype,eid)
	end
	ShowAttack(6026,etype1,eid1,etype,eid)
end
--翼击
function OnUseSkill_6040(level,etype1,eid1,etype2,eid2)
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	local rand = math.random(1,100)
	if rand >= 90 then
		s_addbuff(etype2,eid2,20003,5,5)
	end
	MagicAttack(6040,VALUE_TYPE_MDAM,etype1,eid1,etype2,eid2,damage)
end
--火灼
function OnUseSkill_6042(level,etype1,eid1,etype2,eid2)
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_HDAM)
	DirectAttack(6042,etype1,eid1,etype2,eid2,damage)
end
--雷电
function OnUseSkill_6043(level,etype1,eid1,etype2,eid2)
	local damage = math.random(5,15)
	DirectAttack(6043,etype1,eid1,etype2,eid2,damage)
end
--从天而降的大火球
function OnUseSkill_5502(level,etype1,eid1,etype2,eid2)
	local damage = 70 --0.05 * s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	DirectAttack(5502,etype1,eid1,etype2,eid2,damage)
end
-------------------------------------------------------------------------------
--爆炎击
function OnUseSkill_6062(level,etype1,eid1,etype2,eid2)
	--血量低于30%时，有10%概率触发7029技能
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	if hp < maxhp * 0.3 and math.random(1,100) < 10 then
		OnUseSkill_7029(level,etype1,eid1,etype2,eid2)
		return	USE_SKILL_ERROR
	end
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	MagicAttack(6062,VALUE_TYPE_MDAM,etype1,eid1,etype2,eid2,damage)
end
-------------------------------------------------------------------------------
--隔空斩
function OnUseSkill_6122(level,etype1,eid1,etype2,eid2)
	local damage = math.random(800, 1400)
	DirectAttack(6122,etype1,eid1,etype2, eid2, damage)
end
-------------------------------------------------------------------------------
--火焰伤痕
function OnUseSkill_7000(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	SpeadPoison(etype1,eid1,etype2,eid2,1,20009)
	ShowAttack(7000,etype1,eid1,etype2,eid2)
end
--反射岩浆
function OnUseSkill_7001(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype1,eid1,20010,level,6)
	ShowAttack(7001,etype1,eid1,etype2,eid2)
end
--迅速自爆
function OnUseSkill_7002(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	local curhp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if curhp * 2 > maxhp then
		return USE_SKILL_ERROR
	end
	if eid2 ~= nil and eid2 ~= 0 then
		local dx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
		local dy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
		s_goto(etype1,eid1,dx,dy,1)
	end
	local damage = 200
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,3)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			table.insert(victim,damage)
		end
	end
	s_setValue(etype1,eid1,VALUE_TYPE_HP,0)
	DirectAttack(7002,etype1,eid1,unpack(victim))
end
--火焰陷阱
function OnUseSkill_7003(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	SpeadPoison(etype1,eid1,etype2,eid2,1,20011)
	ShowAttack(7003,etype1,eid1,etype2,eid2)
end
--烈焰灼烧
function OnUseSkill_7004(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,8)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_checkPK(7004,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				SpeadPoison(etype1,eid1,list[i],list[i+1],4,20012)
			end
		end
	end
	ShowAttack(7004,etype1,eid1,etype2,eid2)
end
--减速毒丝
function OnUseSkill_7005(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype2,eid2,20013) == 0 then
		s_addbuff(etype2,eid2,20013,level,10)
	end
	ShowAttack(7005,etype1,eid1,etype2,eid2)
end
--召唤幼虫
s_registerNpcHpSkill(7006,20)
function OnUseSkill_7006(level,etype1,eid1,etype2,eid2)
	local number = 0
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_NPC then
			local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
			if baseid == 10074 then number = number + 1 end
			if number >= 5 then
				return USE_SKILL_ERROR
			end
		end
	end
	for i = 1, 5 - number do
		local npcid = s_summon(etype1,eid1,10074,1013,1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,5*60*1000)
		local etype,eid,lock = s_getEnemy(eid1)
		s_setEnemy(npcid,etype,eid,VALUE_OK)
	end
	ShowAttack(7006,etype1,eid1,etype2,eid2)
end
--火焰冲击波
s_registerNpcTimeSkill(7007,20)
function OnUseSkill_7007(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	local htype,damage = BossDamage(etype1,eid1,1)
	MagicHurtAttack(7007,etype1,eid1,htype,damage,unpack(victim))
end
--火焰傀儡
s_registerNpcHpSkill(7008,20)
function OnUseSkill_7008(level,etype1,eid1,etype2,eid2)
	local number = 0
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_NPC then
			local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
			if baseid == 10075 then number = number + 1 end
			if number >= 5 then
				return USE_SKILL_ERROR
			end
		end
	end
	for i = 1, 5 - number do
		local npcid = s_summon(etype1,eid1,10075,1013,1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,5*60*1000)
		local etype,eid,lock = s_getEnemy(eid1)
		s_setEnemy(npcid,etype,eid,VALUE_OK)
	end
	ShowAttack(7008,etype1,eid1,etype2,eid2)
end
--火焰之盾
function OnUseSkill_7009(level,etype1,eid1,etype2,eid2)
	s_removebuff(etype1,eid1,20015)
	s_addbuff(etype1,eid1,20015,10,20)
	ShowAttack(7009,etype1,eid1,etype2,eid2)
end
--BOSS 火山爆发
s_registerNpcHpSkill(7010,20)
function OnUseSkill_7010(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_checkPK(7010,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
			end
		end
	end
	local htype,damage = BossDamage(etype1,eid1,2)
	MagicHurtAttack(7010,etype1,eid1,htype,damage,unpack(victim))
end
-------------------------------------------------------------------------------
--剧毒粘液
function OnUseSkill_7011(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	SpeadPoison(etype1,eid1,etype2,eid2,1)
	ShowAttack(7011,etype1,eid1,etype2,eid2)
end
--根须陷阱
function OnUseSkill_7012(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype2,eid2,20017) == 0 then
		s_addbuff(etype2,eid2,20017,level,3)
	end
	SpeadPoison(etype1,eid1,etype2,eid2,1)
	ShowAttack(7012,etype1,eid1,etype2,eid2)
end
--恶臭气体
function OnUseSkill_7013(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype2,eid2,20018) == 0 then
		s_addbuff(etype2,eid2,20018,level,10)
	end
	ShowAttack(7013,etype1,eid1,etype2,eid2)
end
--爆裂粘液
function OnUseSkill_7014(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype2,eid2,20019) == 0 then
		s_addbuff(etype2,eid2,20019,level,10)
	end
	DirectAttack(7014,etype1,eid1,etype2,eid2,200)
end
--精神侵害
function OnUseSkill_7015(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype2,eid2,20020) == 0 then
		s_addbuff(etype2,eid2,20020,level,3)
	end
	ShowAttack(7015,etype1,eid1,etype2,eid2)
end
--虚弱毒气
function OnUseSkill_7016(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype2,eid2,20021) == 0 then
		s_addbuff(etype2,eid2,20021,30,30)
	end
	ShowAttack(7016,etype1,eid1,etype2,eid2)
end
--粘液袭击 （群体攻击）
s_registerNpcHpSkill(7017,20)
function OnUseSkill_7017(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_checkPK(7017,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				table.insert(victim,0)
				SpeadPoison(etype1,eid1,list[i],list[i+1],3)
			end
		end
	end
	ShowAttack(7017,etype1,eid1,unpack(victim))
end
--致命撕咬
function OnUseSkill_7018(level,etype1,eid1,etype2,eid2)
	local maxhp = s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	DirectAttack(7018,etype1,eid1,etype2,eid2,maxhp*0.2)
end
--狂暴杀戮
function OnUseSkill_7019(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20024) == 0 then
		s_addbuff(etype1,eid1,20024,level,10)
		ShowAttack(7019,etype1,eid1,etype2,eid2)
	else
		return USE_SKILL_ERROR
	end
end
--血液汲取
s_registerNpcHpSkill(7020,5)
function OnUseSkill_7020(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype2,eid2,20025) == 0 then
		s_addbuff(etype2,eid2,20025,1,5,eid1)
	end
	ShowAttack(9020,etype1,eid1,etype2,eid2)
end
--血之壁障
function OnUseSkill_7021(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20026) == 0 then
		s_addbuff(etype1,eid1,20026,level,10)
	end
	ShowAttack(7021,etype1,eid1,etype2,eid2)
end
--血之重生
s_registerNpcHpSkill(7022,30)
function OnUseSkill_7022(level,etype1,eid1,etype2,eid2)
	local curhp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if curhp * 100 / maxhp >= 70 then
		local hp = math.floor(maxhp * 10/ 100)
		s_addValue(etype1,eid1,VALUE_TYPE_HP,hp)
	elseif curhp * 100 / maxhp >= 70 then
		local hp = math.floor(maxhp * 15/ 100)
		s_addValue(etype1,eid1,VALUE_TYPE_HP,hp)
	else
		local hp = math.floor(maxhp * 20/ 100)
		s_addValue(etype1,eid1,VALUE_TYPE_HP,hp)
	end
	ShowAttack(7022,etype1,eid1,etype2,eid2)
end
--致命雷暴弹
s_registerNpcTimeSkill(7023,20)
function OnUseSkill_7023(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	local htype,damage = BossDamage(etype1,eid1,1)
	MagicHurtAttack(7023,etype1,eid1,htype,damage,unpack(victim))
end
--旋风雷暴 （群体AOE技能）
s_registerNpcHpSkill(7024,20)
function OnUseSkill_7024(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20027) == 0 then
		s_addbuff(etype1,eid1,20027,1,5)
	end
	ShowAttack(7024,etype1,eid1,etype2,eid2)
end
--愤怒吼叫
function OnUseSkill_7025(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER  then
			if s_checkPK(7025,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				if s_getbufflevel(list[i],list[i+1],10506) == 0 then
					s_addbuff(list[i],list[i+1],10506,1,5)
				end
			end
		end
	end
	ShowAttack(7025,etype1,eid1,etype1,eid1)
end
--重生
function OnUseSkill_7026(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	hp = math.floor(hp * 0.5)
	s_setValue(etype1,eid1,VALUE_TYPE_HP,hp)
	ShowAttack(7026,etype1,eid1,etype2,eid2)
end
--重生狂暴
function OnUseSkill_7027(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20029) == 0 then
		s_addbuff(etype1,eid1,20029,1,5)
	end
	ShowAttack(7027,etype1,eid1,etype2,eid2)
end
--重生旋风雷暴 （群体AOE技能）
function OnUseSkill_7028(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20030) == 0 then
		s_addbuff(etype1,eid1,20030,1,8)
	end
	ShowAttack(7028,etype1,eid1,etype2,eid2)
end
--火元素爆发
function OnUseSkill_7029(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20036) == 0 then
		s_addbuff(etype1,eid1,20036,1,30)
	end
	ShowAttack(7029,etype1,eid1,etype2,eid2)
end
--围攻
function OnUseSkill_7030(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	s_seekHelp(eid1, 10035, 2)
	ShowAttack(7030,etype1,eid1,etype2,eid2)
end
--地狱咆哮
function OnUseSkill_7031(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20031) == 0 then
		s_addbuff(etype1,eid1,20031,1,10)
	end
	ShowAttack(7031,etype1,eid1,etype2,eid2)
end
--剧毒粘液
function OnUseSkill_7032(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	SpeadPoison(etype1,eid1,etype2,eid2,1)
	ShowAttack(7032,etype1,eid1,etype2,eid2)
end
--反手钩刺
function OnUseSkill_7033(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	local dx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local dy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if etype2 == SCENE_ENTRY_PLAYER then
		s_goto(etype2,eid2,dx,dy,2)
	end
	DirectAttack(7033,etype1,eid1,etype2,eid2,150)
end
--致命吸血
function OnUseSkill_7034(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp >= maxhp * 0.2 then
		return USE_SKILL_ERROR
	end
	s_addbuff(etype2,eid2,20033,1,60,eid1)
	ShowAttack(7034,etype1,eid1,etype2,eid2)
end
--巨力冲撞
function OnUseSkill_7035(level,etype1,eid1,etype2,eid2)
	if etype2 == SCENE_ENTRY_PLAYER then
		BeatBack(etype1,eid1,etype2,eid2,2,3)
	end
	MagicAttack(7035,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,200)
end
--自然吞噬
function OnUseSkill_7036(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	SpeadPoison(etype1,eid1,etype2,eid2,1)
	ShowAttack(7036,etype1,eid1,etype2,eid2)
end
--封闭毒液
function OnUseSkill_7037(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	SpeadPoison(etype1,eid1,etype2,eid2,1)
	ShowAttack(7037,etype1,eid1,etype2,eid2)
end
-------------------------------------------------------------------------------
--核子辐射
function OnUseSkill_7126(level,etype1,eid1,etype2,eid2)
	SpeadPoison(etype1,eid1,etype2,eid2,1)
	ShowAttack(7126,etype1,eid1,etype2,eid2)
end
--核子辐射
function OnUseSkill_7089(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER  then
			SpeadPoison(etype1,eid1,list[i],list[i+1],2)
		end
	end
	ShowAttack(7089,etype1,eid1,etype2,eid2)
end
--核子风暴
s_registerNpcHpSkill(7091,20)
function OnUseSkill_7091(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER  then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			table.insert(victim,1500)
			if s_getbufflevel(list[i],list[i+1],20021) == 0 then
				s_addbuff(list[i],list[i+1],20021,75,5*60)
			end
		end
	end
	DirectAttack(7091,etype1,eid1,unpack(victim))
end
--蛮力冲撞
function OnUseSkill_7092(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype2,eid2,10703,1,5)
	local maxhp = s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	MagicHurtAttack(7092,etype1,eid1,ATTACK_TYPE_LH,maxhp/10,etype2,eid2)
end
--毁灭嚎叫
function OnUseSkill_7093(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			s_addbuff(list[i],list[i+1],10506,1,10)
		end
	end
	ShowAttack(7093,etype1,eid1,etype2,eid2)
end
--量子打击
function OnUseSkill_7090(level,etype1,eid1,etype2,eid2)
	local htype,damage = BossDamage(etype1,eid1,2)
	MagicHurtAttack(7090,etype1,eid1,htype,damage,etype2,eid2)
end
--剧毒感染
function OnUseSkill_7128(level,etype1,eid1,etype2,eid2)
	SpeadPoison(etype1,eid1,etype2,eid2,2)
	ShowAttack(7128,etype1,eid1,etype2,eid2)
end
--自曝
s_registerNpcHpSkill(7129,90)
function OnUseSkill_7129(level,etype1,eid1,etype2,eid2)
	if eid2 ~= nil and eid2 ~= 0 then
		local dx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
		local dy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
		s_goto(etype1,eid1,dx,dy,1)
	end
	local posx= s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local damage = 100
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,3)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	s_setValue(etype1,eid1,VALUE_TYPE_HP,0)
	local htype,damage = BossDamage(etype1,eid1,1)
	MagicHurtAttack(7129,etype1,eid1,htype,damage,unpack(victim))
end
--群体变身
function OnUseSkill_7130(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_getbufflevel(list[i],list[i+1],10611) == 0 then
				if s_getTrafficType(list[i+1]) == TrafficType_Horse then
					s_resetTrafficType(list[i+1])
				end
				s_addbuff(list[i],list[i+1],10611,1,15)
			end
		end
	end
	ShowAttack(7130,etype1,eid1,etype2,eid2)
end
--空间撕裂
function OnUseSkill_7131(level,etype1,eid1,etype2,eid2)
	local number = 0
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER and number < 8 then
			number = number + 1
			local posx = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
			local posy = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
			posx = posx + math.random(15,30)
			posy = posy + math.random(15,30)
			s_goto(list[i],list[i+1],posx,posy)
		end
	end
	ShowAttack(7131,etype1,eid1,etype2,eid2)
end
--随机冻结
function OnUseSkill_7132(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,10)
	local num = 0
	for i = 1,table.getn(list), 2 do
		if num == 8 then break end
		if list[i] == SCENE_ENTRY_PLAYER then
			s_addbuff(list[i],list[i+1],20063,1,15)
			num = num + 1
		end
	end
	ShowAttack(7132,etype1,eid1,etype2,eid2)
end
-------------------------------------------------------------------------------
--血肉重生
s_registerNpcHpSkill(7094,20)
function OnUseSkill_7094(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20061) ~= 0 then
		return USE_SKILL_ERROR
	end
	s_addbuff(etype1,eid1,20061,1,10)
	ShowAttack(7094,etype1,eid1,etype2,eid2)
end
--龙威震慑
s_registerNpcHpSkill(7095,30)
function OnUseSkill_7095(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			s_addbuff(list[i],list[i+1],10703,1,5)
		end
	end
	ShowAttack(7095,etype1,eid1,etype2,eid2)
end
--龙之领域
s_registerNpcHpSkill(7096,30)
function OnUseSkill_7096(level,etype1,eid1,etype2,eid2)
	local num = 0
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			s_addbuff(list[i],list[i+1],20063,1,10)
			num = num + 1
			if num >= 3 then break end
		end
	end
	ShowAttack(7096,etype1,eid1,etype2,eid2)
end
--瞬移
s_registerNpcTimeSkill(7097,30)
function OnUseSkill_7097(level,etype1,eid1,etype2,eid2)
	local posx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local posy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
	posx = posx + math.random(25,30)
	posy = posy + math.random(25,30)
	s_goto(etype2,eid2,posx,posy)
	ShowAttack(7097,etype1,eid1,etype2,eid2)
end
--退散
s_registerNpcTimeSkill(7098,30)
function OnUseSkill_7098(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			BeatBack(etype1,eid1,list[i],list[i+1],2,3)
		end
	end
	ShowAttack(7098,etype1,eid1,etype2,eid2)
end
-------------------------------------------------------------------------------
--强化标记
--[[function OnUseSkill_7038(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype2,eid2,20037) == 0 then
		s_addbuff(etype2,eid2,20037,30,10)
	end
	ShowAttack(7038,etype1,eid1,etype2,eid2)
end]]
--毒针
function OnUseSkill_7039(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp >= 0.8 then
		return USE_SKILL_ERROR
	end
	SpeadPoison(etype1,eid1,etype2,eid2,1)
	ShowAttack(7039,etype1,eid1,etype2,eid2)
end
--狂热
function OnUseSkill_7040(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20039) == 0 then
		s_addbuff(etype1,eid1,20039,50,5)
	end
	ShowAttack(7040,etype1,eid1,etype2,eid2)
end
--疯狂射击
function OnUseSkill_7041(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20040) == 0 then
		s_addbuff(etype1,eid1,20040,50,10)
	end
	ShowAttack(7041,etype1,eid1,etype2,eid2)
end
--自由躲闪
function OnUseSkill_7042(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20041) == 0 then
		s_addbuff(etype1,eid1,20041,30,10)
	end
	ShowAttack(7042,etype1,eid1,etype2,eid2)
end
--死亡毒气
function OnUseSkill_7043(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,3)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			table.insert(victim,300)
		end
	end
	DirectAttack(7043,etype1,eid1,unpack(victim))
end
--群体袭击
function OnUseSkill_7044(level,etype1,eid1,etype2,eid2)
	s_seekHelp(eid1,10097,2)
	ShowAttack(7044,etype1,eid1,etype2,eid2)
end
--沙洞陷阱
function OnUseSkill_7045(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype2,eid2,20043) == 0 then
		s_addbuff(etype2,eid2,20043,5,3)
	end
	SpeadPoison(etype1,eid1,etype2,eid2,1)
	ShowAttack(7045,etype1,eid1,etype2,eid2)
end
--致命蛛网
function OnUseSkill_7046(level,etype1,eid1,etype2,eid2)
	SpeadPoison(etype1,eid1,etype2,eid2,1)
	ShowAttack(7046,etype1,eid1,etype2,eid2)
end
--偷袭
function OnUseSkill_7047(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20045) == 0 then
		s_addbuff(etype1,eid1,20045,100,5)
	end
	ShowAttack(7047,etype1,eid1,etype2,eid2)
end
--腐蚀咒语
function OnUseSkill_7048(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype2,eid2,20046) == 0 then
		s_addbuff(etype2,eid2,20046,30,10)
	end
	ShowAttack(7048,etype1,eid1,etype2,eid2)
end
--强力腐蚀咒语
function OnUseSkill_7049(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype2,eid2,20047) == 0 then
		s_addbuff(etype2,eid2,20047,50,10)
	end
	ShowAttack(7049,etype1,eid1,etype2,eid2)
end
--远古尸毒
function OnUseSkill_7050(level,etype1,eid1,etype2,eid2)
	SpeadPoison(etype1,eid1,etype2,eid2,2)
	ShowAttack(7050,etype1,eid1,etype2,eid2)
end
--尸毒爆发
function OnUseSkill_7051(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_checkPK(7051,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				table.insert(victim,0)
				SpeadPoison(etype1,eid1,list[i],list[i+1],3)
			end
		end
	end
	ShowAttack(7051,etype1,eid1,unpack(victim))
end
--空间瞬移
s_registerNpcHpSkill(7052,10)
function OnUseSkill_7052(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,20)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			local stype,sid = s_getselect(list[i],list[i+1])
			if stype == etype1 and sid == eid1 then
				s_select(list[i],list[i+1],0,0)
			end
		end
	end
	local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if math.random(0,100) > 50 then
		posx = posx + math.random(10,20)
		posy = posy + math.random(10,20)
	else
		posx = posx + math.random(-20,-10)
		posy = posy + math.random(-20,-10)
	end
	s_goto(etype1,eid1,posx,posy)
	ShowAttack(7052,etype1,eid1,etype2,eid2)
end
--邪恶诅咒
function OnUseSkill_7054(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype2,eid2,20050) == 0 then
		s_addbuff(etype2,eid2,20050,1,60)
	end
	ShowAttack(7054,etype1,eid1,etype2,eid2)
end
--狂沙漫天
function OnUseSkill_7055(level,etype1,eid1,etype2,eid2)
	local victim ={}
	local list = s_getNineEntry(etype1,eid1,6)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			local damage = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			table.insert(victim,damage *0.2)
			if s_getbufflevel(list[i],list[i+1],10308) == 0 then
				s_addbuff(list[i],list[i+1],10308,1,5)
			end
		end
	end
	DirectAttack(7055,etype1,eid1,unpack(victim))
end
--释放虫卵
function OnUseSkill_7056(level,etype1,eid1,etype2,eid2)
	--local npcid = s_summon(etype1,eid1,10074,1013,1)
	ShowAttack(7056,etype1,eid1,etype2,eid2)
end
--地底冲击
s_registerNpcHpSkill(7057,3)
function OnUseSkill_7057(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			s_addbuff(list[i],list[i+1],10308,1,5)
		end
	end
	ShowAttack(7057,etype1,eid1,etype2,eid2)
end
--狂暴黄沙
s_registerNpcHpSkill(7058,70)
function OnUseSkill_7058(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,20052) == 0 then
		s_addbuff(etype1,eid1,20052,1,60*60)
	end
	ShowAttack(7058,etype1,eid1,etype2,eid2)
end
--怒吼黄沙
function OnUseSkill_7059(level,etype1,eid1,etype2,eid2)
	local victim ={}
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			table.insert(victim,0)
			s_addbuff(list[i],list[i+1],20053,1,10)
		end
	end
	DirectAttack(7059,etype1,eid1,unpack(victim))
end
--杀虫自爆
function OnUseSkill_7060(level,etype1,eid1,etype2,eid2)
	for i = 1,4 do
	--local npcid = s_summon(etype1,eid1,10074,1013,1)
	end
	local victim ={}
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			local damage = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			table.insert(victim,damage *0.8)
		end
	end
	DirectAttack(7060,etype1,eid1,unpack(victim))
end
-------------------------------------------------------------------------------
--召唤树桩怪
s_registerNpcHpSkill(7061,25)
function OnUseSkill_7061(level,etype1,eid1,etype2,eid2)
	local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
	local posx =s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy =s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	for i=0,4 do
		s_sysSummon(22105,cid,posx,posy)
	end
	ShowAttack(7061,etype1,eid1,etype2,eid2)
end
--投掷定时炸弹
s_registerNpcHpSkill(7062,50)
function OnUseSkill_7062(level,etype1,eid1,etype2,eid2)
	local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
	local posx =s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy =s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	for i=0,math.random(3,5) do
		local px = posx + math.random(-5,5)
		local py = posy + math.random(-5,5)
		local npcid = s_sysSummon(22107,cid,px,py)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BONE_INTERVAL,0)
		local time = math.random(5,10)*1000
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,time)
	end
	ShowAttack(7062,etype1,eid1,etype2,eid2)
end
--召唤火堆
s_registerNpcHpSkill(7063,50)
function OnUseSkill_7063(level,etype1,eid1,etype2,eid2)
	local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
	local posx =s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy =s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	for i=0,math.random(5,10) do
		local px = posx + math.random(-5,5)
		local py = posy + math.random(-5,5)
		local npcid = s_sysSummon(22106,cid,px,py)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,10*1000)
	end
	ShowAttack(7063,etype1,eid1,etype2,eid2)
end
--旋风斩
s_registerNpcHpSkill(7064,50)
function OnUseSkill_7064(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,3)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	local bosslevel = 0
	local ctype = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_TYPE)
	if ctype == 2 or ctype == 4 then
		local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
		local level = s_getSceneVar(cid,0,1)
		if level <= 5 then bosslevel = 10 end
		if level <= 10 then bosslevel = 20 end
		if level <= 20 then bosslevel = 30 end
		if level > 20 then bosslevel = 40 end
	end
	local htype,damage = BossDamage(etype1,eid1,1,bosslevel)
	MagicHurtAttack(7064,etype1,eid1,htype,damage,unpack(victim))
end
--禁忌之火
function OnUseSkill_7065(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype2,eid2,8)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			s_addbuff(list[i],list[i+1],10506,1,5)
		end
	end
	ShowAttack(7055,etype1,eid1,etype2,eid2)
end
--树状怪回血
function OnUseSkill_7066(level,etype1,eid1,etype2,eid2)
	local success = 0
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_NPC then
			local baseid =s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
			if baseid == 22105 then
				local hp = s_getValue(list[i],list[i+1],VALUE_TYPE_HP)
				local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
				if hp / maxhp < 0.6 then
					etype2 = list[i]
					eid2 = list[i+1]
					s_addValue(list[i],list[i+1],VALUE_TYPE_HP,VALUE_TYPE_MAXHP*0.8)
					success = 1
					break
				end
			end
		end
	end
	if success == 0 then
		return USE_SKILL_ERROR
	end
	ShowAttack(7066,etype1,eid1,etype2,eid2)
end
--定时炸弹爆炸
function OnUseSkill_7067(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	local bosslevel = 0
	local ctype = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_TYPE)
	if ctype == 2 or ctype == 4 then
		local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
		local level = s_getSceneVar(cid,0,1)
		if level <= 5 then bosslevel = 10 end
		if level <= 10 then bosslevel = 20 end
		if level <= 20 then bosslevel = 30 end
		if level > 20 then bosslevel = 40 end
	end
	local htype,damage = BossDamage(etype1,eid1,1,bosslevel)
	MagicHurtAttack(7067,etype1,eid1,htype,damage,unpack(victim))
end
--火堆灼伤
function OnUseSkill_7068(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,3)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	local bosslevel = 0
	local ctype = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_TYPE)
	if ctype == 2 or ctype == 4 then
		local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
		local level = s_getSceneVar(cid,0,1)
		if level <= 5 then bosslevel = 10 end
		if level <= 10 then bosslevel = 20 end
		if level <= 20 then bosslevel = 30 end
		if level > 20 then bosslevel = 40 end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,1,bosslevel)
		MagicHurtAttack(7068,etype1,eid1,htype,damage,unpack(victim))
	end
end
--震退，无伤害
function OnUseSkill_7069(level,etype1,eid1,etype2,eid2)
	if etype2 == SCENE_ENTRY_PLAYER then
		BeatBack(etype1,eid1,etype2,eid2,2,3)
	end
	ShowAttack(7069,etype1,eid1,etype2,eid2)
end
-------------------------------------------------------------------------------
--流星坠落
s_registerNpcHpSkill(7099,10)
function OnUseSkill_7099(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,2)
		MagicHurtAttack(7099,etype1,eid1,htype,damage,unpack(victim))
	end
end
--灼热之箭
s_registerNpcTimeSkill(7100,20)
function OnUseSkill_7100(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,2)
		MagicHurtAttack(7100,etype1,eid1,htype,damage,unpack(victim))
	end
end
--战栗之箭
function OnUseSkill_7101(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype2,eid2,10703,1,5)
	local htype,damage = BossDamage(etype1,eid1,2)
	MagicHurtAttack(7101,etype1,eid1,htype,damage,etype2,eid2)
end
--乱舞刀刃
s_registerNpcHpSkill(7102,10)
function OnUseSkill_7102(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	local worldlevel=s_getWorldLevel()
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			if s_getbufflevel(list[i],list[i+1],20069) == 0 then
				s_addbuff(list[i],list[i+1],20069,1,120)
			end
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,1,worldlevel*10+50)
		MagicHurtAttack(7102,etype1,eid1,htype,damage,unpack(victim))
	end
end
--隐形遁化
s_registerNpcHpSkill(7103,15)
function OnUseSkill_7103(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype1,eid1,10211,1,15,7103)
	ShowAttack(7103,etype1,eid1,etype2,eid2)
end
--影之刺
function OnUseSkill_7104(level,etype1,eid1,etype2,eid2)
	local etype,eid = GetRandomPlayer(etype1,eid1,etype2,eid2)
	local worldlevel=s_getWorldLevel()
	if etype == SCENE_ENTRY_PLAYER and eid > 0 then
		local x2 = s_getValue(etype,eid,VALUE_TYPE_POSX)
		local y2 = s_getValue(etype,eid,VALUE_TYPE_POSY)
		s_goto(etype1,eid1,x2,y2,0)
		s_addbuff(etype,eid,10703,1,5)
	end
	local htype,damage = BossDamage(etype1,eid1,1,worldlevel*10+50)
	MagicHurtAttack(7104,etype1,eid1,htype,damage,etype2,eid2)
end
--毁灭穿刺
s_registerNpcHpSkill(7105,10)
function OnUseSkill_7105(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	local worldlevel=s_getWorldLevel()
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			if s_getbufflevel(list[i],list[i+1],20069) == 0 then
				s_addbuff(list[i],list[i+1],20069,1,120)
			end
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,1,worldlevel*10+50)
		MagicHurtAttack(7105,etype1,eid1,htype,damage,unpack(victim))
	end
end
--死亡冲撞
s_registerNpcTimeSkill(7106,20)
function OnUseSkill_7106(level,etype1,eid1,etype2,eid2)
	local etype,eid = GetRandomPlayer(etype1,eid1,etype2,eid2)
	local worldlevel=s_getWorldLevel()
	if etype == SCENE_ENTRY_PLAYER and eid > 0 then
		etype2 = etype; eid2 = eid;
	end
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local x2 = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local y2 = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
	if math.abs(x2 - x1) <=15 and math.abs(y2 - y1) <= 15 then
		s_goto(etype1,eid1,x2,y2,1)
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,1,worldlevel*10+50)
		MagicHurtAttack(7106,etype1,eid1,htype,damage,unpack(victim))
	end
end
--连环绞杀
function OnUseSkill_7107(level,etype1,eid1,etype2,eid2)
	local worldlevel=s_getWorldLevel()
	s_addbuff(etype2,eid2,10702,50,5)
	local htype,damage = BossDamage(etype1,eid1,1,worldlevel*10+50)
	MagicHurtAttack(7107,etype1,eid1,htype,damage,etype2,eid2)
end
--针刺扫射
s_registerNpcHpSkill(7108,10)
function OnUseSkill_7108(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	local worldlevel=s_getWorldLevel()
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			if s_getbufflevel(list[i],list[i+1],20069) == 0 then
				s_addbuff(list[i],list[i+1],20069,1,120)
			end
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,1,worldlevel*10+50)
		MagicHurtAttack(7108,etype1,eid1,htype,damage,unpack(victim))
	end
end
--獠牙冲锋
s_registerNpcTimeSkill(7109,40)
function OnUseSkill_7109(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	local worldlevel=s_getWorldLevel()
	for i = 1,table.getn(victim),2 do
		s_addbuff(victim[i],victim[i+1],10702,50,5)
	end
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local x2 = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local y2 = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
	if math.abs(x2 - x1) <=15 and math.abs(y2 - y1) <= 15 then
		s_goto(etype1,eid1,x2,y2,1)
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,1,worldlevel*10+50)
		MagicHurtAttack(7109,etype1,eid1,htype,damage,unpack(victim))
	end
end
--野猪狂暴
s_registerNpcTimeSkill(7110,180)
function OnUseSkill_7110(level,etype1,eid1,etype2,eid2)
	--（每150秒，进入一次狂暴状态，持续30秒。攻击速度提升200%，移动速度提升100%，每次攻击必然触发忽视防御）
	s_addbuff(etype1,eid1,20065,1,10)
	ShowAttack(7110,etype1,eid1,etype2,eid2)
end
--野兽召唤
s_registerNpcHpSkill(7111,30)
function OnUseSkill_7111(level,etype1,eid1,etype2,eid2)
	local npcid = s_summon(etype1,eid1,10039,1013,1)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,10*60*1000)
	local etype,eid,lock = s_getEnemy(eid1)
	s_setEnemy(npcid,etype,eid,VALUE_OK)
	ShowAttack(7111,etype1,eid1,etype2,eid2)
end
--巨石轰击
s_registerNpcHpSkill(7112,10)
function OnUseSkill_7112(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,2)
		MagicHurtAttack(7112,etype1,eid1,htype,damage,unpack(victim))
	end
end
--地震波
s_registerNpcTimeSkill(7113,20)
function OnUseSkill_7113(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,2)
		MagicHurtAttack(7113,etype1,eid1,htype,damage,unpack(victim))
	end
end
--大地之盾
s_registerNpcTimeSkill(7114,180)
function OnUseSkill_7114(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype1,eid1,20067,30,20)
	ShowAttack(7114,etype1,eid1,etype2,eid2)
end
--地狱火降临
s_registerNpcHpSkill(7115,30)
function OnUseSkill_7115(level,etype1,eid1,etype2,eid2)
	local summon = 0
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if summon == 0 then
				summon = 1
				local npcid = s_summon(list[i],list[i+1],10098,1013,1)
				local etype,eid,lock = s_getEnemy(eid1)
				s_setEnemy(npcid,etype,eid,VALUE_OK)
			end
			s_addbuff(list[i],list[i+1],10703,1,3)
		end
	end
	ShowAttack(7115,etype1,eid1,etype2,eid2)
end
--狂暴飓风
s_registerNpcHpSkill(7116,10)
function OnUseSkill_7116(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,1)
		MagicHurtAttack(7116,etype1,eid1,htype,damage,unpack(victim))
	end
end
--台风
s_registerNpcTimeSkill(7117,20)
function OnUseSkill_7117(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	for i = 1,table.getn(victim),2 do
		s_addbuff(victim[i],victim[i+1],10702,50,5)
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,1)
		MagicHurtAttack(7117,etype1,eid1,htype,damage,unpack(victim))
	end
end
--暴风闪电
s_registerNpcTimeSkill(7118,120)
function OnUseSkill_7118(level,etype1,eid1,etype2,eid2)
	s_addbuff(eytpe2,eid2,20066,1,10,eid1)
	ShowAttack(7118,etype1,eid1,etype2,eid2)
end
--火山爆发
s_registerNpcHpSkill(7119,10)
function OnUseSkill_7119(level,etype1,eid1,etype2,eid2)
	local npcid = s_summon(etype1,eid1,10101,1012,1)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,5*1000)
	ShowAttack(7119,etype1,eid1,etype2,eid2)
end
--小弟火山爆发
function OnUseSkill_7133(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_getValue(list[i],list[i+1],VALUE_TYPE_HP) ~= 0 then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
			end
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,4)
		MagicHurtAttack(5502,etype1,eid1,htype,damage,unpack(victim))
	end
end

--火焰打击
function OnUseSkill_7178(level,etype1,eid1,etype2,eid2)
	local htype,damage = BossDamage(etype1,eid1,4)
	MagicHurtAttack(7178,etype1,eid1,htype,damage,etype2,eid2)
end

--烈焰壕沟
s_registerNpcTimeSkill(7120,20)
function OnUseSkill_7120(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,2)
		MagicHurtAttack(7120,etype1,eid1,htype,damage,unpack(victim))
	end
end
--火焰深渊
s_registerNpcTimeSkill(7121,180)
function OnUseSkill_7121(level,etype1,eid1,etype2,eid2)
	local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
	local posx =s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy =s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	for i=1,3 do
		local px = posx + math.random(-5,5)
		local py = posy + math.random(-5,5)
		local npcid = s_sysSummon(10100,cid,px,py)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,10*1000)
	end
	ShowAttack(7121,etype1,eid1,etype2,eid2)
end
--龙王摆尾
s_registerNpcHpSkill(7122,10)
function OnUseSkill_7122(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	local worldlevel=s_getWorldLevel()
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,4,worldlevel*10+50)
		MagicHurtAttack(7122,etype1,eid1,htype,damage,unpack(victim))
	end
end
--X 龙爆发
s_registerNpcTimeSkill(7123,180)
function OnUseSkill_7123(level,etype1,eid1,etype2,eid2)
	local rand = math.random(1,100)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	local worldlevel=s_getWorldLevel()
	for i = 1,table.getn(victim),2 do
		if rand <= 33 then
		elseif rand <= 66 then
			s_addbuff(victim[i],victim[i+1],10502,1,5)
		else
			s_addbuff(victim[i],victim[i+1],20003,1,5,999999)
		end
	end
	if table.getn(victim) > 0 then
		if rand <= 33 then
			local htype,damage = BossDamage(etype1,eid1,4,worldlevel*10+50)
			MagicHurtAttack(7123,etype1,eid1,htype,damage,unpack(victim))
		elseif rand <= 66 then
			local htype,damage = BossDamage(etype1,eid1,4,worldlevel*10+50)
			MagicHurtAttack(7124,etype1,eid1,htype,damage,unpack(victim))
		else
			local htype,damage = BossDamage(etype1,eid1,4,worldlevel*10+50)
			MagicHurtAttack(7125,etype1,eid1,htype,damage,unpack(victim))
		end
	end
end
--震退
s_registerNpcTimeSkill(7134,30)
function OnUseSkill_7134(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,5)
	local occupycountry = s_getValue(etype1,eid1,VALUE_TYPE_NPC_COUNTRY)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 or list[i+1] ~= eid1 then
			if s_checkPK(7134,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				if list[i] == SCENE_ENTRY_PLAYER then
					local homeland = s_getValue(list[i],list[i+1],VALUE_TYPE_HOMELAND)
					if occupycountry ~= homeland then
						BeatBack(etype1,eid1,list[i],list[i+1],3,1)
					end
				elseif list[i] == SCENE_ENTRY_NPC then
					local master = s_getValue(list[i],list[i+1],VALUE_TYPE_MASTER)
					local homeland = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
					if occupycountry ~= homeland then
						BeatBack(etype1,eid1,list[i],list[i+1],3,1)
					end
				end
			end
		end
	end
	ShowAttack(7134,etype1,eid1,etype2,eid2)
end
--野蛮咆哮
s_registerNpcTimeSkill(7135,60)
function OnUseSkill_7135(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,5)
	local occupycountry = s_getValue(etype1,eid1,VALUE_TYPE_NPC_COUNTRY)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 or list[i+1] ~= eid1 then
			if s_getbufflevel(list[i],list[i+1],20068) == 0 then
				if list[i] == SCENE_ENTRY_PLAYER then
					local homeland = s_getValue(list[i],list[i+1],VALUE_TYPE_HOMELAND)
					if occupycountry ~= homeland then
						s_addbuff(list[i],list[i+1],20068,30,30)
						ShowAttack(7135,etype1,eid1,list[i],list[i+1])
					end
				elseif list[i] == SCENE_ENTRY_NPC then
					local master = s_getValue(list[i],list[i+1],VALUE_TYPE_MASTER)
					local homeland = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
					if occupycountry ~= homeland then
						s_addbuff(list[i],list[i+1],20068,30,30)
						ShowAttack(7135,etype1,eid1,list[i],list[i+1])
					end
				end
			end
		end
	end
end
--横扫千军
s_registerNpcTimeSkill(7136,10)
function OnUseSkill_7136(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,12)
	local occupycountry = s_getValue(etype1,eid1,VALUE_TYPE_NPC_COUNTRY)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 or list[i+1] ~= eid1 then
			if list[i] == SCENE_ENTRY_PLAYER then
				local homeland = s_getValue(list[i],list[i+1],VALUE_TYPE_HOMELAND)
				if occupycountry ~= homeland then
					table.insert(victim,list[i])
					table.insert(victim,list[i+1])
					local hurt = GetIntPart(s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)*0.1)
					table.insert(victim,hurt)
				end
			end
		end
	end
	DirectAttack(7136,etype1,eid1,unpack(victim))
end
-------------------------------------------------------------------------------
--南瓜直伤
function OnUseSkill_7137(level,etype1,eid1,etype2,eid2)
	local etype,eid = GetRandomPlayer(etype1,eid1,etype2,eid2)
	if etype == SCENE_ENTRY_PLAYER and eid > 0 then
		local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
		local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
		s_goto(etype,eid,x1,y1,2)
		local htype,damage = BossDamage(etype1,eid1,2)
		MagicHurtAttack(7137,etype1,eid1,htype,damage,etype2,eid2)
	end
end
--南瓜群攻
s_registerNpcHpSkill(7138,10)
function OnUseSkill_7138(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,1)
		MagicHurtAttack(7138,etype1,eid1,htype,damage,unpack(victim))
	end
end
--南瓜支线攻击
s_registerNpcTimeSkill(7139,30)
function OnUseSkill_7139(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	local htype,damage = BossDamage(etype1,eid1,1)
	MagicHurtAttack(7139,etype1,eid1,htype,damage,unpack(victim))
end
-------------------------------------------------------------------------------
--扑克魔法
function OnUseSkill_7140(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			if math.random(1,100) <= 4 then
				s_addbuff(list[i],list[i+1],20110,1,10)
			end
			if table.getn(victim) >= 6 then break end
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,1)
		MagicHurtAttack(7140,etype1,eid1,htype,damage,unpack(victim))
	end
end
--小丑的眼泪
function OnUseSkill_7141(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			s_addbuff(list[i],list[i+1],20111,1,15)
		end
	end
	ShowAttack(7141,etype1,eid1,etype2,eid2)
end
--哭泣面具
function OnUseSkill_7142(level,etype1,eid1,etype2,eid2)
	local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
	local posx =s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy =s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	for i=0,5 do
		local px = posx + math.random(-10,10)
		local py = posy + math.random(-10,10)
		local npcid = s_sysSummon(22914,cid,px,py)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*1000)
	end
	s_removebuff(etype1,eid1,20113)
	s_addbuff(etype1,eid1,20112,1,60)
	ShowAttack(7142,etype1,eid1,etype2,eid2)
end
--欢乐面具
function OnUseSkill_7143(level,etype1,eid1,etype2,eid2)
	local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
	local posx =s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy =s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	for i=0,5 do
		local px = posx + math.random(-10,10)
		local py = posy + math.random(-10,10)
		local npcid = s_sysSummon(22915,cid,px,py)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*1000)
	end
	s_removebuff(etype1,eid1,20112)
	s_addbuff(etype1,eid1,20113,1,60)
	ShowAttack(7143,etype1,eid1,etype2,eid2)
end
--破碎水晶球
s_registerNpcTimeSkill(7143,60)
function OnUseSkill_7144(level,etype1,eid1,etype2,eid2)
	local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
	local posx =s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy =s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	for i=0,5 do
		local px = posx + math.random(-10,10)
		local py = posy + math.random(-10,10)
		local npcid = s_sysSummon(22917,cid,px,py)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*1000)
	end
	ShowAttack(7144,etype1,eid1,etype2,eid2)
end
--嬉戏火焰
s_registerNpcTimeSkill(7143,45)
function OnUseSkill_7145(level,etype1,eid1,etype2,eid2)
	local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
	local posx =s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy =s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	for i=0,5 do
		local px = posx + math.random(-10,10)
		local py = posy + math.random(-10,10)
		local npcid = s_sysSummon(22918,cid,px,py)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,30*1000)
	end
	ShowAttack(7145,etype1,eid1,etype2,eid2)
end
-------------------------------------------------------------------------------
--普功
function OnUseSkill_7146(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
			table.insert(victim,maxhp*0.02)
		end
	end
	DirectAttack(7146,etype1,eid1,unpack(victim))
end
--阎魔咆哮
function OnUseSkill_7147(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			BeatBack(etype1,eid1,list[i],list[i+1],15,1)
		end
	end
	ShowAttack(7147,etype1,eid1,etype2,eid2)
end
--神魔灭杀
function OnUseSkill_7148(level,etype1,eid1,etype2,eid2)
	local range = {}
	local step = {0.8,0.6,0.4,0.2}
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local posx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local posy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
	posx,posy = GetFarEntryPosition(x1,y1,posx,posy,10)
	for i = 1,table.getn(step) do
		local x = x1 * step[i] + (1 - step[i]) * posx
		local y = y1 * step[i] + (1 - step[i]) * posy
		table.insert(range,x)
		table.insert(range,y)
	end
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,15)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
			local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
			for j = 1,table.getn(range),2 do
				local dst = math.sqrt((entry_x-range[j])^2 + (entry_y-range[j+1])^2)
				if dst < 3 then
					table.insert(victim,list[i])
					table.insert(victim,list[i+1])
					local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
					table.insert(victim,maxhp*0.05)
					break
				end
			end
		end
	end
	DirectAttack(7148,etype1,eid1,unpack(victim))
end
--森罗万象
function OnUseSkill_7149(level,etype1,eid1,etype2,eid2)
	local maxhp = s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	DirectAttack(7149,etype1,eid1,etype2,eid2,maxhp*0.25)
end
-------------------------------------------------------------------------------
--黑暗打击
function OnUseSkill_7153(level,etype1,eid1,etype2,eid2)
	local worldlevel=s_getWorldLevel()
	local htype,damage = BossDamage(etype1,eid1,4,worldlevel*10+50)
	MagicHurtAttack(7153,etype1,eid1,htype,damage,etype2,eid2)
end
--黑暗震击
s_registerNpcTimeSkill(7154,30)
function OnUseSkill_7154(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local worldlevel=s_getWorldLevel()
	local htype,damage = BossDamage(etype1,eid1,3,worldlevel*10+50)
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			s_addbuff(list[i],list[i+1],10703,1,5)
			BeatBack(etype1,eid1,list[i],list[i+1],2,3)
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	MagicHurtAttack(7154,etype1,eid1,htype,damage,unpack(victim))
end
--黑暗封锁
s_registerNpcTimeSkill(7155,40)
function OnUseSkill_7155(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype2,eid2,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			etype2 = list[i]
			eid2 = list[i+1]
			break
		end
	end
	local npcid = s_summon(etype2,eid2,20501,105,1)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,6*1000)
	local list = s_getNineEntry(etype2,eid2,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			s_addbuff(list[i],list[i+1],10507,100,6)
		end
	end
	ShowAttack(7155,etype1,eid1,etype2,eid2)
end
--魔法吸收
s_registerNpcHpSkill(7156,15)
function OnUseSkill_7156(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype1,eid1,20207,1,30)
	ShowAttack(7156,etype1,eid1,etype2,eid2)
end
--黑暗治愈术
s_registerNpcHpSkill(7157,20)
function OnUseSkill_7157(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype1,eid1,20216,1,10)
	ShowAttack(7157,etype1,eid1,etype2,eid2)
end
--黑暗封锁小弟
function OnUseSkill_7177(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local htype,damage = BossDamage(etype1,eid1,1)
	local list = s_getNineEntry(etype2,eid2,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	MagicHurtAttack(7177,etype1,eid1,htype,damage,unpack(victim))
end

--伤害反射
s_registerNpcHpSkill(7182,15)
function OnUseSkill_7182(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype1,eid1,20355,200,15)
	ShowAttack(7182,etype1,eid1,etype2,eid2)
end

--强力廉击
s_registerNpcTimeSkill(7181,20)
function OnUseSkill_7181(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local htype,damage = BossDamage(etype1,eid1,3)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			BeatBack(etype1,eid1,list[i],list[i+1],5,3)
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	MagicHurtAttack(7181,etype1,eid1,htype,damage,unpack(victim))
end

--死亡缠绕
s_registerNpcHpSkill(7180,10)
function OnUseSkill_7180(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,15)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			s_addbuff(list[i],list[i+1],20354,1,5)
			SpeadPoison(etype1,eid1,list[i],list[i+1],4)
		end
	end
	MagicHurtAttack(7180,etype1,eid1,htype,0,unpack(victim))
end

--模拟战NPC暴击技能
function OnUseSkill_7183(level,etype1,eid1,etype2,eid2)
	local maxhp1 = s_getValue(etype1, eid1, VALUE_TYPE_MAXHP)
	local hp1 = s_getValue(etype1, eid1, VALUE_TYPE_HP)
	local maxhp2 = s_getValue(etype2, eid2, VALUE_TYPE_MAXHP)
	local hp2 = s_getValue(etype2, eid2, VALUE_TYPE_HP)

	local x1 = hp1*100/maxhp1
	local x2 = hp2*100/maxhp2

	local hurtx = 0
	if x2 > x1 then
		hurtx = x2-x1+1
	end

	local hurt = math.floor(maxhp2*hurtx/100)
	DirectAttack(7183,etype1,eid1,etype2,eid2,hurt)
end

--魔甲boss普攻技能
function OnUseSkill_6207(level,etype1,eid1,etype2,eid2)
	if etype2 == SCENE_ENTRY_PLAYER then
		return USE_SKILL_ERROR
	end
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	local mod = {{1.0, 1.0, 2.0},
		{2.0, 1.0, 1.0},
		{1.0, 2.0, 1.0}}
	local modval = 1.0
	local et1 = 0
	if s_getbufflevel(etype1,eid1,20356) ~= 0 then
		et1 = 1
	elseif s_getbufflevel(etype1,eid1,20357) ~= 0 then
		et1 = 2
	elseif s_getbufflevel(etype1,eid1,20358) ~= 0 then
		et1 = 3
	end
	local et2 = s_getValue(etype2,eid2,VALUE_TYPE_ARMY_EQUIP_TYPE)
	if et1 <= 3 and et2 <= 3 and et2 ~= 0 and et1 ~= 0 then
		modval = mod[et1][et2]
	end
	MAGIC_ATTACK_PERCENT_VALUE = modval * 10000
	MagicAttack(6207,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,damage)
end

--魔甲boss伤害吸收
s_registerNpcTimeSkill(7184,80)
function OnUseSkill_7184(level,etype1,eid1,etype2,eid2)
	s_removebuff(etype1,eid1,20359)
	s_addbuff(etype1,eid1,20359,1,20)
	ShowAttack(7184,etype2,eid2,etype1,eid1)
end

--魔甲boss大炮攻击
s_registerNpcTimeSkill(7185,60)
function OnUseSkill_7185(level,etype1,eid1,etype2,eid2)
	if etype2 == SCENE_ENTRY_PLAYER then
		return USE_SKILL_ERROR
	end
	local et = s_getValue(etype2,eid2,VALUE_TYPE_ARMY_EQUIP_TYPE)
	if et == 0 then
		return USE_SKILL_ERROR
	end
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		local et1 = s_getValue(list[i],list[i+1],VALUE_TYPE_ARMY_EQUIP_TYPE)
		if et1 <= 3 and et1 ~= 0 then
			s_kickAnybody(list[i],list[i+1])
			DirectAttack(7185,etype1,eid1,list[i],list[i+1],5250)
		end
	end
end

--盾舞
s_registerNpcTimeSkill(7187,40)
function OnUseSkill_7187(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local htype,damage = BossDamage(etype1,eid1,1)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_getbufflevel(list[i],list[i+1],18) == 0 then
				BeatBack(etype1,eid1,list[i],list[i+1],5,3)
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				if math.random(1,100) <=5 then
					s_addbuff(list[i],list[i+1],10703,1,5)
				end
			end
		end
	end
	MagicHurtAttack(7187,etype1,eid1,htype,damage,unpack(victim))
end

--反射盾
s_registerNpcTimeSkill(7188,60)
function OnUseSkill_7188(level,etype1,eid1,etype2,eid2)
	s_removebuff(etype1,eid1,20362)
	s_addbuff(etype1,eid1,20362,100,15)
	ShowAttack(7188,etype2,eid2,etype1,eid1)
end

--7186斩神剑
s_registerNpcTimeSkill(7186,20)
function OnUseSkill_7186(level,etype1,eid1,etype2,eid2)
	local range = {}
	local step = {0.8,0.6,0.4,0.2}
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local posx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local posy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
	posx,posy = GetFarEntryPosition(x1,y1,posx,posy,10)
	for i = 1,table.getn(step) do
		local x = x1 * step[i] + (1 - step[i]) * posx
		local y = y1 * step[i] + (1 - step[i]) * posy
		table.insert(range,x)
		table.insert(range,y)
	end
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,15)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
			local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
			for j = 1,table.getn(range),2 do
				local dst = math.sqrt((entry_x-range[j])^2 + (entry_y-range[j+1])^2)
				if dst < 3 then
					if s_getbufflevel(list[i],list[i+1],18) == 0 then
						table.insert(victim,list[i])
						table.insert(victim,list[i+1])
						--                    local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
						--					列攻击，该列目标受到自身获得战功*200的直接伤害
						local warpoint = CopySceneInfo_73:GetUserVar(list[i+1],ArUser_WarPoint)
						table.insert(victim,warpoint*200)
						break
					end
				end
			end
		end
	end
	DirectAttack(7186,etype1,eid1,unpack(victim))
end

--山岭巨人
--横扫大地
s_registerNpcTimeSkill(7192,20)
function OnUseSkill_7192(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local htype,damage = BossDamage(etype1,eid1,3)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			--BeatBack(etype1,eid1,list[i],list[i+1],5,3)
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	MagicHurtAttack(7192,etype1,eid1,htype,damage,unpack(victim))
end
--大地震击
s_registerNpcHpSkill(7193,10)
function OnUseSkill_7193(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,2)
		MagicHurtAttack(7193,etype1,eid1,htype,damage,unpack(victim))
	end
end
--远古翼龙
--火焰喷射
s_registerNpcTimeSkill(7194,20)
function OnUseSkill_7194(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	local worldlevel=s_getWorldLevel()
	if table.getn(victim) > 0 then
		local htype,damage = BossDamage(etype1,eid1,3,worldlevel*10+50)
		MagicHurtAttack(7194,etype1,eid1,htype,damage,unpack(victim))
	end
end
--陨石坠落
s_registerNpcHpSkill(7195,10)
function OnUseSkill_7195(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local worldlevel=s_getWorldLevel()
	local htype,damage = BossDamage(etype1,eid1,3,worldlevel*10+50)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			--BeatBack(etype1,eid1,list[i],list[i+1],5,3)
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	MagicHurtAttack(7195,etype1,eid1,htype,damage,unpack(victim))
end

--国战岩浆 拒敌技能
function OnUseSkill_44019(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			BeatBack(etype1,eid1,list[i],list[i+1],5,3)
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	MagicHurtAttack(44019,etype1,eid1,0,math.floor(0.5*damage),unpack(victim))
end

--宫殿战主神普攻
function OnUseSkill_7219(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	local damage = 0
	for i = 1,table.getn(list), 2 do
		--        if list[i] == SCENE_ENTRY_PLAYER then
		if list[i] ~= etype1 and list[i+1] ~= eid1 then
			if s_checkPK(7219,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
				table.insert(victim,math.floor(maxhp*0.02))
			end
		end
	end
	DirectAttack(7219,etype1,eid1,unpack(victim))
end

--宫殿战主神范围打退技能
function OnUseSkill_7220(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 and list[i+1] ~= eid1 then
			if s_checkPK(7220,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				BeatBack(etype1,eid1,list[i],list[i+1],5,3)
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
			end
		end
	end
	MagicHurtAttack(7220,etype1,eid1,0,math.floor(1.5*damage),unpack(victim))
end

--宫殿战主神范围攻击技能
function OnUseSkill_7221(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 and list[i+1] ~= eid1 then
			if s_checkPK(7221,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
				table.insert(victim,math.floor(maxhp*0.1))
			end
		end
	end
	DirectAttack(7221,etype1,eid1,unpack(victim))
	--	MagicHurtAttack(7221,etype1,eid1,0,math.floor(3*damage),unpack(victim))
end

--宫殿战主神范围召唤士兵技能
s_registerNpcTimeSkill(7222,300)
function OnUseSkill_7222(level,etype1,eid1,etype2,eid2)
	local cid = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_ID)
	local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local rand = math.random(20,40)
	local npcid = 0
	for i=1,rand do
		npcid = s_sysSummon(22994,cid,posx,posy,1059)
		if npcid ~= 0 and npcid ~= nil then
			s_addGroup(SCENE_ENTRY_NPC,npcid,18)
		end
	end
	ShowAttack(7222,etype1,eid1,etype1,eid1)
end

--机甲散弹炮
function OnUseSkill_7223(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	local damage = 0
	local num = 0
	for i = 1,table.getn(list), 2 do
		if num == 3 then
			break
		end
		if list[i] ~= etype1 and list[i+1] ~= eid1 then
			if s_checkPK(7223,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
				table.insert(victim,maxhp*0.01)
				num = num+1
			end
		end
	end
	DirectAttack(7223,etype1,eid1,unpack(victim))
end

--地雷区
function OnUseSkill_7224(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,3)
	local damage = 0
	local num = 0
	for i = 1,table.getn(list), 2 do
		if num == 3 then
			break
		end
		if list[i] ~= etype1 and list[i+1] ~= eid1 then
			if s_checkPK(7224,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
				table.insert(victim,maxhp*0.3)
				num = num+1
			end
		end
	end
	DirectAttack(7224,etype1,eid1,unpack(victim))
end

--机甲狙击手
function OnUseSkill_7225(level,etype1,eid1,etype2,eid2)
	local damage = 0.2 * s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	DirectAttack(7225,etype1,eid1,etype2,eid2,damage)
end

--控件扭曲
function OnUseSkill_7226(level,etype1,eid1,etype2,eid2)
	local posx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local posy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
	posx = posx + math.random(25,30)
	posy = posy + math.random(25,30)
	s_goto(etype2,eid2,posx,posy)
	ShowAttack(7226,etype1,eid1,etype2,eid2)
end

--魔法塔
function OnUseSkill_7228(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 and list[i+1] ~= eid1 then
			if s_getbufflevel(list[i],list[i+1],10716) == 0 then
				if s_getTrafficType(list[i+1]) == TrafficType_InHorse then
					s_resetTrafficType(list[i+1])
				end
				if s_getTrafficType(list[i+1]) == TrafficType_Horse then
					s_resetTrafficType(list[i+1])
				end
				s_addbuff(list[i],list[i+1],10611,1,10)
				s_addbuff(list[i],list[i+1],10716,1,30)
				s_addbuff(list[i],list[i+1],10717,1,10)
				ShowAttack(7228,etype1,eid1,list[i],list[i+1])
				break
			end
		end
	end
end

--生命泉
function OnUseSkill_7230(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 and list[i+1] ~= eid1 then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
			local hp = s_getValue(list[i],list[i+1],VALUE_TYPE_HP)
			if hp+math.floor(maxhp*0.05) < maxhp then
				s_setValue(list[i],list[i+1],VALUE_TYPE_HP, hp+math.floor(maxhp*0.05))
			else
				s_setValue(list[i],list[i+1],VALUE_TYPE_HP,maxhp)
			end
		end
	end
	MagicHurtAttack(7230,etype1,eid1,0,0,unpack(victim))
end

--泰坦巨人1
function OnUseSkill_7232(level,etype1,eid1,etype2,eid2)
	local damage = 0.25 * s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	DirectAttack(7232,etype1,eid1,etype2,eid2,damage)
end

--泰坦巨人2
function OnUseSkill_7233(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,15)
	local victim = {}
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 and list[i+1] ~= eid1 then
			if math.random(1,100) <= 50 then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				table.insert(victim,0)
				--AddBuffToPair(list[i],list[i+1],buff,1,5)
				s_addbuff(list[i],list[i+1],43,1,5)
			end
		end
	end
	s_attack(7233,etype1,eid1,0,0,unpack(victim))
end
--剧毒喷雾
function OnUseSkill_7236(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,3)
	local damage = 0
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 and list[i+1] ~= eid1 and list[i] == SCENE_ENTRY_PLAYER then
			if s_checkPK(7236,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				local hp = s_getValue(list[i],list[i+1],VALUE_TYPE_HP)
				table.insert(victim,hp)
			end
		end
	end
	DirectAttack(7236,etype1,eid1,unpack(victim))
end
