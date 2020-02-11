function OnHoldBuff_2040(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,140)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,420)
    s_addValue(etype,eid,VALUE_TYPE_MDAM,140)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDAM,420)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,140)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,420)
end
