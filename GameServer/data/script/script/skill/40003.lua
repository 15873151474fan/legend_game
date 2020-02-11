--宠物技能，自动打怪
function OnUseSkill_40003(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,1004) ~= 0 then
		s_removebuff(etype1,eid1,1004)
	else
		s_addbuff(etype1,eid1,1004,1,60*60)
	end
	ShowAttack(40003,etype1,eid1,etype2,eid2)
end
