function OnHoldBuff_36002(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,20)
    s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,20)
    s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,20)
    s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,20)
end
