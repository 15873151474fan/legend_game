function OnHoldBuff_6061(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,110)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,395)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,24)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,58)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,24)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,58)
end
