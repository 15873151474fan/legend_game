--装备副本神力
function OnHoldBuff_41113(level,etype,eid,time,value)
	s_trace("onholdbuff 41113")
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,600)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,600)
end
