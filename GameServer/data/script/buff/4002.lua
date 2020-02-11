--红宝祝福2
function OnHoldBuff_4002(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,500)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,300)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,300)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,700)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_DEF_PER,120)
end
