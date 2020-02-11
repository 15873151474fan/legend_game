-- 暴击抵抗LV02
function OnHoldBuff_11102(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,40)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,81)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,56)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,66)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,45)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,76)
	s_addValue(etype,eid,VALUE_TYPE_LUCKYDEF,1958)
end
