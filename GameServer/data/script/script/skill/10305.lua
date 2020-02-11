--致命要害
function OnUseSkill_10305(level,etype1,eid1,etype2,eid2)
	local jingshen = s_getValue(etype1,eid1,VALUE_TYPE_JINGSHEN)
	s_removebuff(etype1,eid1,10305)
	s_addbuff(etype1,eid1,10305,level,300,jingshen)
	ShowAttack(10305,etype1,eid1,etype2,eid2)
end
