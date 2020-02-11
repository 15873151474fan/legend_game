--施毒(防御降低25%，持续期间每3秒受到一次伤害，每次受到伤害为道术攻击的10%)
function OnLoopBuffEvent_3Sec_1500(level,etype,eid,time,value)
	if value ~= 0 then
        if s_checkZoneType(etype,eid,ZONE_ABSOLUTE) == VALUE_OK then
            return;
        end
        local curhp = s_getValue(etype,eid,VALUE_TYPE_HP);
        if curhp <= value then
            s_setValue(etype,eid,VALUE_TYPE_HP,1);
        else
            s_subValue(etype,eid,VALUE_TYPE_HP,value)
        end
		--DirectAttack(5052,etype,eid,etype,eid,value)
	end
end
function OnRemoveBuffEvent_1500(level,etype,eid,time,value)
	if time == 0 then
        s_subValue(etype,eid,VALUE_TYPE_PDEF_SUB_PER,2500)
        s_subValue(etype,eid,VALUE_TYPE_MDEF_SUB_PER,2500)
	end
end

function OnAddBuffEvent_1500(level,etype, eid,value)
	s_addValue(etype,eid,VALUE_TYPE_PDEF_SUB_PER,2500)
	s_addValue(etype,eid,VALUE_TYPE_MDEF_SUB_PER,2500)
end

