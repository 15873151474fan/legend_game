function OnHoldBuff_2043(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,300)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,900)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,300)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,900)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,300)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,900)
end
