--战栗嘲讽
function OnUseSkill_10108(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,10)
	for i = 1,table.getn(list), 2 do
		if (list[i] ~= etype1 or list[i+1] ~= eid1)  then
			if(list[i] ~= etype2 or list[i+1] ~= eid2) then
				if s_checkPK(10108,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
					if CheckPowerBuff(list[i],list[i+1]) ~= VALUE_OK then
						s_select(list[i],list[i+1],etype1,eid1)
						--NPC 增加仇恨，设置为当前敌人
						if list[i] == SCENE_ENTRY_NPC then
							s_setEnemyEnmity(list[i+1],etype1,eid1,-1)
							s_setEnemy(list[i+1],etype1,eid1)
						end
					end
				end
			end
		end
	end
	s_addbuff(etype1,eid1,10108,level,5)
	ShowAttack(10108,etype1,eid1,etype2,eid2)
end
