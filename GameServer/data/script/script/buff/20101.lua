function OnHoldBuff_20101(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,3)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,9)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,2)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,12)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,1)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,2)
end
