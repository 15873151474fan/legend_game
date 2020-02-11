function OnHoldBuff_6043(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,60)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,217)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,13)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,32)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,13)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,32)
end
