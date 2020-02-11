--附加伤害
function OnHoldBuff_44001(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_MAX_MON_ATT,3000)
    s_addValue(etype,eid,VALUE_TYPE_MIN_MON_ATT,3000)
    s_debugUser(eid,"神力特戒buf 44001 增加3000伤害")
end
