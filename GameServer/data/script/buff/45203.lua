--金刚咒(增加防御)
function OnRemoveBuffEvent_45203(level,etype,eid,time,value)
	--if time == 0 then
	s_addValue(etype,eid,VALUE_TYPE_MDEF,value*-1)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,value*-1)
	--end
end

function OnAddBuffEvent_45203(level,etype, eid,value)
	s_addValue(etype,eid,VALUE_TYPE_MDEF,value)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,value)
end

