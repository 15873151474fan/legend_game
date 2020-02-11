function OnHoldBuff_6070(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,15)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,57)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,3)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,7)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,3)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,7)
end
