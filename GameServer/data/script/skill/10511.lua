--空间瞬移
function OnUseSkill_10511(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,20)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			local stype,sid = s_getselect(list[i],list[i+1])
			if stype == etype1 and sid == eid1 then
				s_select(list[i],list[i+1],0,0)
			end
		end
	end
	local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if math.random(0,100) > 50 then
		posx = posx + math.random(10,20)
		posy = posy + math.random(10,20)
	else
		posx = posx + math.random(-20,-10)
		posy = posy + math.random(-20,-10)
	end
	s_goto(etype1,eid1,posx,posy)
	ShowAttack(10511,etype1,eid1,etype2,eid2)
end
