-- 强攻Lv7
function OnHoldBuff_11207(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,1032)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,2064)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,1415)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,1672)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,1160)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,1934)
end
