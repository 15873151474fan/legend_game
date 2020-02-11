function OnHoldBuff_35001(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,10)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,30)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,10)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,30)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,10)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,30)
end
