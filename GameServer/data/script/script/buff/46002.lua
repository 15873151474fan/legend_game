function OnHoldBuff_46002(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDAM_SUB_PER,1000)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM_SUB_PER,1000)
	s_addValue(etype,eid,VALUE_TYPE_TMAXDAM_SUB_PER,1000)
end
