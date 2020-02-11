-- 暴击抵抗LV07
function OnHoldBuff_11107(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,58)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,116)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,81)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,96)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,65)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,109)
	s_addValue(etype,eid,VALUE_TYPE_LUCKYDEF,5141)
end
