-- 暴击LV9
function OnHoldBuff_11009(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,3133)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,53)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,66)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,58)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,61)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,55)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,65)
end
