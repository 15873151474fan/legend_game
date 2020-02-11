--红宝祝福2
function OnHoldBuff_4009(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,2000)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,600)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,600)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,2000)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_DEF_PER,300)
end
