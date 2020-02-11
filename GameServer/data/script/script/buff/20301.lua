function OnHoldBuff_20301(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,3)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,9)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,2)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,12)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,1)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,2)
end
