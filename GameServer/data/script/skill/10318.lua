--腐蚀榴弹
function OnUseSkill_10318(level,etype1,eid1,etype2,eid2,posx,posy)
	local value = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	if s_checkPK(10318,etype1,eid1,etype2,eid2) == VALUE_OK then
		s_removebuff(etype2,eid2,10318)
		s_addbuff(etype2,eid2,10318,level,10,value)
	end

	local list = s_getNineEntry(etype1,eid1,20)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 or list[i+1] ~= eid1 then
			if(list[i] ~= etype2 or list[i+1] ~= eid2) then
				if s_checkPK(10318,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
					local x1 = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
					local y1 = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
					if math.sqrt((x1-posx)^2 + (y1-posy)^2) <= 3 then
						s_removebuff(list[i],list[i+1],10318)
						s_addbuff(list[i],list[i+1],10318,level,10,value)
					end
				end
			end
		end
	end

	ShowAttack(10318,etype1,eid1,etype2,eid2)
end
