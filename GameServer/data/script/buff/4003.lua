--红宝祝福3
function OnHoldBuff_4003(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,400)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,200)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,200)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,500)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_DEF_PER,120)
end
