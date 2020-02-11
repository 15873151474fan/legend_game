function OnHoldBuff_20102(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,8)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,21)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,7)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,25)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,4)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,7)
end
