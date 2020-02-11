function OnHoldBuff_5001(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,1000)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,150)
end
