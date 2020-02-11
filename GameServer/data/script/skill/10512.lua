--能量转换
function OnUseSkill_10512(level,etype1,eid1,etype2,eid2)
	local time = {10,15,20,25,30}
	s_addbuff(etype1,eid1,10512,level,time[level])
	ShowAttack(10512,etype1,eid1,etype2,eid2)
end
