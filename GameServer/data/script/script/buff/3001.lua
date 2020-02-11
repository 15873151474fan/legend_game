--装备副本神力
function OnHoldBuff_3001(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,5000)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,5000)
	s_addValue(etype,eid,VALUE_TYPE_MAX_MON_ATT,4200)
	s_addValue(etype,eid,VALUE_TYPE_MIN_MON_ATT,7000)
	s_addValue(etype,eid,VALUE_TYPE_MAX_MON_DEF,4200)
	s_addValue(etype,eid,VALUE_TYPE_MIN_MON_DEF,7000)
end
