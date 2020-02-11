-- 暴击LV10
function OnHoldBuff_11010(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,4073)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,58)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,71)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,63)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,66)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,60)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,70)
end
