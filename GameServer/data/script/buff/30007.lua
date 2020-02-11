--魔力强化剂(增加%2的法力上限)
function OnHoldBuff_30007(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_MAXSP_ADD_PER,200)

end

