--宠物技能，加速
function OnUseSkill_40005(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,1005) ~= 0 then
		s_removebuff(etype1,eid1,1005)
	end
	s_addbuff(etype1,eid1,1005,1,6)
	ShowAttack(40005,etype1,eid1,etype2,eid2)
end
