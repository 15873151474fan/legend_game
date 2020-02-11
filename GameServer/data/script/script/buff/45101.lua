--战甲术1级(增加防御)
function OnRemoveBuffEvent_45101(level,etype,eid,time,value)
	--if time == 0 then
        s_addValue(etype,eid,VALUE_TYPE_PDEF,value*-1)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,value*-1)
	--s_debug("OnRemoveBuffEvent_45101  66666666666 orgva="..va)
	--end
end

function OnAddBuffEvent_45101(level,etype, eid,value)
--function OnHoldBuff_45101(level,etype, eid,value)
	s_addValue(etype,eid,VALUE_TYPE_PDEF,value)
	s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,value)
end

