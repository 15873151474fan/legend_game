function OnHoldBuff_9003(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,30)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,90)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,30)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,90)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,30)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,90)
end
