function OnHoldBuff_20404(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_PDAM,16)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDAM,29)
    s_addValue(etype,eid,VALUE_TYPE_PDEF,16)
    s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,37)
    s_addValue(etype,eid,VALUE_TYPE_MDEF,8)
    s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,16)
end
