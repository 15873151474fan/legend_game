--碉堡对军团装备攻击
function OnUseSkill_44003(level, etype1, eid1, etype2, eid2)
	if s_checkPK(44003,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
	local equipid = s_getValue(etype1,eid1,VALUE_TYPE_ARMY_EQUIP_ID)
	if equipid == 0 then
		return USE_SKILL_ERROR
	end
	local et = s_getValue(etype2,eid2,VALUE_TYPE_ARMY_EQUIP_TYPE)
	if et == 0 then
		s_sysInfo(eid1,"团魔甲无法攻击当前目标")
		return USE_SKILL_ERROR
	end
	local damage = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_PDAM)
	MagicAttack(44003,VALUE_TYPE_PDAM,SCENE_ENTRY_NPC,equipid,etype2,eid2,damage)
end

