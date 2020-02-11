--战神护体(增加%5的伤害抵挡(魔法及物理攻击抵挡))
function OnRemoveBuffEvent_1100(level,etype,eid,time)
	if time == 0 then
        local percent = {60,70,75,80}
        s_subValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,percent[level]*100)
        s_subValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,percent[level]*100)
	end
end

function OnHoldBuff_1100(level,etype,eid)
	local percent = {60,70,75,80}
	s_addValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,percent[level]*100)
	s_addValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,percent[level]*100)
end
