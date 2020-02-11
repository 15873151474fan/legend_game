--九霄神雷(选中百分比伤害，周围8个承受50%的伤害)
function OnUseSkill_5058(level,etype1,eid1,etype2,eid2,posx,posy)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Freeman then
        s_debug("5058 err");
		return USE_SKILL_ERROR
	end
	 if  s_checkZoneType(etype1,eid1,ZONE_ABSOLUTE) == VALUE_OK then
		 s_sysInfo(eid1,"安全区内不允许进行PK", ChatPos_Tips)
		 return USE_SKILL_ERROR
	 end
         s_debug("OnUseSkill_5058 11111111111111111111111111111111..type"..etype2);
	local percent = {60,70,80,90,100}
	local damage  = percent[level];
	local victim  = {}
    local num    = 0;
	----是否可PK
    --if s_checkPK(5058,etype1,eid1,etype2,eid2) == VALUE_OK then
        --table.insert(victim,etype2)
        --table.insert(victim,eid2)
        --table.insert(victim, math.floor(damage * (1 + percent[level])))
        --num = num+1
    --end
	--9屏取敌15个，根据距离循环判断是否在技能范围内，然后结算伤害和人数，最后根据人数是否达到技能上限来判断填出循环
	local targetid = eid2
        local  etype = etype2
        if eid2 == 0 then
                targetid = eid1
                etype = etype1
        end 
	local time = 180
	if etype2 == SCENE_ENTRY_NPC then
		s_debug("OnUseSkill_5058 is npc")
		s_addbuff(etype1, eid1,45100+level,level,time,damage)
		ShowAttack(5058,etype1,eid1,etype1,eid1)
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5058,1)
		return 
	end
	local poscycle1 = getnowcyclepos(etype2,eid2,0)
	s_addbuff(etype,targetid,45100+level,level,time,damage)
	--s_setupCharState(etype,targetid)
	table.insert(victim,etype)
	table.insert(victim,targetid)
	table.insert(victim, math.floor(1))
	local list = s_getNineEntry(etype,targetid,15)
	for i = 1,table.getn(list), 2 do
		--if (list[i] ~= etype1 or list[i+1] ~= eid1) then
                local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
                local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
				for j=1,#poscycle1,2 do
					--s_debug("OnUseSkill_5058:poscycle1 x="..poscycle1[j].." y="..poscycle1[j+1].." entry_x="..entry_x.." entry_y="..entry_y)
					if poscycle1[j] == entry_x and poscycle1[j+1] == entry_y and list[i] == SCENE_ENTRY_PLAYER then
							s_addbuff(list[i],list[i+1],45100+level,level,time,damage)
							s_trace(" >>>> 5058 eid "..list[i+1])
							table.insert(victim,list[i])
							table.insert(victim,list[i+1])
							table.insert(victim, math.floor(damage * (1 +  percent[level])))
							num = num+1
							--s_setupCharState(list[i],list[i+1])
							break;
					end
                end
                if num == 9 then
                    break
                end
		--end
	end

	  if targetid == 0 then
		  targetid = eid1
	  end
    --MagicAttack(5058,VALUE_TYPE_MDAM,etype1,eid1,unpack(victim))
    --ShowAttack(5058,etype1,eid1,etype1,targetid)
    ShowAttackMulti(5058,etype1,eid1,unpack(victim))

	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5058,1)
	end
end
