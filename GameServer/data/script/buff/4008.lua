--红宝祝福8
function OnHoldBuff_4008(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,100)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,100)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,100)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,100)
end
