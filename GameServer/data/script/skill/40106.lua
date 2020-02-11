--宠物技能，加速
function OnUseSkill_40106(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,1015) ~= 0 then
		s_removebuff(etype1,eid1,1015)
	end
	s_addbuff(etype1,eid1,1015,1,15)
	ShowAttack(40106,etype1,eid1,etype2,eid2)
end
