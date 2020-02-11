function OnHoldBuff_6079(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,24)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,86)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,4)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,12)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,4)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,12)
end
