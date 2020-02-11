
 local levelDistance_5036 = {1,2,3,4,5}

--灵魂抗拒(使用法力将自身周围低于自己等级的目标推开)
function OnUseSkill_5036(level,etype1,eid1,etype2,eid2,posx,posy)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Gunman then
        s_debug("5036 err");
		return USE_SKILL_ERROR
	end

        local name = s_getNpcByTmpID(etype2,eid2)
	if name == "城主雕像" then
		return USE_SKILL_ERROR
	end
       --不允许撞击BOSS
       if s_getValue(etype2,eid2,VALUE_TYPE_MONSTER_TYPE) == 3 then
               s_sysInfo(eid1,"法术力量不足，推开失败", ChatPos_Tips)
               return USE_SKILL_ERROR
       end 

	local play1Level = s_getValue(etype1,eid1,VALUE_TYPE_LEVEL)
	--local posx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	--local posy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)

	local myposx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    	local myposy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
    	local dstList = s_getBlockPrePoint(etype1,eid1,posx,posy)
	local poscycle1 = getnowcyclepos(etype1,eid1,0)
	
	local list = s_getNineEntry(etype1,eid1,15)
	local victim  = {}
	local num = 0;
	--s_debug("s_getNineEntry ="..table.getn(list).." ="..table.getn(poscycle1).." name="..name);
	for i = 1,table.getn(list), 2 do
		if (list[i] ~= etype1 or list[i+1] ~= eid1)  then
                local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
                local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
				s_trace("vvvvvvvvvvvvvvvx"..entry_x.." y="..entry_y.."level="..level)
				local find = false
				for j=1,#poscycle1,2 do
					s_trace("px="..poscycle1[j].."  py="..poscycle1[j+1])
					if poscycle1[j] == entry_x and poscycle1[j+1] == entry_y then
						if s_checkPK(5036,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
							       --等级判断
							--local play2Level = s_getValue(list[i],list[i+1],VALUE_TYPE_LEVEL)
							--s_debug("OnUseSkill_5036==等级判断"..play1Level.."play2="..play2Level)
							--if play1Level < play2Level then
							--       s_trace("力量不足，推开失败!")
							--       break;
							--end 
							if checkLevel(etype1,eid1,list[i],list[i+1]) == -1 then
								break
							end
							local curdir = GetDirect(myposx, myposy,entry_x,entry_y)
							local p2pos = getnowNpos2(list[i],list[i+1], curdir,levelDistance_5036[level])
							s_goto(list[i],list[i+1],p2pos[3],p2pos[4],8,curdir)
							table.insert(victim,list[i])
							table.insert(victim,list[i+1])
							table.insert(victim, VALUE_TYPE_MDAM)
							table.insert(victim, 0)
							find = true
							num = num + 1
							--ShowAttack(5036,etype1,eid1,list[i],list[i+1])						
							s_trace(">>>>>>>>>>>>>11111111111111111, newposx="..p2pos[3].." y="..p2pos[4]..">>>5036 uid="..list[i+1])
						end
					end
				end
                end
	end
	
	s_trace("find num="..num)
	ShowAttackMulti(5036,etype1,eid1,unpack(victim))
	--MagicAttack(5036,VALUE_TYPE_MDAM,etype1,eid1,unpack(victim))
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5036,1)
	end
	
end

function checkLevel(etype1,eid1,etype2,eid2)
	--等级判断
       local play1Level = s_getValue(etype1,eid1,VALUE_TYPE_LEVEL)
       local play2Level = s_getValue(etype2,eid2,VALUE_TYPE_LEVEL)
       local RebirthLevel1 = s_getRebirthLevel(eid1)
       local RebirthLevel2 = 0 
       if etype2 == SCENE_ENTRY_NPC then
               RebirthLevel2 = 0 
       else
               RebirthLevel2 = s_getRebirthLevel(eid2)
       end 

       s_debug("OnUseSkill_5036: level1"..play1Level.."play2="..play2Level.."zhuansheng1="..RebirthLevel1.."zhuansheng2="..RebirthLevel2)
       if RebirthLevel1 < RebirthLevel2 then
               s_sysInfo(eid1,"目标等级过高，无法推开",ChatPos_Tips)
               return -1
       elseif RebirthLevel1 == RebirthLevel2 then
                if play1Level < play2Level then
                        s_sysInfo(eid1,"目标等级过高，无法推开", ChatPos_Tips)
                        return -1
                end 
       else

       end 
       return 0
end
