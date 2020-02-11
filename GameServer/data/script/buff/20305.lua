function OnHoldBuff_20305(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,42)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,75)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,36)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,73)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,18)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,36)
end
