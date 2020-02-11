function OnHoldBuff_9006(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,60)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,180)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,60)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,180)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,60)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,180)
end
