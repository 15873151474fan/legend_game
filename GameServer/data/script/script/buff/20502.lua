function OnHoldBuff_20502(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,5)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,11)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,5)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,17)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,2)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,5)
end
