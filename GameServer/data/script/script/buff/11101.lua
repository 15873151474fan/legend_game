-- 暴击抵抗LV01
function OnHoldBuff_11101(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,37)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,74)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,51)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,60)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,41)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,69)
	s_addValue(etype,eid,VALUE_TYPE_LUCKYDEF,1928)
end
