
--普通（物）
function OnUseSkill_6092(level,etype1,eid1,etype2,eid2)
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	MagicAttack(6092,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,damage)
end

--普通（化）
function OnUseSkill_6093(level,etype1,eid1,etype2,eid2)
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	MagicAttack(6093,VALUE_TYPE_MDAM,etype1,eid1,etype2,eid2,damage)
end

--团BOSS 穿刺
function OnUseSkill_7070(level,etype1,eid1,etype2,eid2)
	local hurt = s_getValue(etype2,eid2,VALUE_TYPE_MAXHP) * 0.15
	if s_getbufflevel(etype2,eid2,20003) ~= 0 then
		s_updateBuffTime(etype2,eid2,20003,10)
	else
		s_addbuff(etype2,eid2,20003,5,10, 999999)
	end
	MagicHurtAttack(7070,etype1,eid1,ATTACK_TYPE_BH,hurt,etype2,eid2)
end

--团BOSS 狂暴
s_registerNpcHpSkill(7071,10)
function OnUseSkill_7071(level,etype1,eid1,etype2,eid2)
	local time = 60
	if level == 2 then
		time = 45
	end
	if s_getbufflevel(etype1,eid1,20054) ~= 0 then
		s_updateBuffTime(etype1,eid1,20054,time)
	else
		s_addbuff(etype1,eid1,20054,1,time)
	end
	local curnumber = 0
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 then
			if s_checkPK(7071,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				curnumber = curnumber + 1
			end
			if curnumber >= 10 then
				break
			end
		end
	end
	MagicHurtAttack(7071,etype1,eid1,ATTACK_TYPE_WH,100,unpack(victim))
end

--团BOSS 横扫一击
function OnUseSkill_7072(level,etype1,eid1,etype2,eid2)
	local curnumber = 0
	local victim = {}
	table.insert(victim,etype2)
	table.insert(victim,eid2)
	BeatBack(etype1,eid1,etype2,eid2,2,3)
	local list = s_getNineEntry(etype2,eid2,5)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 and list[i+1] ~= eid2 then
			if s_checkPK(7072,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				curnumber = curnumber + 1
				BeatBack(etype1,eid1,list[i],list[i+1],2,3)
			end
			if curnumber >= 10 then
				break
			end
		end
	end
	MagicHurtAttack(7072,etype1,eid1,ATTACK_TYPE_HH,1500,unpack(victim))
end

--团BOSS 狂暴(3级)
s_registerNpcHpSkill(7073,10)
function OnUseSkill_7073(level,etype1,eid1,etype2,eid2)
	local time = 60
	if level == 2 then
		time = 45
	end
	s_addbuff(etype1,eid1,20054,1,time)
	local curnumber = 0
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 then
			if s_checkPK(7073,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				curnumber = curnumber + 1
			end
			if curnumber >= 10 then
				break
			end
		end
	end
	MagicHurtAttack(7073,etype1,eid1,ATTACK_TYPE_WH,300,unpack(victim))
end

--团BOSS 横扫一击(3级)
function OnUseSkill_7074(level,etype1,eid1,etype2,eid2)
	local curnumber = 0
	local victim = {}
	table.insert(victim,etype2)
	table.insert(victim,eid2)
	local list = s_getNineEntry(etype2,eid2,5)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 then
			if s_checkPK(7074,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				curnumber = curnumber + 1
				BeatBack(etype1,eid1,list[i],list[i+1],2,3)
			end
			if curnumber >= 10 then
				break
			end
		end
	end
	MagicHurtAttack(7074,etype1,eid1,ATTACK_TYPE_BH,2500,unpack(victim))
end

--团植物 刺手
function OnUseSkill_5515(level,etype1,eid1,etype2,eid2)
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	MagicAttack(5515,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,damage)
end

