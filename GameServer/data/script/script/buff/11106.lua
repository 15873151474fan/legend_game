-- 暴击抵抗LV06
function OnHoldBuff_11106(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,54)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,109)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,76)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,90)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,61)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,102)
	s_addValue(etype,eid,VALUE_TYPE_LUCKYDEF,3856)
end
