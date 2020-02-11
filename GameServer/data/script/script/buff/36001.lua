function OnHoldBuff_36001(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,10)
    s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,10)
    s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,10)
    s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,10)
end
