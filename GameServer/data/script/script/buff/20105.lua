function OnHoldBuff_20105(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,42)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,75)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,36)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,73)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,18)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,36)
end
