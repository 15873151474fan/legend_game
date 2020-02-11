--超级血包每3秒恢复3000mp
function OnLoopBuffEvent_3Sec_30004(level,etype,eid,time,value)
    local remainvalue = 0
    if s_isDead(eid) == VALUE_OK then
        return remainvalue;
    end
	if value <= 0 then
        s_removebuff(etype,eid,30004)
    else
        local curlevel = s_getValue(etype,eid,VALUE_TYPE_LEVEL)
        local addmax = 0;
        if curlevel < 61 then
            addmax = 1000
        elseif curlevel < 85 then
            addmax = 1500
        else 
            addmax = 2500
        end
        local curhp = s_getValue(etype,eid,VALUE_TYPE_SP);
        local maxhp = s_getValue(etype,eid,VALUE_TYPE_MAXSP)
        if curhp == nil or maxhp == nil then
            return remainvalue;
        end
        local addvalue = maxhp - curhp;
        if addvalue > 0 then
            if value >= addvalue and addvalue <= addmax then
                s_addValue(etype,eid,VALUE_TYPE_SP,addvalue)
                remainvalue = value - addvalue
            elseif value >= addvalue and addvalue > addmax then
                s_addValue(etype,eid,VALUE_TYPE_SP,addmax)
                remainvalue = value - addmax
            else
                s_addValue(etype,eid,VALUE_TYPE_SP,value)
                remainvalue = 0

            end
            s_updateBuffValue(etype,eid,30004,remainvalue)

        end
	end
    return remainvalue;
end
