--金刚咒(增加防御)
function OnRemoveBuffEvent_1501(level,etype,eid,time,value)
	if time == 0 then
        s_subValue(etype,eid,VALUE_TYPE_PDEF_ADD_BASE,value)
        s_subValue(etype,eid,VALUE_TYPE_MDEF_ADD_BASE,value)
	end
end

function OnAddBuffEvent_1501(level,etype, eid,value)
	s_addValue(etype,eid,VALUE_TYPE_PDEF_ADD_BASE,value)
	s_addValue(etype,eid,VALUE_TYPE_MDEF_ADD_BASE,value)
end

