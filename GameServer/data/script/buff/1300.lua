--法术盾(增加%1%2%3%4的伤害抵挡)
function OnRemoveBuffEvent_1300(level,etype,eid,time)
	if time == 0 then
        local percent = {30,31,32,33,35}
        s_subValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,percent[level]*100)
        s_subValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,percent[level]*100)
	end
end
function OnAddBuffEvent_1300(level,etype, eid,value)
end

function OnHoldBuff_1300(level,etype,eid)
	local percent = {30,31,32,33,35}
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,percent[level]*100)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,percent[level]*100)
end
