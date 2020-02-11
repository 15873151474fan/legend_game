-- 暴击抵抗LV03
function OnHoldBuff_11103(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,44)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,88)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,61)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,72)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,49)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,82)
	s_addValue(etype,eid,VALUE_TYPE_LUCKYDEF,2448)
end
