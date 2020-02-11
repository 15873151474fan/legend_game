-- 暴击抵抗LV04
function OnHoldBuff_11104(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,47)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,95)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,66)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,78)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,53)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,89)
	s_addValue(etype,eid,VALUE_TYPE_LUCKYDEF,2892)
end
