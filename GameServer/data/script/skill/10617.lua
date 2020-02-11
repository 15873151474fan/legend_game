--平衡输血
function OnUseSkill_10617(level,etype1,eid1,etype2,eid2)
	if etype2 == SCENE_ENTRY_NPC then
		s_sysInfo(eid1,"此技能无法对非玩家对象使用")
		return USE_SKILL_ERROR
	end
	if etype1 == etype2 and eid1 == eid2 then
		return USE_SKILL_ERROR
	end
	local percent = { 25,30,35,45,50,55}
	if s_checkPK(10614,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		s_sysInfo(eid1,"无法攻击")
		return USE_SKILL_ERROR
	end
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	local value = (maxhp - hp) * percent[level] /100
	local hp2 = s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	if hp2 * percent[level] /100 < value then
		value = hp2 * percent[level] /100
	end
	s_addValue(etype1,eid1,VALUE_TYPE_HP,value)
	DirectAttack(0,etype1,eid1,etype2,eid2,value)

	ShowAttack(10617,etype1,eid1,etype2,eid2)
end
