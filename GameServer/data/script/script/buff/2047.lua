function OnHoldBuff_2047(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,600)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,1800)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,600)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,1800)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,600)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,1800)
end
