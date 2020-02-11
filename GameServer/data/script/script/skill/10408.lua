--焚烧火墙
function OnUseSkill_10408(level,etype1,eid1,etype2,eid2,posx,posy)
	local damage = { 100,200,300,450,600,900,1200,1800,2400,3000,3600}

	local victim = {}
	if s_checkPK(10408,etype1,eid1,etype2,eid2) == VALUE_OK then
		table.insert(victim,etype2)
		table.insert(victim,eid2)
		table.insert(victim,damage[level])
	end

	local list = s_getNineEntry(etype1,eid1,20,posx,posy)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 or list[i+1] ~= eid1 then
			if(list[i] ~= etype2 or list[i+1] ~= eid2) then
				if s_checkPK(10408,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
					local x1 = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
					local y1 = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
					if math.sqrt((x1-posx)^2 + (y1-posy)^2) <= 3 then
						table.insert(victim,list[i])
						table.insert(victim,list[i+1])
						table.insert(victim,damage[level])
					end
				end
			end
		end
	end
	DirectAttack(10408,etype1,eid1,unpack(victim))
end
