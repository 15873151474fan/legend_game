--任务团魔甲普通攻击
function OnUseSkill_44014(level, etype1, eid1, etype2, eid2)
	if s_checkPK(44014,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
	local equipid = s_getValue(etype1,eid1,VALUE_TYPE_ARMY_EQUIP_ID)
	if equipid == 0 then
		return USE_SKILL_ERROR
	end
	local driver = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_DRIVER)
	if driver == 0 then
		return USE_SKILL_ERROR
	end
	local baseid = s_getValue(SCENE_ENTRY_NPC, equipid, VALUE_TYPE_BASE_ID)
	if baseid ~= 44331 and baseid ~= 44332 and baseid ~= 44333 then
		return USE_SKILL_ERROR
	end
	local damage = 500 + math.random(0,100)
	MagicAttack(44014,VALUE_TYPE_PDAM,SCENE_ENTRY_NPC,equipid,etype2,eid2,damage)
end
