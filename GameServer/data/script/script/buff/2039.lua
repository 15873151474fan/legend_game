function OnHoldBuff_2039(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,100)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,300)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,100)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,300)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,100)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,300)
end
