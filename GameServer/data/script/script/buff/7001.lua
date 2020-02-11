--月卡
function OnHoldBuff_7001(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_MIN_MON_DEF,1080)
	s_addValue(etype,eid,VALUE_TYPE_MAX_MON_DEF,1080)
end
