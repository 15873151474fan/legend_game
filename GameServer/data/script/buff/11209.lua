-- 强攻Lv9
function OnHoldBuff_11209(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,447)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,983)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,647)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,781)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,513)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,915)
end
