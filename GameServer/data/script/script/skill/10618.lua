--加速药剂
function OnUseSkill_10618(level,etype1,eid1,etype2,eid2)
	local speed = {20,25,30,35,40,45}
	local time = { 10,11,12,13,14,15}

	local list = s_getTeamEntry(etype1,eid1,20)
	for i = 1,table.getn(list), 2 do
		if s_getbufflevel(list[i],list[i+1],10205) == 0 then
			s_removebuff(list[i],list[i+1],10624)
			s_addbuff(list[i],list[i+1],10624,speed[level],time[level])
		end
	end
	ShowAttack(10618,etype1,eid1,etype2,eid2)
end
