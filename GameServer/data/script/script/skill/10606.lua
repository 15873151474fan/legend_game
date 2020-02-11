--圣光普照
function OnUseSkill_10606(level,etype1,eid1,etype2,eid2)
	local percent1 = 25                  -----初始
	local percent2 = 0.1*level-0.1        -----每级提升
	local percent3 = percent1 + percent2
	if s_getTeamLeader(eid1) == 0 then
		local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
		local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
		if maxhp * percent3/100 >= maxhp - hp then
			local value = maxhp * percent3/100
		else
			value = maxhp - hp
		end
		s_addValue(etype1,eid1,VALUE_TYPE_HP,value)
	end

	local list = s_getTeamEntry(etype1,eid1,20)
	for i = 1,table.getn(list), 2 do
		if list[i+1] ~= eid1 then
			hp = s_getValue(list[i],list[i+1],VALUE_TYPE_HP)
			maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
			if maxhp * percent3/100 >= maxhp - hp then
				value = maxhp * percent3/100
			else
				value = maxhp - hp
			end
			s_addValue(list[i],list[i+1],VALUE_TYPE_HP,value)
		end
	end
	s_sysInfo(eid1,"etype2="..tostring(etype2))
	s_sysInfo(eid1,"eid2="..tostring(eid2))
	ShowAttack(10606,etype1,eid1,etype2,eid2)
end
