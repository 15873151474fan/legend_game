-- 情义
function OnHoldBuff_12001(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDEF,50)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,70)
	s_addValue(etype,eid,VALUE_TYPE_MDAM,40)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,60)
end
