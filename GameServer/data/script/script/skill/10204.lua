--荼毒
function OnUseSkill_10204(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype1,eid1,10204,level,60)
	ShowAttack(10204,etype1,eid1,etype2,eid2)
end
