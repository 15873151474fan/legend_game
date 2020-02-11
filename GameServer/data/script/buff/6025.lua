function OnHoldBuff_6025(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,30)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,110)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,6)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,16)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,6)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,16)
end
