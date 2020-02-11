function OnHoldBuff_5002(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,1000)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,150)
    s_addValue(etype,eid,VALUE_TYPE_MIN_MON_ATT,500)
    s_addValue(etype,eid,VALUE_TYPE_MAX_MON_ATT,1000)
end
