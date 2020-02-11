--押镖减速20%
function OnHoldBuff_2007(level,etype,eid)
	local taskProcess = s_getTaskValue(eid, 1036, TaskValue_Process)
	local risespeed = 0
	if taskProcess ~= TaskProcess_Doing then
		risespeed = s_riseSpeed(eid)
        s_addValue(etype,eid,VALUE_TYPE_SPEED_SUB_PER,3000 - risespeed)
    end
end
