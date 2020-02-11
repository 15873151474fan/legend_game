--军衔技能，八面威风
function OnUseSkill_20000(level,etype1,eid1,etype2,eid2)
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,3)
	for i = 1,table.getn(list), 2 do
		if list[i] == etype1 and list[i+1] ~= eid1  then -- 保证对人使用
			if s_checkPK(20000,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
				local milirank = s_getValue(etype1,eid1,VALUE_TYPE_MILIRANK)
				local rank = s_getValue(list[i],list[i+1],VALUE_TYPE_MILIRANK)
				if milirank > rank then
					BeatBack(etype1,eid1,list[i],list[i+1],5,3)
					table.insert(victim,list[i])
					table.insert(victim,list[i+1])
				end
		end
		end
	end
	MagicHurtAttack(20000,etype1,eid1,0,0,unpack(victim))
end
