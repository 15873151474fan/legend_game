--小队加速
function OnUseSkill_10608(level,etype1,eid1,etype2,eid2)
	local speed = {30,30,30,30,30}
	local time = { 10,15,20,25,30}

	local list = s_getTeamEntry(etype1,eid1,20)
	for i = 1,table.getn(list), 2 do
		s_removebuff(list[i],list[i+1],10608)
		s_addbuff(list[i],list[i+1],10608,speed[level],time[level])
	end
	ShowAttack(10608,etype1,eid1,etype2,eid2)
end
