function OnHoldBuff_20206(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,60)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,102)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,50)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,94)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,26)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,50)
end
