-- 强攻Lv4
function OnHoldBuff_11204(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,375)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,750)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,514)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,608)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,422)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,703)
end
