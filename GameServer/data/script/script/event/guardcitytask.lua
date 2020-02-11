--请求进入守卫王者
function RequestInfoGuardCity(uid)
    if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL) < 66 then
        s_sysInfo(uid,"塔防封魔66级开启",ChatPos_Tips)
        return;
    end
    GuardCityCopyHistory = GuardCityCopyHistory or {}
	if GuardCityCopyHistory[uid] == nil then
		GuardCityCopyHistory[uid] = 0
	end
    --local curdaynum = s_getVar(uid,162,2)
    --if curdaynum > 3 then
        --s_sysInfo(uid,"今日次数已用完，请明日再来挑战")
        --return;
    --end
    --s_setVar(uid,162,2,curdaynum + 1)
    --local copysid = s_getVar(uid,162,1)
    local copysid = GuardCityCopyHistory[uid]
    s_debug("copyid="..copysid)
    if copysid ~= 0  and  s_getCopyMapid(copysid,uid) ~= nil and s_getCopyMapid(copysid,uid) ~= 0   then
        if s_gocopymap(SCENE_ENTRY_PLAYER,uid,copysid,13,13) == VALUE_FAIL then
            --在这做个保险，进入失败的话进入一个新的副本
            s_setVar(uid,162,1,0)
            s_setVar(uid,162,3,0)
            s_intoCopyCustomSingle(uid, 2001,182,13,13)
        end
    else
        s_setVar(uid,162,1,0)
        s_setVar(uid,162,3,0)

        local copysceneid = s_intoCopyCustomSingle(uid, 2001,182,13,13)
        GuardCityCopyHistory[uid] = copysceneid;
    end

    if s_getSceneVar(copyid,1,2) ~= 1 then
        s_setVar(uid,162,3,0)
    end

end

--召唤守卫
function RequestCallGuardType(uid,guardtype)
    s_debug("guardtype ="..guardtype)
    --local copyid = s_getVar(uid,162,1)
    GuardCityCopyHistory = GuardCityCopyHistory or {}
    local copyid = GuardCityCopyHistory[uid]
    if copyid == 0 or copyid == nil then
        s_sysInfo(uid,"请等刷怪结束后，离开副本重新进入再召唤",ChatPos_Tips)
        return;
    end

    --在刷的过程中不判断次数
    if s_getSceneVar(copyid,1,2,1) == 1 then

        --如果召唤的等级低于当前等级不让召唤
        if s_getVar(uid,162,3) > guardtype then
            s_sysInfo(uid,"该守卫比当前守卫级别低，无法召唤",ChatPos_Tips)
            return;
        end

        --普通守卫
        if guardtype == 1 then
            s_setSceneVar(copyid,1,1,1)
            s_setVar(uid,162,3,1)
        --1.5倍奖励
        elseif guardtype == 2 then
            if s_removeMoney(uid,MoneyType_Money,100,"皇城守卫") ~= VALUE_OK then
                s_sysInfo(uid,"绑定元宝不足，不能刷新",ChatPos_Tips)
                return;
            end
            s_setSceneVar(copyid,1,1,2)
            s_setVar(uid,162,3,2)
            --2倍奖励
        elseif guardtype == 3 then
            if s_removeMoney(uid,MoneyType_Gold,50,"皇城守卫") ~= VALUE_OK then
                s_sysInfo(uid,"元宝不足，不能刷新",ChatPos_Tips)
                return;
            end
            s_setSceneVar(copyid,1,1,3)
            s_setVar(uid,162,3,3)
        end
        return;
    end

    --是否是任务第一次玩,第一次玩不扣次数，不元宝
    local bfirst = s_getVar(uid,162,8);
 local bfree = 0;

--	local taskProcess = s_getTaskValue(uid, 5072, TaskValue_Process)
--	if taskProcess == TaskProcess_Doing then
  --      bfirst = 1;
--    end

	--[[local taskProcess = s_getTaskValue(uid, 1120, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        bfirst = 1;
        bfree =1;
    end]]
--[[
	local taskProcess = s_getTaskValue(uid, 1151, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        bfirst = 1;
        bfree = 1;
    end
]]
    s_debug(uid.."..bfirst.."..bfirst)

    local curdaynum = s_getVar(uid,162,2)
    if bfirst == 1 then
        if curdaynum >= 3 then
            s_sysInfo(uid,"今日次数已用完，请明日再来挑战",ChatPos_Tips)
            return;
        end
    end

    --普通守卫
    if guardtype == 1 then
        s_setSceneVar(copyid,1,1,1)
        s_setVar(uid,162,3,1)
    --1.5倍奖励
    elseif guardtype == 2 then
		if bfirst == 1 then
		  if s_removeMoney(uid,MoneyType_Money,100,"皇城守卫") ~= VALUE_OK then
		        s_sysInfo(uid,"绑定元宝不足，不能刷新",ChatPos_Tips)
		        return;
			end
		elseif bfirst == 1 then
            s_sysInfo(uid,"刷新",ChatPos_Tips)
        end
        s_setSceneVar(copyid,1,1,2)
        s_setVar(uid,162,3,2)
        --2倍奖励
    elseif guardtype == 3 then
        if bfirst == 1 then
            if s_removeMoney(uid,MoneyType_Gold,50,"皇城守卫") ~= VALUE_OK then
                s_sysInfo(uid,"元宝不足，不能刷新",ChatPos_Tips)
                return;
            end
        --后面的任务要扣钱，但不抽次数
        elseif bfirst == 0 then
                s_sysInfo(uid,"刷新",ChatPos_Tips)
        end
        s_setSceneVar(copyid,1,1,3)
        s_setVar(uid,162,3,3)
    end

    if bfirst == 1 then
        s_setVar(uid,162,2,curdaynum + 1)
    end

    if  s_getSceneVar(copyid,1,2,1) == 0 and s_getSceneVar(cid,1,5) == 0 then
        RequestStartGuardFigth(uid,bfirst);
    end
	if bfirst == 0 then
		--s_trace("守卫中都时间.."..s_getSceneVar(copyid,1,6))
		RegisterTimeTriggerCallBack(s_getSceneVar(copyid,1,6) * 1000,"LevelOffCopy",uid)
		--RegisterTimeTriggerCallBack(20 * 1000,"LevelOffCopy",uid)
	end

	s_setVar(uid,162,8,1)
    s_refreshDayTaskNum(uid,30002,s_getVar(uid,162,2))
end
--守卫王城开始战斗()
function RequestStartGuardFigth(uid,bfirst)
    local copyid = s_getVar(uid,162,1)
    if copyid == 0 or copyid == nil then
        s_sysInfo(uid,"未在副本,不能该操作",ChatPos_Tips)
        return;
    end

    if s_getSceneVar(copyid,1,2) ~= 0 then
        s_sysInfo(uid,"当前怪物还没刷完，请先消灭当前的怪物",ChatPos_Tips)
        return;
    end


    s_setVar(uid,162,4,1)
    s_setSceneVar(copyid,1,2,1);
    s_setSceneVar(copyid,1,6,10000)
    if bfirst == 1 then
    	s_addDailyTargetTime(uid, enumDailySubTargetType_Guard, 1)
    end
    s_debug("守卫中都开始......")

end
function LevelOffCopy(uid,tid)
		s_trace("第一次守卫中都自动离开副本")
		DeleteTimeTriggerCallBack(tid)
    	local copyid = GuardCityCopyHistory[uid]
    	if copyid == 0 or copyid == nil then
			return;
		end
		if s_getSceneVar(copyid,1,2) ~= 0 then
        	return;
    	end
		if s_getSceneVar(copyid,1,6) > 5 then
			return;
		end
		s_levelShouweizhongdu(uid)
end
--[[function CopySceneInfo_2001:OnPlayerIntoCopyScene(sid, uid)
--	s_trace("进入副本111=="..sid.."=="..uid)
    local taskProcess = s_getTaskValue(uid,1120, TaskValue_Process)
     if taskProcess == TaskProcess_Doing then
         AddRoleTaskOperate(uid,1120)
     end

end]]





