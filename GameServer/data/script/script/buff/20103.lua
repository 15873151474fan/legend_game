function OnHoldBuff_20103(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,17)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,36)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,14)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,40)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,7)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,14)
end
