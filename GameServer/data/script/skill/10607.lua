--精神恢复
function OnUseSkill_10607(level,etype1,eid1,etype2,eid2)
	local sp = { 80,100,140,180,220,260,300,340,390,440,490}

	s_addValue(etype2,eid2,VALUE_TYPE_SP,sp[level])
	ShowAttack(10607,etype1,eid1,etype2,eid2)
end
