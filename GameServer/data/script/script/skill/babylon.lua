--疯狂践踏
s_registerNpcHpSkill(7200,10)
function OnUseSkill_7200(level,etype1,eid1,etype2,eid2)
	local posx= s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	local htype,damage = BossBabylonDamage(etype1,eid1,3)
	damage = damage * 0.3
	MagicHurtAttack(7200,etype1,eid1,htype,damage,unpack(victim))
end

--BOSS 火山爆发
s_registerNpcHpSkill(7201,10)
function OnUseSkill_7201(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_checkPK(7201,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
			end
		end
	end
	local htype,damage = BossBabylonDamage(etype1,eid1,3)
	damage = damage * 0.3
	MagicHurtAttack(7201,etype1,eid1,htype,damage,unpack(victim))
end

--BOSS 血之壁障
s_registerNpcHpSkill(7202,10)
function OnUseSkill_7202(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_checkPK(7202,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
			end
		end
	end
	local htype,damage = BossBabylonDamage(etype1,eid1,3)
	MagicHurtAttack(7202,etype1,eid1,htype,damage,unpack(victim))
end

--旋风雷暴
s_registerNpcHpSkill(7203,10)
function OnUseSkill_7203(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossBabylonDamage(etype1,eid1,3)
		MagicHurtAttack(7203,etype1,eid1,htype,damage,unpack(victim))
	end
end

--尸毒爆发
s_registerNpcHpSkill(7204,10)
function OnUseSkill_7204(level,etype1,eid1,etype2,eid2)
	local posx= s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	local htype,damage = BossBabylonDamage(etype1,eid1,3)
	MagicHurtAttack(7204,etype1,eid1,htype,damage,unpack(victim))
end


--狂暴黄沙
s_registerNpcHpSkill(7205,10)
function OnUseSkill_7205(level,etype1,eid1,etype2,eid2)
	local posx= s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	local htype,damage = BossBabylonDamage(etype1,eid1,3)
	MagicHurtAttack(7205,etype1,eid1,htype,damage,unpack(victim))
end

--流星坠落
s_registerNpcHpSkill(7206,10)
function OnUseSkill_7206(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossBabylonDamage(etype1,eid1,3)
		damage = damage * 0.3
		MagicHurtAttack(7206,etype1,eid1,htype,damage,unpack(victim))
	end
end

--乱舞刀刃
s_registerNpcHpSkill(7207,10)
function OnUseSkill_7207(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
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
		local htype,damage = BossBabylonDamage(etype1,eid1,3)
		damage = damage * 0.3
		MagicHurtAttack(7207,etype1,eid1,htype,damage,unpack(victim))
	end
end

--针刺扫射
s_registerNpcHpSkill(7208,10)
function OnUseSkill_7208(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
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
		local htype,damage = BossBabylonDamage(etype1,eid1,3)
		damage = damage * 0.3
		MagicHurtAttack(7208,etype1,eid1,htype,damage,unpack(victim))
	end
end

--巨石轰击
s_registerNpcHpSkill(7209,10)
function OnUseSkill_7209(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossBabylonDamage(etype1,eid1,3)
		damage = damage * 0.3
		MagicHurtAttack(7209,etype1,eid1,htype,damage,unpack(victim))
	end
end

--台风
s_registerNpcHpSkill(7210,10)
function OnUseSkill_7210(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossBabylonDamage(etype1,eid1,3)
		MagicHurtAttack(7210,etype1,eid1,htype,damage,unpack(victim))
	end
end

--暴风闪电
s_registerNpcHpSkill(7211,10)
function OnUseSkill_7211(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossBabylonDamage(etype1,eid1,3)
		MagicHurtAttack(7211,etype1,eid1,htype,damage,unpack(victim))
	end
end

--烈焰壕沟
s_registerNpcHpSkill(7212,10)
function OnUseSkill_7212(level,etype1,eid1,etype2,eid2)
	local victim = GetPlayerInLine(etype1,eid1,etype2,eid2)
	if table.getn(victim) > 0 then
		local htype,damage = BossBabylonDamage(etype1,eid1,2)
		MagicHurtAttack(7212,etype1,eid1,htype,damage,unpack(victim))
	end
end

--龙王摆尾
s_registerNpcHpSkill(7213,10)
function OnUseSkill_7213(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossBabylonDamage(etype1,eid1,3)
		damage = damage * 0.3
		MagicHurtAttack(7213,etype1,eid1,htype,damage,unpack(victim))
	end
end

--黑暗震击
s_registerNpcHpSkill(7214,10)
function OnUseSkill_7214(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local htype,damage = BossBabylonDamage(etype1,eid1,3)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			s_addbuff(list[i],list[i+1],10703,1,5)
			BeatBack(etype1,eid1,list[i],list[i+1],2,3)
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	MagicHurtAttack(7214,etype1,eid1,htype,damage,unpack(victim))
end

--强力廉击
s_registerNpcHpSkill(7215,10)
function OnUseSkill_7215(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local htype,damage = BossBabylonDamage(etype1,eid1,3)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			BeatBack(etype1,eid1,list[i],list[i+1],5,3)
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	MagicHurtAttack(7215,etype1,eid1,htype,damage,unpack(victim))
end

--大地震击
s_registerNpcHpSkill(7216,10)
function OnUseSkill_7216(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	if table.getn(victim) > 0 then
		local htype,damage = BossBabylonDamage(etype1,eid1,3)
		damage = damage * 0.3
		MagicHurtAttack(7216,etype1,eid1,htype,damage,unpack(victim))
	end
end

--陨石坠落
s_registerNpcHpSkill(7217,10)
function OnUseSkill_7217(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local htype,damage = BossBabylonDamage(etype1,eid1,3)
	damage = damage * 0.3
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			--BeatBack(etype1,eid1,list[i],list[i+1],5,3)
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
		end
	end
	MagicHurtAttack(7217,etype1,eid1,htype,damage,unpack(victim))
end
