--宝图任务
function TreasureTaskInfo(uid,tasktype) 
    --接受任务
    if tasktype == 6 then
        if(s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL) < 70 ) then
            s_sysInfo(uid,"小于70级不能接取",ChatPos_Tips)
            return;
        end
        if s_getVar(uid,167,10) >= 5 then
            s_sysInfo(uid,"今日已达到上限，请明日再来",ChatPos_Tips)
            return;
        end
        if s_getVar(uid,167,11) ~= 0 then
            s_sysInfo(uid,"任务还未完成，不能接取",ChatPos_Tips)
            return;
        end
        local rand_taskid = {32001,32002,32003,32004,32005}
        local taskid = rand_taskid[math.random(1,5)]
        --保存任务id
        s_setVar(uid,167,11,taskid)
        s_setVar(uid,167,10,s_getVar(uid,167,10) + 1)
        AddRoleTaskForGM(uid,taskid)
    --交任务
    elseif tasktype == 7  then
        local taskid = s_getVar(uid,167,11)
        if taskid == 0 then
            s_sysInfo(uid,"身上没有任务，不能完成",ChatPos_Tips)
            return;
        end
        local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
        if  taskProcess ~= TaskProcess_CanDone then
            s_sysInfo(uid,"任务还未完成，请先完成任务",ChatPos_Tips)
            return;
        end
        --检查背包已满状态,是否有宝箱
	    --local awarditem = GetTaskAwardItem(uid, taskid)
        --if awarditem ~= nil and s_checkItem(uid,1023,1) == VALUE_FAIL then
            --if s_getAutoPackSpace(uid) < table.getn(awarditem) then
                --s_trace(">>>>>>>>>>>>>>>>>>>>>>>.")
               -- s_sysInfo(uid,"您的背包已满,请清理背包!",ChatPos_Tips)
               -- s_sendCustomNotice(uid,1);
                --return;
           -- end
       -- end
        FinishRoleTask(uid,taskid);
        s_setVar(uid,167,11,0)
        --清空身上的任务
    end

end
