--冲杀斩(攻击前方两个目标，无视防御和闪避)
function OnUseSkill_7013(level,etype1,eid1,etype2,eid2,curdir)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Soldier then
		return USE_SKILL_ERROR
	end

	if s_checkPK(7013,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
    local damage = GetAttackValue(etype1,eid1)
    local percent = {1,1.02,1.04,1.06,1.08}
    local victim = {}
    local num = 0;
    s_debug("OnUseSkill_70132222222222222222222")
	--是否可PK
	if s_checkPK(7013,etype1,eid1,etype2,eid2) == VALUE_OK then
		table.insert(victim,etype2)
		table.insert(victim,eid2)
        table.insert(victim, math.floor(damage * (percent[level])))
		num = num+1
	end
    --先获得目的坐标，然后再在九屏坐标里查找是否有
    s_debug("OnUseSkill_7013 11111111111111111111111")
    local poslist = getnowNstepos(etype1,eid1,curdir,2);
    --local poslist = getAttackDir(etype2,eid2,curdir,1);
    s_debug("list size="..table.getn(poslist))
	--9屏取敌15个，根据距离循环判断是否在技能范围内，然后结算伤害和人数，最后根据人数是否达到技能上限来判断填出循环
	local list = s_getNineEntry(etype1,eid1,15)
	for i = 1,table.getn(list), 2 do
		if (list[i] ~= etype1 or list[i+1] ~= eid1)  then
			if(list[i] ~= etype2 or list[i+1] ~= eid2) then
                    local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
                    local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
                    for j = 1,#poslist,1 do
                        if poslist[j] == entry_x and poslist[j+1] == entry_y then
								--s_trace(">>>>>>>>>>>>>>>>>kkkkkkkkk")
                            if s_checkPK(7013,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
                                table.insert(victim,list[i])
                                table.insert(victim,list[i+1])
								table.insert(victim, math.floor(damage * (percent[level] + 0.1)))
				s_debug("OnUseSkill_7013  2222222222222222")
                                num = num+1
                                break;
                            end
                        end
                    end
                if num == 2 then
                    break
                end
            end
        end
	end
	--for k=1,#victim,3 do
		--s_trace(">>>>>>>.x"..victim[k])
		--s_trace(">>>>>>>.y"..victim[k+1])
	--end
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_7013,1)
	end
    MagicAttack(7013,VALUE_TYPE_PDAM,etype1,eid1,unpack(victim))
end
