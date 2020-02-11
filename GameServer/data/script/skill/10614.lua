--平衡输血
function OnUseSkill_10614(level,etype1,eid1,etype2,eid2)
	if etype2 == SCENE_ENTRY_NPC then
		s_sysInfo(eid1,"此技能无法对非玩家对象使用")
		return USE_SKILL_ERROR
	end
	if etype1 == etype2 and eid1 == eid2 then
		return USE_SKILL_ERROR
	end
	local percent = { 25,30,35,45,50,55}
	local value = 1
	local hp1 = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local hp2 = s_getValue(etype2,eid2,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	if hp1 * percent[level] /100 >= maxhp - hp2 then
		value = maxhp - hp2
	else
		value = hp1 * percent[level] /100
	end
	s_addValue(etype2,eid2,VALUE_TYPE_HP,value)
	if value < hp1 then
		s_subValue(etype1,eid1,VALUE_TYPE_HP,value)
	end
	ShowAttack(10614,etype1,eid1,etype2,eid2)
end
