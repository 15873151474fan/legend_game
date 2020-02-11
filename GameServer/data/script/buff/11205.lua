-- 强攻Lv5
function OnHoldBuff_11205(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,492)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,985)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,675)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,798)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,554)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,923)
end
