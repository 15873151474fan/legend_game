--红宝祝福5
function OnHoldBuff_4005(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,300)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,200)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,200)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,300)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_DEF_PER,50)
end
