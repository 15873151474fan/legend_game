-- 坚韧Lv5
function OnHoldBuff_11305(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDEF,719)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,1079)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,539)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,899)
end
