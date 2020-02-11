--钻石月卡
function OnHoldBuff_7002(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_MIN_MON_DEF,2400)
	s_addValue(etype,eid,VALUE_TYPE_MAX_MON_DEF,4000)
end
