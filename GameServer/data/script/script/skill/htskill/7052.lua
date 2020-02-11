--施毒(中毒者防御降低25%及持续受到伤害。持续中毒期间每3秒受到一次伤害，持续时间为道术攻击的0.5%（秒）+60秒。（不足三秒的时候则向下取整数），每次受到的伤害为道术攻击的10%。)
function OnUseSkill_7052(level,etype1,eid1,etype2,eid2)
    local damage  = 0;
	local percent = {0.1000,0.1070,0.1140,0.1210,0.1280}
    local num    = 0;
	local victim  = {}

	--是否可PK
	if s_checkPK(7052,etype1,eid1,etype2,eid2) == VALUE_OK then
		table.insert(victim,etype2)
		table.insert(victim,eid2)
        --table.insert(victim, math.floor(damage * percent[level]))
		table.insert(victim, GetAttackValue(etype1,eid1))
		num = num+1
	end
    if etype1 == SCENE_ENTRY_NPC then
        damage1 = s_getValue(etype1,eid1,VALUE_TYPE_TDAM);
        damage2 = s_getValue(etype1,eid1,VALUE_TYPE_TMAXDAM);
		--damage = (damage1 + damage2) * 0.5
		damage = s_getValue(etype1,eid1,VALUE_TYPE_TMAXDAM)* percent[level];
    else
        
        --damage  = GetAttackValue(etype1,eid1);
		damage = s_getValue(etype1,eid1,VALUE_TYPE_TMAXDAM)* percent[level];
    end
    damage = damage + 300;

	local poscycle1 = getnowcyclepos(etype2,eid2,0)


    local time=60
	s_addbuff(etype2,eid2,1500,level,time,damage)
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
							table.insert(victim, math.floor(damage))
							num = num+1
							s_addbuff(list[i],list[i+1],1500,level,time,damage)
							break;
						end
					end
                end
                if num == 9 then
                    break
                end
		end
	end
    MagicAttack(7052,VALUE_TYPE_MDAM,etype1,eid1,unpack(victim))
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_7052,1)
	end
end
