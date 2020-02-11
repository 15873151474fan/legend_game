--举火烧天
function OnUseSkill_10415(level,etype1,eid1,etype2,eid2,posx,posy)
	local hurt = {3000,4000,5500,7000,9000,10500}

	local damage = hurt[level]
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,20,posx,posy)
	for i = 1,table.getn(list), 2 do
		if s_checkPK(10415,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
			local x1 = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
			local y1 = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
			if math.sqrt((x1-posx)^2 + (y1-posy)^2) <= 3 then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				table.insert(victim,damage)
				s_addbuff(list[i],list[i+1],10415,level,10,eid1)
			end
		end
	end
	--    MagicAttack(10415,VALUE_TYPE_PDAM,etype1,eid1,unpack(victim))
	DirectAttack(10415,etype1,eid1,unpack(victim))
end
