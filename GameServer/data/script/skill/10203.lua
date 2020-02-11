--反戈
function OnUseSkill_10203(level,etype1,eid1,etype2,eid2)
	if etype1 == etype2 and eid1 == eid2 then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,10203) == 0 then
		return USE_SKILL_ERROR
	end
	if s_checkPK(10203,etype1,eid1,etype1,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
	s_removebuff(etype1,eid1,10203)
	if s_getbufflevel(etype2,eid2,10715) == 0 then
		if math.random(1,100) < s_getValue(etype2,eid2,VALUE_TYPE_FAINTDEF) then
			s_sysInfo(eid1,"对方眩晕免疫中")
			s_sysInfo(eid2,"免疫对方眩晕")
			s_addbuff(etype2,eid2,10715,1,2)
		else
			s_addbuff(etype2,eid2,10703,1,3)
			s_addbuff(etype2,eid2,10715,1,3*2)
		end
	end
	local damage = { 200,280,440,680,1000,1480,2120,2920,4120,5720,6850}
	DirectAttack(10203,etype1,eid1,etype2,eid2,damage[level])
end

