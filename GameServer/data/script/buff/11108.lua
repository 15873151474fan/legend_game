-- 暴击抵抗LV08
function OnHoldBuff_11108(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,61)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,123)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,86)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,102)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,69)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,116)
	s_addValue(etype,eid,VALUE_TYPE_LUCKYDEF,8079)
end
