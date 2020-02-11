--装备副本神力
function OnHoldBuff_41125(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,1000)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,1000)
end
