--红宝祝福1
function OnHoldBuff_4001(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,600)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,300)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,300)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,900)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_DEF_PER,150)
end
