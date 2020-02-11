--旋风斩
function OnUseSkill_10103(level,etype1,eid1,etype2,eid2)
	local percent1 = 60                  -----初始
	local percent2 = 0.2*level-0.2        -----每级提升
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	local value = damage * (percent1+percent2)/100
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,5)
	for i = 1,table.getn(list), 2 do
		if (list[i] ~= etype1 or list[i+1] ~= eid1)  then
			if s_checkPK(10103,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				if list[i] == SCENE_ENTRY_PLAYER then
					table.insert(victim,value )
				else
					table.insert(victim,value)
				end
			end
		end
	end
	--if s_getRuneDur(eid1,10103) > 0 then       --符文预留

	MagicAttack(10103,VALUE_TYPE_PDAM,etype1,eid1,unpack(victim))
end
