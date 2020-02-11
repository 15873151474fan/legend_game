function OnHoldBuff_6011(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,1000)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,100)
    s_addValue(etype,eid,VALUE_TYPE_MAXINTERVALUE,965)
end
