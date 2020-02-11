function OnHoldBuff_9002(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,20)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,60)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,20)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,60)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,20)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,60)
end
