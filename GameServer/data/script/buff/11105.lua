-- 暴击抵抗LV05
function OnHoldBuff_11105(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,51)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,102)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,71)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,84)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,57)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,96)
	s_addValue(etype,eid,VALUE_TYPE_LUCKYDEF,3672)
end
