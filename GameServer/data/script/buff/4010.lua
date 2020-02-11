--红宝祝福3
function OnHoldBuff_4010(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,1200)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,400)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,400)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,1300)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_DEF_PER,200)
end
