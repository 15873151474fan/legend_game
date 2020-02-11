--装备副本神力
function OnHoldBuff_41122(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,400)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,400)
end
