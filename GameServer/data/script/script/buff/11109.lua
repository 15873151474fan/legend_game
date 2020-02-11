-- 暴击抵抗LV09
function OnHoldBuff_11109(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,53)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,66)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,58)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,61)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,55)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,65)
	s_addValue(etype,eid,VALUE_TYPE_LUCKYDEF,3133)
end
