-- 强攻Lv8
function OnHoldBuff_11208(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,326)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,732)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,478)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,579)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,376)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,681)
end
