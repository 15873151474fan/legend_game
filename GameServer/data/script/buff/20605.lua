function OnHoldBuff_20605(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,24)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,41)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,24)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,49)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,12)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,24)
end
