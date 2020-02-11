--生命汲取
function OnUseSkill_10515(level,etype1,eid1,etype2,eid2)
	if etype2 == SCENE_ENTRY_NPC then
		s_sysInfo(eid1,"此技能无法对非玩家对象使用")
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype2,eid2,10720) ~= 0 then
		s_sysInfo(eid1,"对方受生命汲取技能保护中")
		return VALUE_FAIL
	end
	if etype1 == etype2 and eid1 == eid2 then
		return USE_SKILL_ERROR
	end
	local percent = { 25,30,35,40,45}
	if s_checkPK(10515,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		s_sysInfo(eid1,"无法攻击")
		return USE_SKILL_ERROR
	end
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp >= maxhp then
		s_sysInfo(eid1,"当前生命已满，无法使用此技能")
		return USE_SKILL_ERROR
	end
	local hp2 = s_getValue(etype2,eid2,VALUE_TYPE_HP)
	local maxhp2 = s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	local value = maxhp2 * percent[level] /100
	if value > maxhp - hp then
		value = maxhp - hp
	end
	s_addbuff(etype2,eid2,10720,1,150)
	s_addValue(etype1,eid1,VALUE_TYPE_HP,value)
	DirectAttack(0,etype1,eid1,etype2,eid2,value)
	ShowAttack(10515,etype1,eid1,etype2,eid2)
end
