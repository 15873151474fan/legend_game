--兴奋剂
function OnUseSkill_10616(level,etype1,eid1,etype2,eid2)
	local list = s_getTeamEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		for j=10613,10623 do
			s_removebuff(list[i],list[i+1],j)
		end
		s_addbuff(list[i],list[i+1],10613+level-1,level,300)
	end
	ShowAttack(10616,etype1,eid1,etype2,eid2)
end
