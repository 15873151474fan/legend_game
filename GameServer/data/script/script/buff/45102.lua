--战甲术2级(增加防御)
function OnRemoveBuffEvent_45102(level,etype,eid,time,value)
	--value=value+40
	s_debug("OnRemoveBuffEvent_45102 del value="..value)
	--if time == 0 then
	s_addValue(etype,eid,VALUE_TYPE_PDEF,value*-1)
        s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,value*-1)
	--end
end

function OnAddBuffEvent_45102(level,etype, eid,value)
	--value=value+40
	s_addValue(etype,eid,VALUE_TYPE_PDEF,value)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,value)
end

