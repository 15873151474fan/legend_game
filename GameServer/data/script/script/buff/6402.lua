--钻石月卡
function OnHoldBuff_6402(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_MIN_MON_DEF,1500)
	s_addValue(etype,eid,VALUE_TYPE_MAX_MON_DEF,2000)
end
