function OnHoldBuff_50001(level,etype,eid,time,value)
	s_trace("tttttttttttttttttime = "..time)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,15)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,15)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,15)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,15)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,15)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,15)
end
