function OnHoldBuff_20402(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,5)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,11)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,5)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,17)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,2)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,5)
end
