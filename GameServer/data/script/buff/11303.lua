-- 坚韧Lv3
function OnHoldBuff_11303(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDEF,343)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,515)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,257)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,429)
end
