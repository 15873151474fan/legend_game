-- 生命LV3
function OnHoldBuff_11403(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,200)
	s_addValue(etype,eid,VALUE_TYPE_MAXHP_ADD_PER,0)
end