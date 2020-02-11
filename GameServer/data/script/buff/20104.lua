function OnHoldBuff_20104(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,28)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,54)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,24)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,55)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,12)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,24)
end
