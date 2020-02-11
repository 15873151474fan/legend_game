--钢铁壁垒
function OnUseSkill_10111(level,etype1,eid1,etype2,eid2)
	local type1,type2 = math.modf(level/10)
	local time1 = 10
	if type2 == 0 then
		time1 = 10+type1-1
		if time1 >= 20 then
			time1 = 20
		end
	end
	s_removebuff(etype1,eid1,10111)
	s_addbuff(etype1,eid1,10111,level,time1)
	ShowAttack(10111,etype1,eid1,etype2,eid2)
end
