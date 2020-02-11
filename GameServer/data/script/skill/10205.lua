--疾跑
function OnUseSkill_10205(level,etype1,eid1,etype2,eid2)
	local speed = {30,35,40,45,50,55}
	local time = {8,10,12,14,17,20}

	s_removebuff(etype1,eid1,10624)
	s_addbuff(etype1,eid1,10205,speed[level],time[level])
	ShowAttack(10205,etype1,eid1,etype2,eid2)
end
