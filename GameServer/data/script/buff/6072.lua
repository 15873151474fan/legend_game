function OnHoldBuff_6072(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_TDAM,15)
    s_addValue(etype,eid,VALUE_TYPE_TMAXDAM,40)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,9)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,17)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,9)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,17)
end
