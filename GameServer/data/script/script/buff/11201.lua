-- 强攻Lv1
function OnHoldBuff_11201(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,150)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,300)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,205)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,243)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,168)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,281)
end
