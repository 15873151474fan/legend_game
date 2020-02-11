function OnHoldBuff_20610(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,99)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,149)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,90)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,138)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,57)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,89)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,146)
end
