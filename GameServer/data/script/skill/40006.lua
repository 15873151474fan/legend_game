--宠物技能，合体
function OnUseSkill_Join(skill,level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == nil or demonid == 0 then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,6) ~= 0 then
		s_unjoindemon(eid1)
	else
		s_joindemon(eid1)
	end
	ShowAttack(skill,etype1,eid1,etype2,eid2)
end
function OnUseSkill_40006(level,etype1,eid1,etype2,eid2)
	OnUseSkill_Join(40006,level,etype1,eid1,etype2,eid2)
end
function OnUseSkill_40007(level,etype1,eid1,etype2,eid2)
	OnUseSkill_Join(40007,level,etype1,eid1,etype2,eid2)
end
function OnUseSkill_40008(level,etype1,eid1,etype2,eid2)
	OnUseSkill_Join(40008,level,etype1,eid1,etype2,eid2)
end
