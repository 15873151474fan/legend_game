--超级血包每3秒恢复1500hp
function OnLoopBuffEvent_3Sec_30003(level,etype,eid,time,value)
    local remainvalue = 0
    if s_isDead(eid) == VALUE_OK then
        return remainvalue;
    end
	if value <= 0 then
        s_removebuff(etype,eid,30003)
    else
        local curhp = s_getValue(etype,eid,VALUE_TYPE_HP);
        local maxhp = s_getValue(etype,eid,VALUE_TYPE_MAXHP)
        local curlevel = s_getValue(etype,eid,VALUE_TYPE_LEVEL)
        local addmax = 0;
        if curlevel < 61 then
            addmax = 800
        elseif curlevel < 85 then
            addmax = 1200
        else 
            addmax = 1600
        end
        if curhp == nil or maxhp == nil then
            return remainvalue;
        end
        local addvalue = maxhp - curhp;
        if addvalue > 0 then
            if value >= addvalue and addvalue <= addmax then
                s_addValue(etype,eid,VALUE_TYPE_HP,addvalue)
                remainvalue = value - addvalue
            elseif value >= addvalue and addvalue > addmax then
                s_addValue(etype,eid,VALUE_TYPE_HP,addmax)
                remainvalue = value - addmax
            else
                s_addValue(etype,eid,VALUE_TYPE_HP,value)
                remainvalue = 0

            end
            s_updateBuffValue(etype,eid,30003,remainvalue)

        end
	end
    return remainvalue;
end
