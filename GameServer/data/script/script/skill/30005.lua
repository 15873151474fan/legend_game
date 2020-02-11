--光明之神
function OnUseSkill_30005(level,etype1,eid1,etype2,eid2)
	local list = s_getlistEntry(etype1,eid1,10)
	for i=1, table.getn(list),2 do
		s_addbuff(list[i],list[i+1],30005,tableAA,tableMA,tablePA)
	end
	ShowAttack(30005,etype1,eid1,etype2,eid2)
end
