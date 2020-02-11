--幽灵盾
function OnUseSkill_5057(level,etype1,eid1,etype2,eid2,posx,posy)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Freeman then
        s_debug("5057 err");
		return USE_SKILL_ERROR
	end

    --安全区
    if  s_checkZoneType(etype1,eid1,ZONE_ABSOLUTE) == VALUE_OK then
	    s_sysInfo(eid1,"安全区内不允许进行PK", ChatPos_Tips)
	    return USE_SKILL_ERROR
    end
    local cursp = s_getValue(etype1,eid1,VALUE_TYPE_SP);
    local maxsp = s_getValue(etype1,eid1,VALUE_TYPE_MAXSP)
    local needsp = math.floor(maxsp * 0.05 + 50)
    if cursp < needsp then
        --ShowAttack(5057,etype1,eid1,etype2,eid2)
        s_sysInfo(eid1,"法力值不足",ChatPos_Tips)
        return USE_SKILL_ERROR
    end
    local mdefList = {60,70,80,90,100}
	--local percent = {30,40,50,60,70}
    s_setValue(etype1,eid1,VALUE_TYPE_SP,cursp - needsp);
    local damage  = mdefList[level];
	local victim  = {}
    local num    = 0;
    s_debug("OnUseSkill_5057 edi2="..eid2.."edi1="..eid1.."damage"..damage)
	----是否可回血
--   if s_checkTreat(5014,etype1,eid1,etype2,eid2) == VALUE_FAIL then
   --local temptar = s_checkTreat(5051,etype1,eid1,etype2,eid2)
        --table.insert(victim,etype2)
        --table.insert(victim,eid2)
        --s_debug("use skill 5017 damage =%d",math.floor(damage * (1 + percent[level])))
        --s_addValue(etype1,eid1,VALUE_TYPE_HP,math.floor(damage * (1 - percent[level])))
       --num = num+1
--    end
	--9屏取敌15个，根据距离循环判断是否在技能范围内，然后结算伤害和人数，最后根据人数是否达到技能上限来判断填出循环
	local targetid = eid2
	local  etype = etype2
	local time = 180
        if eid2 == 0 then
		targetid = eid1
		etype = etype1
	end
	if etype2 == SCENE_ENTRY_NPC then
		s_debug("OnUseSkill_5057 is npc")
		s_addbuff(etype1, eid1,45200+level,level,time,damage)
		ShowAttack(5057,etype1,eid1,etype1,eid1)
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5057,1)
		return
	end
	local poscycle1 = getnowcyclepos(etype2,eid2,0)
	--s_removebuff(etype,targetid,45200+level,damage)
	s_addbuff(etype,targetid,45200+level,level,time,damage)
	table.insert(victim,etype)
	table.insert(victim,targetid)
	table.insert(victim, math.floor(1))
	local list = s_getNineEntry(etype,targetid,15)
	for i = 1,table.getn(list), 2 do
		--if (list[i] ~= etype1 or list[i+1] ~= eid1)  then
                local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
                local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
				for j=1,#poscycle1,2 do
					if poscycle1[j] == entry_x and poscycle1[j+1] == entry_y and list[i] == SCENE_ENTRY_PLAYER then
						        --s_removebuff(etype,targetid,45200+level,damage)
							s_addbuff(list[i],list[i+1],45200+level,level,time,damage)
							s_trace(" >>>> 5057 eid "..list[i+1].."buf===="..damage.."mdefList"..mdefList[level])
							table.insert(victim,list[i])
							table.insert(victim,list[i+1])
							table.insert(victim, math.floor(damage * (1 +  percent[level])))
							num = num+1
                                                        
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
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5057,1)
	end
	ShowAttackMulti(5057,etype1,eid1,unpack(victim))
      --ShowAttack(5057,etype1,eid1,etype1,targetid)
    --ShowAttack(5057,etype1,eid1,etype1,temptar)
end
