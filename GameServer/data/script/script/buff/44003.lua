--治愈特戒 恢复5%生命
function OnHoldBuff_44003(level,etype,eid)
s_trace("OnHoldBuff_44003........................................")    
local remainvalue = 0
    if s_isDead(eid) == VALUE_OK then
        return remainvalue;
    end
	local curhp = s_getValue(etype,eid,VALUE_TYPE_HP);
    local maxhp = s_getValue(etype,eid,VALUE_TYPE_MAXHP)
    s_trace("OnHoldBuff_44003==================maxhp "..maxhp)
    if curhp == nil or maxhp == nil then
		return remainvalue;
    end
    local addvalue = 0.05 * maxhp;
    if addvalue > 0 then
        s_addValue(etype,eid,VALUE_TYPE_HP,addvalue)
		s_debugUser(eid,"戒指buf 44003，增加血量"..addvalue.." 增加后血量为"..s_getValue(etype,eid,VALUE_TYPE_HP))
    end
    return remainvalue;
end
