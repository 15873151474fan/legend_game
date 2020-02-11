--变形药水
function OnUseSkill_10615(level,etype1,eid1,etype2,eid2)
	if CheckPowerBuff(etype2,eid2) == VALUE_OK then
		s_sysInfo(eid1,"对方处于免疫状态中",ChatPos_Sys + ChatPos_Important)
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype2,eid2,10716) ~= 0 then
		return USE_SKILL_ERROR
	end
	local hurttype = 0
	if math.random(1,100) < s_getValue(etype2,eid2,VALUE_TYPE_CHANGEDEF) then
		s_sysInfo(eid1,"对方变形免疫中")
		s_sysInfo(eid2,"免疫对方变形")
		s_addbuff(etype2,eid2,10716,level,2)
		hurttype = 4096
		return USE_SKILL_ERROR
	end
	if s_getTrafficType(eid2) == TrafficType_InHorse then
		s_resetTrafficType(eid2)
	end
	if s_getTrafficType(eid2) == TrafficType_Horse then
		s_resetTrafficType(eid2)
	end
	--判断对方是否是本国或者盟国
	--判断善恶值
	local country1 = s_getValue(etype1,eid1,VALUE_TYPE_HOMELAND)
	local country2 = s_getValue(etype2,eid2,VALUE_TYPE_HOMELAND)
	--不是挑战
	if s_getPkMode(eid1) ~= PKMODE_NORMAL and s_getPkMode(eid1) ~= PKMODE_GOODNESS then
		if country1 == country2 or s_isFriendCountry(country1,country2) == VALUE_OK then
			local state = s_getValue(etype1,eid1,VALUE_TYPE_GOODSTATE)
			if state == 0 then
				s_sendGoodNess(etype1,eid1,1,GoodNess_RioterTime)
			end
		end
	end
	local time = {4,5,6,7}
	s_addbuff(etype2,eid2,10611,level,time[level])
	s_addbuff(etype2,eid2,10716,level,20+time[level])
	s_addbuff(etype2,eid2,10717,level,20+time[level])
	if s_getRuneDur(eid1,10615) > 0 then
		s_addbuff(etype2,eid2,20520,10,5)
		s_reduceRuneDur(eid1,10615)
	end
	ShowAttackWithHurType(10615,etype1,eid1,etype2,eid2)
end
