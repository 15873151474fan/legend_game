function OnHoldBuff_6081(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,23)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,61)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,15)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,26)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,15)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,26)
end
