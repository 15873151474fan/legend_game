-- 坚韧Lv2
function OnHoldBuff_11302(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDEF,261)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,392)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,196)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,327)
end
