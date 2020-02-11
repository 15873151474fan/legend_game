--火焰风暴
function OnUseSkill_10403(level,etype1,eid1,etype2,eid2,posx,posy)
	local percent = { 150,180,210,240,270,300}

	local victim = {}
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)

	if s_checkPK(10403,etype1,eid1,etype2,eid2) == VALUE_OK then
		table.insert(victim,etype2)
		table.insert(victim,eid2)
		if etype2 == SCENE_ENTRY_PLAYER then
			table.insert(victim,damage*0.3)
		else
			table.insert(victim,damage*percent[level]/100)
		end
	end

	local list = s_getNineEntry(etype1,eid1,20,posx,posy)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 or list[i+1] ~= eid1 then
			if(list[i] ~= etype2 or list[i+1] ~= eid2) then
				if s_checkPK(10403,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
					local x1 = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
					local y1 = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
					if math.floor(math.sqrt((x1-posx)^2 + (y1-posy)^2)) <= 5 then
						table.insert(victim,list[i])
						table.insert(victim,list[i+1])
						if list[i] == SCENE_ENTRY_PLAYER then
							table.insert(victim,damage*0.3)
						else
							table.insert(victim,damage*percent[level]/100)
						end
					end
				end
			end
		end
	end
	MagicAttack(10403,VALUE_TYPE_MDAM,etype1,eid1,unpack(victim))
end
