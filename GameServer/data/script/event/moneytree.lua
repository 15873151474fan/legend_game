--摇钱树任务处理
function MoneyTreeTask(uid,reqtype)
    local taskid = 30001;
    --接受任务
    if reqtype == 2 then
        if(s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL) < 55 ) then
            s_sysInfo(uid,"请先升到55级再来接取",ChatPos_Tips)
            return;
        end

        --是否是任务第一次玩,第一次玩不扣次数
        local bfirst = 0;
        local taskProcess = s_getTaskValue(uid, 1119, TaskValue_Process)
        if taskProcess == TaskProcess_Doing  then 
            bfirst = 1; 
        end
        local taskProcess = s_getTaskValue(uid, 1129, TaskValue_Process)
        if taskProcess == TaskProcess_Doing  then 
            bfirst = 1; 
        end
        local taskProcess = s_getTaskValue(uid, 1142, TaskValue_Process)
        if taskProcess == TaskProcess_Doing  then 
            bfirst = 1; 
        end
        local taskProcess = s_getTaskValue(uid, 1149, TaskValue_Process)
        if taskProcess == TaskProcess_Doing  then 
            bfirst = 1; 
        end

        if s_getVar(uid,165,1) >= 2  and bfirst == 0 then
            s_sysInfo(uid,"今天已经完成2次摇钱树任务，还有更多精彩内容等着你哦",ChatPos_Tips)
            return;
        end
        local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
        if taskProcess ~= nil and taskProcess ~= TaskProcess_None then
            s_sysInfo(uid,"当前摇钱树任务还未完成，不能重复接取",ChatPos_Tips)
            return;
        end

        s_setVar(uid,165,1,s_getVar(uid,165,1) + 1);
        AddRoleTaskForGM(uid,taskid)

    --完成任务
    elseif reqtype == 3 then
        local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
        if taskProcess ~= TaskProcess_CanDone then
            s_sysInfo(uid,"任务还未完成",ChatPos_Tips)
            return;
        end
        FinishRoleTask(uid,taskid);
        s_refreshDayTaskNum(uid,30001, s_getVar(uid,165,1))

        --完成主线任务
        local taskProcess = s_getTaskValue(uid, 1119, TaskValue_Process)
        if taskProcess == TaskProcess_Doing then
            AddRoleTaskOperate(uid,1119)
        end
        --完成主线任务
        local taskProcess = s_getTaskValue(uid, 1129, TaskValue_Process)
        if taskProcess == TaskProcess_Doing then
            AddRoleTaskOperate(uid,1129)
        end
        --完成主线任务
        local taskProcess = s_getTaskValue(uid, 1142, TaskValue_Process)
        if taskProcess == TaskProcess_Doing then
            AddRoleTaskOperate(uid,1142)
        end
        --完成主线任务
        local taskProcess = s_getTaskValue(uid, 1149 ,TaskValue_Process)
        if taskProcess == TaskProcess_Doing then
            AddRoleTaskOperate(uid,1149)
        end
    end

end

--每日完成次数
function MoneyTreeTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30001)
	--dayNum
	table.insert(outvec, 2)
	--dayDoneNum
	table.insert(outvec, s_getVar(uid,165,1))
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
