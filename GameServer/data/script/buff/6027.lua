function OnHoldBuff_6027(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,30)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,78)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,20)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,34)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,20)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,34)
end
