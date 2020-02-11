--灼热辐射
function OnUseSkill_10416(level,etype1,eid1,etype2,eid2)
	local value = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	s_addbuff(etype1,eid1,10416,level,20,value)
	ShowAttack(10416,etype1,eid1,etype1,eid1)
end
