--宠物技能，巨吼
function OnUseSkill_40111(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	demonid = s_getcurdemon(eid2)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	s_resetTrafficType(eid2)
	--添加不可骑乘buff
	s_addbuff(etype2,eid2,1017,1,10)
	ShowAttack(40111,etype1,eid1,etype2,eid2)
end
