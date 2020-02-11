function OnHoldBuff_20306(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,60)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,102)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,50)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,94)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,26)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,50)
end
