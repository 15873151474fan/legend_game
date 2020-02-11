--破日剑法(对直接线上的四个目标造成海量伤害)
function OnUseSkill_7018(level,etype1,eid1,etype2,eid2,curdir)
    s_debug("onUseSkill 7018 dir")
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Soldier then
		return USE_SKILL_ERROR
	end

	local victim = {}
    local num    = 0;
    local percent = {1.32,1.43,1.54,1.65,1.76};
    damage  = GetAttackValue(etype1,eid1)

	--是否可PK
	--if s_checkPK(7018,etype1,eid1,etype2,eid2) == VALUE_OK then
		--table.insert(victim,etype2)
		--table.insert(victim,eid2)
        --table.insert(victim, math.floor(damage * ( percent[level])))
		--num = num+1
	--end
    --四个方向特殊处理
    local poslist  = {}
    local target_x = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
    local target_y = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
    local src_x    = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local src_y    = s_getValue(etype1,eid1,VALUE_TYPE_POSY)

    local A = target_y - src_y
    local B = src_x - target_x
    local C = target_x * src_y - src_x * target_y

    local distance = {}

    s_debug("dir ="..curdir)

	local list = s_getNineEntry(etype1,eid1,15)
    local dir = 0
    if target_x > src_x and target_y < src_y then  -- 右上
        for i = 0,4 do
            for j= 0,4 do
                table.insert(poslist,src_x + i)
                table.insert(poslist,src_y - j)
            end
        end
        for i = 1,table.getn(poslist),2 do
            local l = math.abs(A * poslist[i] + B * poslist[i+1] + C) / math.sqrt(A * A + B * B);
            table.insert(distance,{l,poslist[i],poslist[i + 1]})
            table.sort(distance,function(a,b) return a[1] < b[1] end);
        end
        dir = 1
    elseif target_x < src_x and target_y < src_y then -- 左上
        for i = 0,4 do
            for j = 0,4 do
            table.insert(poslist,src_x - i)
            table.insert(poslist,src_y - j)
            end
        end
        for i = 1,table.getn(poslist),2 do
            local l = math.abs(A * poslist[i] + B * poslist[i+1] + C) / math.sqrt(A * A + B * B);
            table.insert(distance,{l,poslist[i],poslist[i + 1]})
            table.sort(distance,function(a,b) return a[1] < b[1] end);
        end
	dir = 2
    elseif target_x < src_x and target_y > src_y then -- 左下
        for i = 0,4 do
            for j = 0,4 do
            table.insert(poslist,src_x - i)
            table.insert(poslist,src_y + j)
            end
        end
        for i = 1,table.getn(poslist),2 do
            local l = math.abs(A * poslist[i] + B * poslist[i+1] + C) / math.sqrt(A * A + B * B);
            table.insert(distance,{l,poslist[i],poslist[i + 1]})
            table.sort(distance,function(a,b) return a[1] < b[1] end);
        end
	dir = 3
    elseif target_x > src_x and target_y > src_y then -- 右下
        for i = 0,4 do
            for j = 0,4 do
            table.insert(poslist,src_x + i)
            table.insert(poslist,src_y + j)
            end
        end
        for i = 1,table.getn(poslist),2 do
            local l = math.abs(A * poslist[i] + B * poslist[i+1] + C) / math.sqrt(A * A + B * B);
            table.insert(distance,{l,poslist[i],poslist[i + 1]})
            table.sort(distance,function(a,b) return a[1] < b[1] end);
        end
	dir = 4
    else 
        --先获得目的坐标，然后再在九屏坐标里查找是否有
        poslist = {}
        poslist = getAttackDir2(etype2,eid2,curdir,4);
    end

    if table.getn(distance) > 0 then
        poslist = {}
        for i = 1,5 do 
            table.insert(poslist,distance[i][2])
            table.insert(poslist,distance[i][3])
        end
    end


	--9屏取敌15个，根据距离循环判断是否在技能范围内，然后结算伤害和人数，最后根据人数是否达到技能上限来判断填出循环
    local templist = {}
	local list = s_getNineEntry(etype1,eid1,15)
	for i = 1,table.getn(list), 2 do
		if (list[i] ~= etype1 or list[i+1] ~= eid1)  then
            if s_checkPK(7018,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
                local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
                local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
                for j = 1,table.getn(poslist),2 do
                    if poslist[j] == entry_x and poslist[j+1] == entry_y then
                        table.insert(victim,list[i])
                        table.insert(victim,list[i+1])
                        table.insert(victim, math.floor(damage * (percent[level])))
                        num = num+1
                        break;
                    end
                end
                if num == 4 then
                    break
                end
            end
        end
		end
    MagicAttack(7018,VALUE_TYPE_PDAM,etype1,eid1,unpack(victim))
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_7018,1)
	end
end
