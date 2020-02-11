--狂暴特戒
function OnHoldBuff_44005(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_DAMAGE_ADD_PER,1000)
	s_addValue(etype,eid,VALUE_TYPE_SPEED_ADD_PER,3000)
   	s_debugUser(eid,"狂暴特戒buf 44005 速度3000")
end
