function OnHoldBuff_20401(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,2)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,5)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,2)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,8)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,1)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,2)
end
