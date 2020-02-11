--团魔甲攻击通用函数
function OnUseArmyEquipSkill(id,etype1,eid1,etype2,eid2)
	if s_checkPK(id,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
	local equipid = s_getValue(etype1,eid1,VALUE_TYPE_ARMY_EQUIP_ID)
	if equipid == 0 or etype2 ~= SCENE_ENTRY_NPC then
		return USE_SKILL_ERROR
	end
	local et1 = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_ARMY_EQUIP_TYPE)
	local et2 = s_getValue(etype2,eid2,VALUE_TYPE_ARMY_EQUIP_TYPE)
	local et3 = s_getValue(etype2,eid2,VALUE_TYPE_NPCTYPE)
	if et1 ~= 0 and et2 ~= 0 then
		local mod = { {1.0, 0.3, 1.5},
			{2.0, 1.0, 0.3},
			{0.6, 1.5, 1.0}}
		local damage = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_PDAM)
		local modval = 1.0
		if et1 <=3 and et2 <= 3 then
			modval = mod[et1][et2]
		end
		MAGIC_ATTACK_PERCENT_VALUE = modval * 10000
		MagicAttack(id,VALUE_TYPE_PDAM,SCENE_ENTRY_NPC,equipid,etype2,eid2,damage)
		s_setcold(eid1, id)
		return USE_SKILL_SUCESS
	elseif et3 == NPC_TYPE_EQUIPBOSS then
		local mod = { {0.5, 0.5, 1.0},
			{1.0, 0.5, 0.5},
			{0.5, 1.0, 0.5}}
		local damage = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_PDAM)
		local et4 = 0
		if s_getbufflevel(etype2,eid2,20356) ~= 0 then
			et4 = 1
		elseif s_getbufflevel(etype2,eid2,20357) ~= 0 then
			et4 = 2
		elseif s_getbufflevel(etype2,eid2,20358) ~= 0 then
			et4 = 3
		end
		local modval = 1.0
		if et1 <=3 and et4 ~= 0 then
			modval = mod[et1][et4]
		end
		MAGIC_ATTACK_PERCENT_VALUE = modval * 10000
		if s_getbufflevel(etype2,eid2,20359) == 0 then
			MagicAttack(id,VALUE_TYPE_PDAM,SCENE_ENTRY_NPC,equipid,etype2,eid2,damage)
		else
			local addhp = 0
			local def = s_getValue(etype2,eid2,VALUE_TYPE_PDEF)
			if def < damage then
				addhp = math.floor((damage-def)*modval)
			end
			if addhp ~= 0 then
				s_addValue(etype2,eid2,VALUE_TYPE_HP,addhp)
				s_showAddHp(etype2,eid2,etype2,eid2,addhp)
			end
			--			MagicAttack(id,VALUE_TYPE_PDAM,SCENE_ENTRY_NPC,equipid,etype2,eid2,0)
			ShowAttack(id,etype1,eid1,etype2,eid2)
			--			ShowAttack(7184,etype2,eid2,etype1,eid1)
		end
		s_setcold(eid1, id)
		return USE_SKILL_SUCESS
	else
		s_sysInfo(eid1,"团魔甲无法攻击当前目标")
		return USE_SKILL_ERROR
	end
end

--蝎型兽攻击
function OnUseSkill_44005(level, etype1, eid1, etype2, eid2)
	return OnUseArmyEquipSkill(44005,etype1,eid1,etype2,eid2)
end

--铁魔人攻击
function OnUseSkill_44006(level, etype1, eid1, etype2, eid2)
	return OnUseArmyEquipSkill(44006,etype1,eid1,etype2,eid2)
end

--空行者攻击
function OnUseSkill_44007(level, etype1, eid1, etype2, eid2)
	return OnUseArmyEquipSkill(44007,etype1,eid1,etype2,eid2)
end

--蝎型兽光环 20101 2001
function OnUseSkill_44011(level, etype1, eid1, etype2, eid2)
end

--铁魔人机枪射击
function OnUseSkill_44012(level, etype1, eid1, etype2, eid2)
	if etype1 ~= SCENE_ENTRY_PLAYER or etype2 ~= SCENE_ENTRY_PLAYER then
		return USE_SKILL_ERROR
	end
	if s_checkPK(44012,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
	local equipid = s_getValue(etype1,eid1,VALUE_TYPE_ARMY_EQUIP_ID)
	if equipid == 0 then
		return USE_SKILL_ERROR
	end
	local et1 = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_ARMY_EQUIP_TYPE)
	if et1 ~= 2 then
		return USE_SKILL_ERROR
	end
	local elevel = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_LEVEL)
	if elevel < 1 or elevel > 5 then
		elevel = 1
		s_debug("铁魔人NPC等级配置错误")
	end
	local quality = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_ARMY_EQUIP_QUALITY)
	local DValue = { {200,240,280,340,400}, {400,450,500,550,600}, {600,675,750,825,900},
		{800,900,1000,1100,1200}, {1000,1125,1250,1375,1500} }
	local damage = DValue[elevel][quality]
	ArmyEquipAttack(44012,SCENE_ENTRY_NPC,equipid,etype2,eid2,damage)
	s_setcold(eid1, 44012)
end

--空行者 速度
function OnUseSkill_44013(level, etype1, eid1, etype2, eid2)
end

