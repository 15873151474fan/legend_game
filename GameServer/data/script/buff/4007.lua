--红宝祝福7
function OnHoldBuff_4007(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,200)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,200)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,200)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,250)
end
