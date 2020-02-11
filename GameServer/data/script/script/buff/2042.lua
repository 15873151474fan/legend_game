function OnHoldBuff_2042(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,240)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,720)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,240)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,720)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,240)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,720)
end
