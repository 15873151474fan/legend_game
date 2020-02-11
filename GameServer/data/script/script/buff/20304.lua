function OnHoldBuff_20304(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,28)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,54)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,24)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,55)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,12)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,24)
end
