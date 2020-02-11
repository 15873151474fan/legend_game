function OnHoldBuff_20403(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,10)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,19)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,10)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,26)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,5)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,10)
end
