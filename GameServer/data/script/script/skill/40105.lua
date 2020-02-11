--宠物技能，加速
function OnUseSkill_40105(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,1014) ~= 0 then
		s_removebuff(etype1,eid1,1014)
	end
	s_addbuff(etype1,eid1,1014,1,10)
	ShowAttack(40105,etype1,eid1,etype2,eid2)
end
