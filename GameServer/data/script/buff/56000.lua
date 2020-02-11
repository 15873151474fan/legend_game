function OnHoldBuff_56000(level,etype,eid,time,value)
    s_addValue(etype,eid,VALUE_TYPE_MON_ATT_PER,300)
end

function OnRemoveBuffEvent_56000(level,etype,eid,time,value)
	s_debug(">>>>>>>>>>>>>>>>OnRemoveBuffEvent_56000")
	if time == 0 then
	
        s_subValue(etype,eid,VALUE_TYPE_MON_ATT_PER,300)
	end
end
