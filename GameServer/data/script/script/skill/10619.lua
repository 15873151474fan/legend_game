--灵魂锁链
function OnUseSkill_10619(level,etype1,eid1,etype2,eid2)
	s_removebuff(etype1,eid1,10641)
	s_addbuff(etype1,eid1,10641,level,60)
	local list = s_getTeamEntry(etype1,eid1,20)
	for i = 1,table.getn(list), 2 do
		if list[i+1] ~= eid1 then
			s_removebuff(list[i],list[i+1],10641)
			s_addbuff(list[i],list[i+1],10641,level,60)
		end
	end

	ShowAttack(10619,etype1,eid1,etype2,eid2)
end
