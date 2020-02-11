function OnHoldBuff_2038(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,66)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,200)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,66)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,200)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,66)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,200)
end
