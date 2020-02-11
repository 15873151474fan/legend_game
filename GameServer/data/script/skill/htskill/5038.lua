--冰龙破(单体，冰冻机率为%5)
function OnUseSkill_5038(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Gunman then
		return USE_SKILL_ERROR
	end
    local damage  = 0;
	local percent = {0.7700,0.7935,0.8171,0.8406,0.8642}
    local num    = 0;
	local victim  = {}
	damage  = GetAttackValue(etype1,eid1)
	--是否可PK
	if s_checkPK(5038,etype1,eid1,etype2,eid2) == VALUE_OK then
		table.insert(victim,etype2)
		table.insert(victim,eid2)
        table.insert(victim, math.floor(damage * (percent[level])))
		num = num+1
	end
	local poscycle1 = getnowcyclepos(etype2,eid2,0)   
	local list = s_getNineEntry(etype1,eid1,15)
	for i = 1,table.getn(list), 2 do
		if (list[i] ~= etype1 or list[i+1] ~= eid1)  then
                local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
                local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
				for j=1,#poscycle1,2 do
					if poscycle1[j] == entry_x and poscycle1[j+1] == entry_y then
						if s_checkPK(5038,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
							table.insert(victim,list[i])
							table.insert(victim,list[i+1])
							table.insert(victim, math.floor(damage * percent[level]))
							num = num+1
							break;
						end
					end
                end
                if num == 9 then
                    break
                end
		end
	end
    MagicAttack(5038,VALUE_TYPE_MDAM,etype1,eid1,unpack(victim))

	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5038,1)
	end

end
