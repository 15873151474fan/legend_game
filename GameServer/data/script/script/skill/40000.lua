--宠物技能，自动拾取
function OnUseSkill_40000(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,1001) ~= 0 then
		s_removebuff(etype1,eid1,1001)
	else
		s_addbuff(etype1,eid1,1001,1,60*60)
	end
	ShowAttack(40000,etype1,eid1,etype2,eid2)
end
