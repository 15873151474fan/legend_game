function OnHoldBuff_20503(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,10)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,19)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,10)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,26)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,5)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,10)
end
