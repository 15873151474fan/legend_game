--聚气连击(作废)
function OnUseSkill_10213(level,etype1,eid1,etype2,eid2)
	local num = s_getbuffnum(etype1,eid1,10201)
	if num == 0 then
		return USE_SKILL_ERROR
	end
	s_removebuff(etype1,eid1,10201)
	s_addbuff(etype1,eid1,10202,1,30)
	ShowAttack(10213,etype1,eid1,etype2,eid2)
end
