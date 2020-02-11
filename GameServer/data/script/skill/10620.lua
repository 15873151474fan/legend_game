--时光倒流
function OnUseSkill_10620(level,etype1,eid1,etype2,eid2)
	if etype2 == SCENE_ENTRY_NPC then
		s_sysInfo(eid1,"此技能无法对非玩家对象使用")
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype2,eid2,10725) ~= 0 then
		s_sysInfo(eid1,"对方处于免疫状态，稍后再试")
		return USE_SKILL_ERROR
	end

	s_clearSkillCold(etype2,eid2)
	if eid2 == eid1 then
		s_setcold(eid1,10620)
	end

	s_addbuff(etype2,eid2,10725,level,60*5)

	ShowAttack(10620,etype1,eid1,etype2,eid2)
end
