function OnHoldBuff_43123(level,etype,eid,value)
--    if s_getVar(eid,1,99) ~= 0 or s_getVar(eid,293,5) ~= 0 then
--        s_debug("身上有坐骑，buff:1601不生效")
--        return;
--    end
	s_addValue(etype,eid,VALUE_TYPE_SPEED_ADD_PER,600)
end
