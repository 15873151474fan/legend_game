--热能装甲
function OnUseSkill_10405(level,etype1,eid1,etype2,eid2)
	s_addbuff(etype1,eid1,10405,level,10)
	local list = s_getNineEntry(etype1,eid1,3)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 or list[i+1] ~= eid1 then
			if s_checkPK(10405,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				BeatBack(etype1,eid1,list[i],list[i+1],3,1)
			end
		end
	end
	ShowAttack(10405,etype1,eid1,etype2,eid2)
end
