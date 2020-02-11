--狂风箭雨
function OnUseSkill_10302(level,etype1,eid1,etype2,eid2,posx,posy)
	--local dam = {10,15,21,26,36,46,57,73,90,105,137,167,220,271,368,465}
	local percent1 = 60                  -----初始
	local percent2 = 0.2*level-0.2        -----每级提升
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	local value = damage * (percent1+percent2)/100
	local num = {3,3,3,4,4,4,5,5,5,6,6,7,7,8,8,8}
	local num2 = 0
	local victim ={}
	--是否可PK
	if s_checkPK(10302,etype1,eid1,etype2,eid2) == VALUE_OK then
		table.insert(victim,etype2)
		table.insert(victim,eid2)
		if etype2 == SCENE_ENTRY_PLAYER then
			table.insert(victim, value)
		else
			table.insert(victim, value)
		end
		num2 = num2+1
	end
	--9屏取敌15个，根据距离循环判断是否在技能范围内，然后结算伤害和人数，最后根据人数是否达到技能上限来判断退出循环
	local list = s_getNineEntry(etype1,eid1,15)
	for i = 1,table.getn(list), 2 do
		if (list[i] ~= etype1 or list[i+1] ~= eid1)  then
			if(list[i] ~= etype2 or list[i+1] ~= eid2) then
				if s_checkPK(10302,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
					local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
					local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
					local dst = math.sqrt((entry_x-posx)^2 + (entry_y-posy)^2)
					if dst < 5 then
						table.insert(victim,list[i])
						table.insert(victim,list[i+1])
						if list[i] == SCENE_ENTRY_PLAYER then
							table.insert(victim, value)
						else
							table.insert(victim, value)
						end
						num2 = num2+1
					end

					if s_getRuneDur(eid1,10302) > 0 then       --符文预留
						if num2 == num[level]+1 then
							break
					end
					else
						if num2 == num[level] then
							break
						end
					end
				end
			end
		end
	end
	if s_getRuneDur(eid1,10302) > 0 then
		s_reduceRuneDur(eid1,10302)
	end
	MagicAttack(10302,VALUE_TYPE_PDAM,etype1,eid1,unpack(victim))
end
