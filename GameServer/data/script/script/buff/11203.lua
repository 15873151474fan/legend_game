-- 强攻Lv3
function OnHoldBuff_11203(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,295)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,591)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,405)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,478)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,332)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,553)
end
