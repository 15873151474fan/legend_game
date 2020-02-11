--生命强化剂(增加%4的生命上限)
function OnHoldBuff_30006(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_MAXHP_ADD_PER,400)

end
