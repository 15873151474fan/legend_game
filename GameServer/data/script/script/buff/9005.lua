function OnHoldBuff_9005(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,50)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,150)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,50)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,150)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,50)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,150)
end
