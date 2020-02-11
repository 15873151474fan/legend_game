function OnHoldBuff_20604(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,16)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,29)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,16)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,37)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,8)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,16)
end
