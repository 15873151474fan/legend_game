--瞻仰城主脚本文件

function EventVisitMaster(etype, eid, elevel, rtime)
	if eid == 0 then
		return
	end
	s_addbuff(etype, eid, 2008, 1, rtime, elevel)

    --每日目标次数
    s_addDailyTargetTime(eid, enumDailySubTargetType_Prostrate, 1)
	if s_getVar(uid, 147, 2) == 0 then
		s_addDailyTargetTime(eid, enumDailySubTargetType_xianshi, 1)
		s_setVar(eid,147,2,1)
	end
end

--获得瞻仰城主经验
function GetVMExp(level)
	if level < 40 then
		s_debug("瞻仰城主等级不够")
		return
	end
	local eid = 0
	if level >= 40 and level < 80 then
		eid = 40
	elseif level >= 80 and level < 90 then
		eid = 80
	elseif level >= 90 and level < 100 then
		eid = 90
	else
		eid = 100
	end

	return VMExpDataBase[eid].exp
end
