function OnHoldBuff_20302(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,8)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,21)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,7)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,25)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,4)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,7)
end
