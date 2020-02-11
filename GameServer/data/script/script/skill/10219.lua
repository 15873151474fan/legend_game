--吸血连击
function OnUseSkill_10219(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype1,eid1,10219,level,10)
	ShowAttack(10219,etype1,eid1,etype1,eid1)
end
