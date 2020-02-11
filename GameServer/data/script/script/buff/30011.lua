--幸运药水
function OnHoldBuff_30011(level,etype,eid,value)
	s_addValue(etype,eid,VALUE_TYPE_LUCK,value)
end

function OnRemoveBuffEvent_30011(level,etype,eid,value)
	s_subValue(etype,eid,VALUE_TYPE_LUCK,value)

end
