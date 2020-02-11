-- 坚韧Lv1
function OnHoldBuff_11301(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDEF,206)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,309)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,154)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,257)
end
