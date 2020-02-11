function OnHoldBuff_44008(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_LUCKY_PER,10000)
	s_debugUser(eid,"特戒buf 44008 暴击10000")
end
