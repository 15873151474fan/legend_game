function OnHoldBuff_51002(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,24)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,87)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,8)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,19)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,3)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,8)
end
