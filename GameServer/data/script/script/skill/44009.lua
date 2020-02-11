--帝都战碉堡攻击
function OnUseSkill_44009(level, etype1, eid1, etype2, eid2)
	if s_checkPK(44009,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
	local equipid = s_getValue(etype1,eid1,VALUE_TYPE_ARMY_EQUIP_ID)
	if equipid == 0 then
		return USE_SKILL_ERROR
	end
	local et2 = s_getValue(etype2,eid2,VALUE_TYPE_ARMY_EQUIP_TYPE)
	if et2 ~= 0 then
		return USE_SKILL_ERROR
	end
	local dtype = { VALUE_TYPE_PDAM, VALUE_TYPE_MDAM, VALUE_TYPE_PDAM, VALUE_TYPE_MDAM, VALUE_TYPE_PDAM, VALUE_TYPE_MDAM }
	local profession = s_getValue(etype1, eid1, VALUE_TYPE_PROFESSION)
	--[[local damage = s_getValue(etype1, eid1, dtype[profession])
	local hit = s_getValue(etype1, eid1, dtype[profession] + 46)
	damage = damage +  math.random(0,hit)]]--
	local et2maxhp = s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	local et2hp = s_getValue(etype2,eid2,VALUE_TYPE_HP)
	local damage = et2maxhp * 0.2
	MagicAttack(44009,dtype[profession],SCENE_ENTRY_NPC,equipid,etype2,eid2,damage)
end
