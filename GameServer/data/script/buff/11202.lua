-- 强攻Lv2
function OnHoldBuff_11202(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAM,187)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,375)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,257)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,304)
	s_addValue(etype,eid,VALUE_TYPE_TDAM,211)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,351)
end
