--财神
function OnHoldBuff_4011(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,2500)
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,800)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,800)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_VALUE,2500)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_DEF_PER,400)
end
