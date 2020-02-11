--魔舞技能-弓手
function OnUseSkill_10320(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_EVIL_VALUE) ~= MAX_GOD_EVIL_VALUE then
		return USE_SKILL_ERROR
	end
	s_setValue(etype1,eid1,VALUE_TYPE_EVIL_VALUE,0)
	local pdam = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	local mdam = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	local damage = pdam
	if pdam < mdam then damage = mdam end

	local percent = {500,500,500,500,500}
	local victim = {}
	-- 范围攻击
	local list = s_getNineEntry(etype1,eid1,7)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype1 then	-- 处理NPC
			if s_checkPK(10320,etype1,eid1,list[i],list[i+1]) ~= VALUE_OK
				and s_getValue(list[i],list[i+1],VALUE_TYPE_MONSTER_TYPE) == 0 then
			table.insert(victim,list[i])
			table.insert(victim,list[i+1])
			table.insert(victim,damage*percent[level]/100)
			-- if s_getbufflevel(list[i],list[i+1],20522) ~= 0 then
			--     s_updateBuffTime(list[i],list[i+1],20522,10)
			-- end
			--s_addbuff(list[i],list[i+1],20522,1,10)
		end
		end
	end
	--s_addbuff(etype1,eid1,20534,1,5)
	DirectAttack(10320,etype1,eid1,unpack(victim))
end
