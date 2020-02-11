function OnHoldBuff_6014(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,1200)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,125)
    s_addValue(etype,eid,VALUE_TYPE_MAXINTERVALUE,1330)
end
