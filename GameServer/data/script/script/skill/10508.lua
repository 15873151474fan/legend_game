--恐惧之咒
function OnUseSkill_10508(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype2,eid2,10726) ~= 0 then
		s_sysInfo(eid1,"对方处于恐惧之咒免疫中")
		return VALUE_FAIL
	end
	if s_getTrafficType(eid2) == TrafficType_InHorse then
		s_resetTrafficType(eid2)
	end
	s_clearbuff(etype2,eid2,BUFF_STATE_KJZZ)
	s_addbuff(etype2,eid2,10726,1,30)
	ShowAttack(10508,etype1,eid1,etype2,eid2)
end
