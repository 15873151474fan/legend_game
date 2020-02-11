function OnHoldBuff_9004(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,40)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,120)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,40)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,120)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,40)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,120)
end
