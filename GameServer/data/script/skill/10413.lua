--熔岩附体
function OnUseSkill_10413(level,etype1,eid1,etype2,eid2)
	local time = {10,12,13,15,16}
	s_addbuff(etype2,eid2,10413,level,time[level])
	ShowAttack(10413,etype1,eid1,etype2,eid2)
end
