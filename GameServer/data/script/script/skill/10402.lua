--炮弹冲击
function OnUseSkill_10402(level,etype1,eid1,etype2,eid2,posx,posy)
	local dam = {9,14,18,23,33,42,51,66,81,95,123,151,199,245,333,421}
	local num = {3,3,3,4,4,4,5,5,5,6,6,7,7,8,8,8}
	local num2 = 0
	local victim = {}
	if s_checkPK(10402,etype1,eid1,etype2,eid2) == VALUE_OK then
		table.insert(victim,etype2)
		table.insert(victim,eid2)
		if etype2 == SCENE_ENTRY_PLAYER then
			table.insert(victim,s_getValue(etype1,eid1,VALUE_TYPE_MDAM)+dam[level])
		else
			table.insert(victim,s_getValue(etype1,eid1,VALUE_TYPE_MDAM)*0.5+dam[level])
		end
		num2 = num2+1
	end

	local list = s_getNineEntry(etype1,eid1,15)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 or list[i+1] ~= eid1 then
			if(list[i] ~= etype2 or list[i+1] ~= eid2) then
				if s_checkPK(10402,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
					local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
					local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
					local dst = math.sqrt((entry_x-posx)^2 + (entry_y-posy)^2)
					if dst < 5 then
						table.insert(victim,list[i])
						table.insert(victim,list[i+1])
						if list[i] == SCENE_ENTRY_PLAYER then
							table.insert(victim,s_getValue(etype1,eid1,VALUE_TYPE_MDAM)+dam[level])
						else
							table.insert(victim,s_getValue(etype1,eid1,VALUE_TYPE_MDAM)*0.5+dam[level])
						end
						num2 = num2+1
					end
					if num2 == num[level] then
						break
					end
				end
			end
		end
	end
	MagicAttack(10402,VALUE_TYPE_MDAM,etype1,eid1,unpack(victim))
end
