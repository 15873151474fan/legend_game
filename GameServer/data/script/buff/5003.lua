function OnHoldBuff_5003(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,1500)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,200)
end
