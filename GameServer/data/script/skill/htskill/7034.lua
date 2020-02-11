--地狱雷鸣(释放冰雪神力攻击自身周围的目标，有几率使其冰冻)
function OnUseSkill_7034(level,etype1,eid1,etype2,eid2,posx,posy)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Gunman then
        s_debug("7034 err");
		return USE_SKILL_ERROR
	end
	
    local damage  = GetAttackValue(etype1,eid1);
	local percent = {0.5500,0.5668,0.5836,0.6004,0.6173}
	local victim  = {}
    local num    = 0;
	----是否可PK
	if s_checkPK(5014,etype1,eid1,etype2,eid2) == VALUE_OK then
		table.insert(victim,etype2)
		table.insert(victim,eid2)
        table.insert(victim, math.floor(damage * (percent[level])))
		num = num+1
	end
	--9屏取敌15个，根据距离循环判断是否在技能范围内，然后结算伤害和人数，最后根据人数是否达到技能上限来判断填出循环
	
    local e_xxx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local e_yyy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	--s_trace("ssssssssss x"..e_xxx.." y="..e_yyy)
	local poscycle1 = getnowcyclepos(etype1,eid1,0)
	--for k=1,#poscycle1,2 do
	--	s_trace("bbbbbbbbbbbb x"..poscycle1[k].." y="..poscycle1[k+1])
	--end
	local poscycle2 = getnow2stepcyclepos(etype1,eid1,0)
	--for k=1,#poscycle2,2 do
	--	s_trace("CCCCCCCCCCCC x"..poscycle2[k].." y="..poscycle2[k+1])
	--end
	local list = s_getNineEntry(etype1,eid1,15)
	for i = 1,table.getn(list), 2 do
		if (list[i] ~= etype1 or list[i+1] ~= eid1)  then
                local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
                local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
				--s_trace("vvvvvvvvvvvvvvvx"..entry_x.." y="..entry_y)
				local find = false
				for j=1,#poscycle1,2 do
					if poscycle1[j] == entry_x and poscycle1[j+1] == entry_y then
						if s_checkPK(7034,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
							table.insert(victim,list[i])
							table.insert(victim,list[i+1])
							table.insert(victim, math.floor(damage * ( percent[level]+0.1)))
							num = num+1
							find = true
							--s_trace(">>>>>>>>>>>>>11111111111111111")
						end
					end
				end
				--if find == false then
				for j=1,#poscycle2,2 do
					if poscycle2[j] == entry_x and poscycle2[j+1] == entry_y then
						if s_checkPK(7034,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
							table.insert(victim,list[i])
							table.insert(victim,list[i+1])
							table.insert(victim, math.floor(damage * percent[level]))
							num = num+1
							find = true
							--s_trace(">>>>>>>>>>>>>22222222222222222")
							break;
						end
					end
                --end
				end
                if num == 24 then
                    break
                end
		end
	end
    MagicAttack(7034,VALUE_TYPE_MDAM,etype1,eid1,unpack(victim))
    s_debug("7034>>>>>>>>>>>>>>>")
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_7034,1)
	end
	--for i=1,#victim,3 do
	--	s_trace(" >>>>>>>>>>>>>>>>> etype="..victim[i].." eid="..victim[i+1])
	--end
end
