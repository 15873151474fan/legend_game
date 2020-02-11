function OnHoldBuff_20405(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,24)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,41)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,24)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,49)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,12)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,24)
end
