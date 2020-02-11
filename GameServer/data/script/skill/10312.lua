--装死
function OnUseSkill_10312(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype2,eid2,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			local stype,sid = s_getselect(list[i],list[i+1])
			if stype == etype1 and sid == eid1 then
				s_select(list[i],list[i+1],0,0)
			end
		end
	end

	--自动下马
	if s_getTrafficType(eid1) == TrafficType_Horse then
		s_resetTrafficType(eid1)
	end

	s_addbuff(etype2,eid2,10312,1,60)
	ShowAttack(10312,etype1,eid1,etype2,eid2)
end
