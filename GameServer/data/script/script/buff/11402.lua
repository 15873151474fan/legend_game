-- 生命LV2
function OnHoldBuff_11402(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,100)
	s_addValue(etype,eid,VALUE_TYPE_MAXHP_ADD_PER,0)
end
