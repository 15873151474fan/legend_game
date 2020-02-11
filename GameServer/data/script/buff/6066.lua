function OnHoldBuff_6066(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,16)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,45)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,17)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,29)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,6)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,12)
end
