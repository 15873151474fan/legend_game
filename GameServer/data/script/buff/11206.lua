-- 强攻Lv6
function OnHoldBuff_11206(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,656)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,1313)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,900)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,1064)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,738)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,1230)
end
