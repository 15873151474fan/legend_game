--狂野大叫
function OnUseSkill_10104(level,etype1,eid1,etype2,eid2)
	local list = s_getTeamEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		for j=10625,10640 do
			s_removebuff(list[i],list[i+1],j)
		end
		s_addbuff(list[i],list[i+1],10625+level-1,level,30)
	end
	if s_getRuneDur(eid1,10104) > 0 then
		s_addbuff(etype1,eid1,20241,10,8)
		s_reduceRuneDur(eid1,10104)
	end
	ShowAttack(10104,etype1,eid1,etype2,eid2)
end
