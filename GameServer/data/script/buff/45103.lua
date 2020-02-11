--金刚咒(增加防御)
function OnRemoveBuffEvent_45103(level,etype,eid,time,value)
	--if time == 0 then
	s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,value*-1)
	s_addValue(etype,eid, VALUE_TYPE_PDEF,value*-1)
	--end
end

function OnAddBuffEvent_45103(level,etype, eid,value)
	 s_debug("OnAddBuffEvent_45103")
	 s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,value)
	 s_addValue(etype,eid, VALUE_TYPE_PDEF,value)
end

