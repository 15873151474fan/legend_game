--装备改良
function OnUseSkill_10404(level,etype1,eid1,etype2,eid2)
	local jingshen = s_getValue(etype1,eid1,VALUE_TYPE_JINGSHEN)
	s_removebuff(etype1,eid1,10404)
	s_addbuff(etype1,eid1,10404,level,300,jingshen)
	ShowAttack(10404,etype1,eid1,etype2,eid2)
end
