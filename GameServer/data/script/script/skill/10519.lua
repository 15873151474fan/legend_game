--冰霜护盾
function OnUseSkill_10519(level,etype1,eid1,etype2,eid2)
	local type1,type2 = math.modf(level/10)
	local time1 = 10
	if type2 == 0 then
		time1 = 10+type1-1
		if time1 >= 20 then
			time1 = 20
		end
	end
	s_removebuff(etype1,eid1,10519)
	s_addbuff(etype1,eid1,10519,level,time1)
	ShowAttack(10519,etype1,eid1,etype2,eid2)
end
