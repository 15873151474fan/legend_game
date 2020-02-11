--超级血包(大)每3秒恢复2000hp
function OnLoopBuffEvent_3Sec_30005(level,etype,eid,time,value)
	if value <= 0 then
        s_removebuff(etype,eid,30005)
    else
        local curhp = s_getValue(etype,eid,VALUE_TYPE_HP);
        local maxhp = s_getValue(etype,eid,VALUE_TYPE_MAXHP)
        local addvalue = maxhp - curhp;
        if addvalue > 0 then
            if value >= addvalue and addvalue <= 2000 then
                s_updateBuffValue(etype,eid,30005,value - addvalue )
                s_addValue(etype,eid,VALUE_TYPE_HP,addvalue)
            elseif value >= addvalue and addvalue > 2000 then
                s_updateBuffValue(etype,eid,30005,value - 2000 )
                s_addValue(etype,eid,VALUE_TYPE_HP,2000)
            else
                s_updateBuffValue(etype,eid,30005,0)
                s_addValue(etype,eid,VALUE_TYPE_HP,value)
            end
        end
	end
end
