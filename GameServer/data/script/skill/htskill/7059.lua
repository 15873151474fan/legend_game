--疾影电(远程，对选中点其周围9个目标进行打击)
function OnUseSkill_7059(level,etype1,eid1,etype2,eid2,curdir)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Gunman then
        s_debug("7059 err");
		return USE_SKILL_ERROR
	end
	
    local damage  = GetAttackValue(etype1,eid1);
	local percent = {{0.8,0.9,1,1.1},{0.85,0.95,1.05,1.15},{0.9,1,1.1,1.2},{0.95,1.05,1.15,1.25}}
	local victim  = {}
    local num    = 0;
	----是否可PK
	--if s_checkPK(5014,etype1,eid1,etype2,eid2) == VALUE_OK then
		--table.insert(victim,etype2)
		--table.insert(victim,eid2)
        --table.insert(victim, math.floor(damage * (1 + percent[level])))
		--num = num+1
	--end
	--9屏取敌15个，根据距离循环判断是否在技能范围内，然后结算伤害和人数，最后根据人数是否达到技能上限来判断填出循环
    local poslist = getnowNstepos(etype1,eid1,curdir,6);
	local list = s_getNineEntry(etype2,eid2,15)
	for i = 1,table.getn(list), 2 do
		if (list[i] ~= etype1 or list[i+1] ~= eid1)  then
                local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
                local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
				for j=1,#poslist,2 do
					if poslist[j] == entry_x and poslist[j+1] == entry_y then
						if s_checkPK(7059,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
                                table.insert(victim,list[i])
                                table.insert(victim,list[i+1])
                                num = num+1
				table.insert(victim, math.floor(damage * percent[level][num]))
                                break;
                        end	
					end
				end
                if num == 4 then
                    break
                end
		end
	end
--s_debug("OnUseSkill_7059.....num="..num)
    MagicAttack(7059,VALUE_TYPE_MDAM,etype1,eid1,unpack(victim))
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_7059,1)
	end
end
