function OnHoldBuff_5004(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,1500)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,200)
    s_addValue(etype,eid,VALUE_TYPE_MIN_MON_ATT,800)
    s_addValue(etype,eid,VALUE_TYPE_MAX_MON_ATT,1200)
end
