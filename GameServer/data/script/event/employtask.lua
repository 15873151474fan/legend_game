--接取佣兵任务
function OnRequestEmployTask(uid)
    local taskid    = 0;
    local starid    = 0;
    local targetnum = 0;
    local liliannum = 0;
    local expnum    = 0;
    local cannum    = 0;
    --是否身上有任务
    if s_getVar(uid,160,4) ~= 0 then
        --身上已有任务，发送给玩家
        starid = s_getVar(uid,160,5)
		
        local curStarData = EmployDataBase.query(starid)
        if curStarData == nil then
            s_debugUser(uid,"身上的星级为空")
            return;
        end
        taskid =s_getVar(uid,160,4)

        local taskInfo = GetTaskInfo(taskid)
        if taskInfo == nil then
            return taskid,starid,expnum,liliannum
        end
		
		expnum = GetTaskExp(uid,taskid)
--        expnum    = s_getTaskValue(uid,taskid,TaskValue_Exp)
--        expnum    = math.floor(expnum * curStarData.doubleNum * 0.01);
        targetnum = curStarData.targetNum;

		liliannum = GetTaskLilian(uid,taskid)
--        liliannum = s_getTaskValue(uid,taskid,TaskValue_LiLian)
--        liliannum = math.floor(liliannum * curStarData.doubleNum * 0.01)
        cannum    = 10 - s_getVar(uid,160,1) + s_getVar(uid,160,3);
	local tagnum = s_getVar(uid,140,100)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>>有任务佣兵任务随机任务id"..taskid)
	s_sendEmployTaskInfo(uid,taskid,targetnum,expnum,starid,cannum,liliannum,tagnum)
        return;
    end

    taskid,starid,expnum,liliannum,targetnum = EmployRefreh(uid)
    cannum    = 10 - s_getVar(uid,160,1) + s_getVar(uid,160,3);
    if taskid == 0 or starid == 0 or expnum == 0 or liliannum == 0 then
        s_debugUser(uid,"佣兵任务随机任务星级错误:"..taskid.."-"..starid.."-"..expnum.."-"..liliannum.."-"..cannum)
        return;
    end

    s_setVar(uid,160,4,taskid)
    s_setVar(uid,160,5,starid)
	local tagnum = s_getVar(uid,140,100)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>>佣兵任务随机任务id"..taskid)
    s_sendEmployTaskInfo(uid,taskid,targetnum,expnum,starid,cannum,liliannumi,tagnum)
	
end

--佣兵任务各个事件处理
function OnRefreshEmployTask(uid,taskType)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>佣兵任务类型:"..taskType)
    local taskid,starid,expnum,liliannum,cannum = 0,0,0,0,0,0;
    --刷新任务
    if taskType == 0 then
        if s_getVar(uid,160,4) ~=0 then
            local taskProcess = s_getTaskValue(uid,s_getVar(uid,160,4),TaskValue_Process)
            if TaskValue_Process ~= nil and taskProcess ~= TaskProcess_None then
                s_sysInfo(uid,"身上有任务不能刷新",ChatPos_Tips)
                return;
            end
        end
        if s_getVar(uid,160,5) >= 10 then
            s_sysInfo(uid,"当前已是最高星级，不需要刷新",ChatPos_Tips)
            return;
        end
		local flag = 0
		if s_deleteItemByBaseID(uid,10085,1,"刷新佣兵任务扣除") == VALUE_OK then
		    starid = 10;
			flag = 1;
		    s_sysInfo(uid,"本次刷新使用佣兵悬赏令,必刷10星任务",ChatPos_Tips)
		else
			if s_removeMoney(uid,MoneyType_MoneyTicket,10000,"刷新佣兵任务") ~= VALUE_OK then
				s_sysInfo(uid,"银两不足，不能刷新",ChatPos_Tips)
				return;
			end
        end

        cannum    = 10 - s_getVar(uid,160,1) + s_getVar(uid,160,3);
        taskid,starid,expnum,liliannum,targetnum = EmployRefreh(uid)
        if taskid == 0 or starid == 0 or expnum == 0 or liliannum == 0 then
            s_debugUser(uid,"佣兵任务随机任务星级错误:"..taskid.."-"..starid.."-"..expnum.."-"..liliannum.."-"..cannum)
            return;
        end
		if flag == 1 then
			starid = 10
			flag = 0
		end
        s_setVar(uid,160,4,taskid)
        s_setVar(uid,160,5,starid)
	local tagnum = s_getVar(uid,140,100)
        s_sendEmployTaskInfo(uid,taskid,targetnum,expnum,starid,cannum,liliannum,tagnum)
    --一键完成
    elseif taskType == 1 then
	local onesuccess = 0
	local tensuccess = 0
        if(s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL) < 53 ) then
            s_sysInfo(uid,"请先升到53级再来接取",ChatPos_Tips)
            return;
        end
        taskid = s_getVar(uid,160,4)
        if taskid == 0 or taskid == nil then
            s_sysInfo(uid,"没接取任务不能一键完成",ChatPos_Tips)
            return;
        end
	s_debugUser(uid,">>>>>>>>>一键完成次数 每天可买次数  = "..s_getVar(uid,160,3))
	s_debugUser(uid,">>>>>>>>>一键完成次数 s_getVar(uid,160,1) = "..s_getVar(uid,160,1))
        local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	s_debugUser(uid,">>>>>>>>>一键完成次数 不走  = "..taskProcess)
        if taskProcess ~= nil and taskProcess ~= TaskProcess_None then
            cannum    = 10 - s_getVar(uid,160,1) + s_getVar(uid,160,3);
            s_debugUser(uid,">>>>>>>>>>>>>>>所有任务已完成")
	    if cannum <= 0 then
                --s_sysInfo(uid,"今天已经完成最大次数，请明天再来",ChatPos_Tips)
                --return;
            end
        end
	if taskProcess == nil or taskProcess == TaskProcess_None then
		s_debugUser(uid,">>>>>>>>>一键完成次数 限制一天只能为10 次")
		cannum    = 10 - s_getVar(uid,160,1) + s_getVar(uid,160,3);
		if cannum <= 0 then
			s_sysInfo(uid,"今天已经完成最大次数，请明天再来",ChatPos_Tips)
			return
		end
	end
	if s_getVar(uid,140,100) == 1 then
		s_sysInfo(uid,"恭喜本轮除魔已免单一键完成，更多惊喜等待您去发现",ChatPos_Tips)
		s_setVar(uid,140,100,0)
	else
	if s_removeMoney(uid,MoneyType_Gold,5,"一键完成佣兵任务") ~= VALUE_OK then
            s_sysInfo(uid,"元宝不足，不能刷新",ChatPos_Tips)
            return;
        end
	local randnum = math.random(1,100)
	if s_getVar(uid,160,15) == 0 then
		s_setVar(uid,140,100,1)
		s_setVar(uid,160,15,1)
	else
		if randnum <= 28 then
			s_setVar(uid,140,100,1)
		end
	end
	s_debugUser(uid,">>>>>>>>>怪物死亡了，看发不发 s_getVar(uid,160,1) = "..s_getVar(uid,160,1))
	--[[if s_getVar(uid,160,1) == 10 then
		local chapterName = EmployExtraAwardDataBase.query(1)
		--s_debugUser(uid,">>>>>>>>>怪物死亡了，看发不发chapterName = "..chapterName)
		GetRewardWithMail(uid,chapterName.awarditem,"功勋除魔奖励",1,false,AddItemAction_Task)
	end]]--
	end
        if taskProcess == TaskProcess_None then
            s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>一键完成扣不口次数")
		--身上没任务才扣除次数
            if s_getVar(uid,160,1) < 10 then
		s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>11111111111111一键完成扣不口次数")
                s_setVar(uid,160,1,s_getVar(uid,160,1) + 1)
		s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>222222222一键完成扣不口次数 id = "..s_getVar(uid,160,1))
            else
                if  s_getVar(uid,160,3) > 0 then
                    s_setVar(uid,160,3,s_getVar(uid,160,3) - 1)
                else
                    s_setVar(uid,160,3,0)
                end
            end
        end

        FinishRoleTask(uid,s_getVar(uid,160,4));
        --一键完成获得双倍奖励
        s_refreshExp(uid,GetTaskExp(uid,taskid),ExpType_MainTask,0)
        s_setVar(uid,160,4,0)     --清除已接的任务
        --免费刷一次
        cannum    = 10 - s_getVar(uid,160,1) + s_getVar(uid,160,3);
        taskid,starid,expnum,liliannum,targetnum = EmployRefreh(uid)
        if taskid == 0 or starid == 0 or expnum == 0 or liliannum == 0 then
            s_debugUser(uid,"佣兵任务随机任务星级错误:"..taskid.."-"..starid.."-"..expnum.."-"..liliannum.."-"..cannum)
            return;
        end
        s_setVar(uid,160,4,taskid)
        s_setVar(uid,160,5,starid)
	local tagnum = s_getVar(uid,140,100)
        --s_sendEmployTaskInfo(uid,taskid,targetnum,expnum,starid,cannum,liliannum,tagnum)
		--离线找回
		if s_getVar(uid,169,102) < 10 then
			s_setVar(uid,169,102,s_getVar(uid,169,102)+1)
		end
		if s_getVar(uid,169,102) <= 10 then
			s_setVar(uid,169,108,10 - s_getVar(uid,169,102))
		end
		if s_getVar(uid,169,102) == 10 then
			s_setVar(uid,169,108,0)
		end
	if s_getVar(uid,160,12) == 0 then
	if s_getVar(uid,160,1) == 10 then
		local chapterName = EmployExtraAwardDataBase.query(1)
		GetRewardWithMail(uid,chapterName.awarditem,"功勋除魔奖励",1,false,AddItemAction_Task)
		s_setVar(uid,160,12,1)
		tensuccess = 1
	end
	end
	onesuccess = 1
	s_sendEmployTaskInfo(uid,taskid,targetnum,expnum,starid,cannum,liliannum,tagnum)
	s_debugUser(uid,">>>>>>>>>>>>>>>>完成是佛发送成功奖励:"..onesuccess..","..tensuccess)
	s_sendemploysuccess(uid,onesuccess,tensuccess)
    --接受任务
    elseif  taskType == 2 then
        if(s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL) < 53 ) then
            s_sysInfo(uid,"请先升到53级再来接取",ChatPos_Tips)
            return;
        end
        local taskid = s_getVar(uid,160,4)
        local taskinfo = GetTaskInfo(taskid)
        if taskinfo == nil then
            s_debugUser(uid,"接受佣兵任务错taskinfo=nil")
            return;
        end

        local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
        if taskProcess ~= nil and taskProcess ~= TaskProcess_None then
            s_sysInfo(uid,"当前佣兵任务还未完成，不能重复接取",ChatPos_Tips)
            return;
        end

        local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
        if curStarData == nil or taskid == 0 then
            s_debugUser(uid,"接受佣兵任务错误")
            return;
        end
        taskinfo.ring = curStarData.targetNum;
        taskinfo.round = 1;

        --是否是任务第一次玩,第一次玩不扣次数，不元宝
        local bfirst = 0;
        bfirst = isMainTaskEmploy(uid)
        if bfirst == 0 then
            --次数判断
            if s_getVar(uid,160,1) >= 10 then
                if s_getVar(uid,160,3) <= 0 then
                    s_sysInfo(uid,"悬赏次数不足",ChatPos_Tips)
                    return;
                end
            end
            --扣除次数
            if s_getVar(uid,160,1) < 10 then
                s_setVar(uid,160,1,s_getVar(uid,160,1) + 1)
            else
                if  s_getVar(uid,160,3) > 0 then
                    s_setVar(uid,160,3,s_getVar(uid,160,3) - 1)
                else
                    s_setVar(uid,160,3,0)
                end
            end

        end


        local subinfo = GetSubTaskInfo(taskid, 1)
        subinfo.task[2][4] = curStarData.targetNum
        AddRoleTaskForGM(uid,taskid, curStarData.targetNum,1, 0)
		--离线找回
		if s_getVar(uid,169,102) < 10 then
			s_setVar(uid,169,102,s_getVar(uid,169,102)+1)
		end
		if s_getVar(uid,169,102) <= 10 then
			s_setVar(uid,169,108,10 - s_getVar(uid,169,102))
		end
		if s_getVar(uid,169,102) == 10 then
			s_setVar(uid,169,108,0)
		end
		--s_debugUser(uid," employ offlineback >>>>>>>>>>>>>>>> %u",s_getVar(uid,169,108))

    --购买次数
    elseif taskType == 3 then
        local vipnum = s_getVar(uid,149,19)
        if vipnum == 0 then
            s_sysInfo(uid,"拥有尊贵特权才可购买额外次数,可前往[返利-尊贵特权]查看",ChatPos_Tips)
            return;
        end
        s_debug(uid..",佣兵每日可购买次数="..vipnum)
        if s_getVar(uid,160,7) >=  vipnum then
            s_sysInfo(uid,"本日购买次数已达上限",ChatPos_Tips)
            return;
        end
		if s_removeMoney(uid,MoneyType_Gold,5,"购买佣兵任务次数") ~= VALUE_OK then
            s_sysInfo(uid,"元宝不足，不能购买",ChatPos_Tips)
            return;
        end
        s_setVar(uid,160,3,s_getVar(uid,160,3) + 1)
        s_setVar(uid,160,7,s_getVar(uid,160,7) + 1)

        cannum    = 10 - s_getVar(uid,160,1) + s_getVar(uid,160,3);
	local tagnum = s_getVar(uid,140,100)
        s_sendEmployTaskInfo(uid,taskid,targetnum,expnum,starid,cannum,liliannum,tagnum)
    --完成任务
    elseif taskType == 4 then
	local onesuccess = 0
	local tensuccess = 0
        s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>>交任务清楚")
	taskid = s_getVar(uid,160,4)
        local process = s_getTaskValue(uid,taskid,TaskValue_Process)

        local taskinfo = GetTaskInfo(taskid)
        if taskinfo == nil then
            s_debugUser(uid,"接受佣兵任务错taskinfo=nil")
            return;
        end
        if process ~= TaskProcess_CanDone then
            s_sysInfo(uid,"请完成任务后再来领奖",ChatPos_Tips)
            return;
        end
        FinishRoleTask(uid,taskid);
        --s_getVar(uid,160,0)     --清除已接的任务
        --免费刷一次
        cannum    = 10 - s_getVar(uid,160,1) + s_getVar(uid,160,3);
        taskid,starid,expnum,liliannum,targetnum = EmployRefreh(uid)
        if taskid == 0 or starid == 0 or expnum == 0 or liliannum == 0 then
            s_debugUser(uid,"佣兵任务随机任务星级错误:"..taskid.."-"..starid.."-"..expnum.."-"..liliannum.."-"..cannum)
            return;
        end
        s_setVar(uid,160,4,taskid)
        s_setVar(uid,160,5,starid)
	local randnum = math.random(1,100)
	s_debugUser(uid,">>>>>>>>>>>>完成任务概率 ="..randnum)
	s_debugUser(uid,">>>>>>>>>>>>完成任务免单状态 ="..s_getVar(uid,140,100))
	if s_getVar(uid,160,15) == 0 then
                s_setVar(uid,140,100,1)
                s_setVar(uid,160,15,1)
        else	
		if randnum <= 28 then
			s_setVar(uid,140,100,1)
		end
	end
	s_debugUser(uid,">>>>>>>>>怪物死亡了，看发不发 111 s_getVar(uid,160,1) ="..s_getVar(uid,160,1))
	if s_getVar(uid,160,12) == 0 then
	if s_getVar(uid,160,1) == 10 then
		local chapterName = EmployExtraAwardDataBase.query(1)
		--s_debugUser(uid,">>>>>>>>>怪物死亡了，看发不发 chapterName ="..chapterName)
                GetRewardWithMail(uid,chapterName.awarditem,"功勋除魔奖励",1,false,AddItemAction_Task)
		s_setVar(uid,160,12,1)
		tensuccess = 1
	end
	end
	local tagnum = s_getVar(uid,140,100)
	--测试下
	--s_setVar(uid,160,4,0)     --清除已接的任务
	s_debugUser(uid,">>>>>>>>>>>>>>交任务清楚task taskid ="..s_getVar(uid,160,4))
        s_sendEmployTaskInfo(uid,taskid,targetnum,expnum,starid,cannum,liliannum,tagnum)
	onesuccess = 1
	s_sendemploysuccess(uid,onesuccess,tensuccess)
		
    end


end

--刷新佣兵随机任务
function EmployRefreh(uid)
    local taskid ,starid ,expnum ,liliannum ,cannum ,targetnum = 0,0,0,0,0,0;
	--测试任务
	cannum    = 10 - s_getVar(uid,160,1) + s_getVar(uid,160,3);
    --随机抽取任务
    --local randNum = math.random(1,10000)
    local randNum = cannum
	local rebirthnum = s_getRebirthLevel(uid)
    local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
    if rebirthnum ~= 0 then
        --6转以上
        if rebirthnum >= 6 then
            -- if randNum <= 2500 then
                -- taskid = 31043
            -- elseif randNum <= 5000 then
                -- taskid = 31044
			-- elseif randNum <= 7500 then
				-- taskid = 31045
			-- else
				-- taskid = 31046
			taskid=31043 + randNum%4
            --end
		--4转以上
        elseif rebirthnum >= 4 then
            -- if randNum <= 2500 then
                -- taskid = 31039
            -- elseif randNum <= 5000 then
                -- taskid = 31040
            -- elseif randNum <= 7500 then
                -- taskid = 31041
			-- else
				-- taskid = 31042
				taskid=31039 + randNum%4
            --end
		--二转以上
        elseif rebirthnum >= 2 then
            -- if randNum <= 1666 then
                -- taskid = 31033
            -- elseif randNum <= 3332 then
                -- taskid = 31034
            -- elseif randNum <= 4998 then
                -- taskid = 31035
            -- elseif randNum <= 6664 then
                -- taskid = 31036
            -- elseif randNum <= 8330 then
                -- taskid = 31037
			-- else
				-- taskid = 31038
				taskid=31033 + randNum%6
            --end
		else
            -- if randNum <= 714 then
                -- taskid = 31019
            -- elseif randNum <= 1428 then
                -- taskid = 31020
            -- elseif randNum <= 2142 then
                -- taskid = 31021
            -- elseif randNum <= 2856 then
                -- taskid = 31022
            -- elseif randNum <= 3570 then
                -- taskid = 31023
            -- elseif randNum <= 4284 then
                -- taskid = 31024
            -- elseif randNum <= 4998 then
                -- taskid = 31025
            -- elseif randNum <= 5712 then
                -- taskid = 31026
            -- elseif randNum <= 6426 then
                -- taskid = 31027
            -- elseif randNum <= 7140 then
                -- taskid = 31028
            -- elseif randNum <= 7854 then
                -- taskid = 31029
            -- elseif randNum <= 8568 then
                -- taskid = 31030
            -- elseif randNum <= 9282 then
                -- taskid = 31031
            -- else
                -- taskid = 31032
				taskid=31019 + randNum%14
            --end
        end
    elseif level >= 80 then
        -- if randNum <= 714 then
            -- taskid = 31019
        -- elseif randNum <= 1428 then
            -- taskid = 31020
        -- elseif randNum <= 2142 then
            -- taskid = 31021
        -- elseif randNum <= 2856 then
            -- taskid = 31022
        -- elseif randNum <= 3570 then
            -- taskid = 31023
        -- elseif randNum <= 4284 then
            -- taskid = 31024
		-- elseif randNum <= 4998 then
			-- taskid = 31025
        -- elseif randNum <= 5712 then
            -- taskid = 31026
        -- elseif randNum <= 6426 then
            -- taskid = 31027
        -- elseif randNum <= 7140 then
            -- taskid = 31028
        -- elseif randNum <= 7854 then
            -- taskid = 31029
        -- elseif randNum <= 8568 then
            -- taskid = 31030
		-- elseif randNum <= 9282 then
			-- taskid = 31031
		-- else
			-- taskid = 31032
			taskid=31019 + randNum%14
        --end
    elseif level >= 70 then
        -- if randNum <= 1428 then
            -- taskid = 31012
        -- elseif randNum <= 2856 then
            -- taskid = 31013
        -- elseif randNum <= 4284 then
            -- taskid = 31014
        -- elseif randNum <= 5712 then
            -- taskid = 31015
        -- elseif randNum <= 7140 then
            -- taskid = 31016
        -- elseif randNum <= 8568 then
            -- taskid = 31017
        -- else
            -- taskid = 31018
			taskid=31012 + randNum%7
        --end
    elseif level > 46 then
        -- if randNum <= 1428 then
            -- taskid = 31005
        -- elseif randNum <= 2586 then
            -- taskid = 31006
        -- elseif randNum <= 4284 then
            -- taskid = 31007
        -- elseif randNum <= 5712 then
            -- taskid = 31008
        -- elseif randNum <= 7140 then
            -- taskid = 31009
        -- elseif randNum <= 8568 then
            -- taskid = 31010
        -- else
            -- taskid = 31011
			taskid=31005 + randNum%7
        --end
    else
        -- if randNum <= 2500 then
            -- taskid = 31001
        -- elseif randNum <= 5000 then
            -- taskid = 31002
        -- elseif randNum <= 7500 then
            -- taskid = 31003
        -- else
            -- taskid = 31004
			taskid=31001 + randNum%4
        --end
    end

    if taskid == 0 then
        s_debugUser(uid,"随机任务错误，居然一个任务都没拿到")
        return taskid,starid,expnum,liliannum,cannum
    end
    --星级抽取
    randNum = math.random(1,500)
    if randNum <= 500 then
        starid = 1;
    elseif randNum <= 1000 then
        starid = 2;
    elseif randNum <= 2000 then
        starid = 3;
    elseif randNum <= 3000 then
        starid = 4;
    elseif randNum <= 4000 then
        starid = 5;
    elseif randNum <= 5000 then
        starid = 6;
    elseif randNum <= 6000 then
        starid = 7;
    elseif randNum <= 7000 then
        starid = 8;
    elseif randNum <= 8000 then
        starid = 9;
    elseif randNum <= 10000 then
        starid = 10;
    end

    ----第一次必定10星
    --if s_getVar(uid,160,9) == 0 then
        --starid = 10;
        --s_setVar(uid,160,9,1)
    --end
    local bfirst = isMainTaskEmploy(uid)

    --有主线任务10星
--    if bfirst == 1 then
--        starid = 5;
        --s_setVar(uid,160,9,1)
--    end

    local curStarData = EmployDataBase.query(starid)
    if curStarData == nil then
        return taskid,starid,expnum,liliannum
    end

    s_setVar(uid,160,5,starid)
	local taskInfo = GetTaskInfo(taskid)
    if taskInfo == nil then
        return taskid,starid,expnum,liliannum
    end

    expnum    = GetTaskExp(uid,taskid)
    --expnum    = math.floor(expnum * curStarData.doubleNum * 0.01);
    targetnum = curStarData.targetNum;
    --如果有佣兵悬赏令必得10星
--	if s_deleteItemByBaseID(uid,10085,1,"刷新佣兵任务扣除") == VALUE_OK then
--        starid = 10;
--        s_sysInfo(uid,"本次刷新使用佣兵悬赏令,必刷10星任务",ChatPos_Tips)
--    end
    liliannum = GetTaskLilian(uid,taskid)
    --liliannum = math.floor(liliannum * curStarData.doubleNum * 0.01)

    return taskid,starid,expnum,liliannum,targetnum
end

--是否是主线任务
function isMainTaskEmploy(uid)
    --是否是任务第一次玩,第一次玩不扣次数，不元宝
    local bfirst = 0;
    local taskProcess = s_getTaskValue(uid, 5040, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        bfirst = 1;
    end

    -- 主线任务不扣次数
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- bfirst = 1;
    -- end

    -- 主线任务不扣次数
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- bfirst = 1;
    -- end

    -- 主线任务不扣次数
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- bfirst = 1;
    -- end

    -- 主线任务不扣次数
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- bfirst = 1;
    -- end

    -- 主线任务不扣次数
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- bfirst = 1;
    -- end

    -- 主线任务不扣次数
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- bfirst = 1;
    -- end

    -- 主线任务不扣次数
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- bfirst = 1;
    -- end

    -- 主线任务不扣次数
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- bfirst = 1;
    -- end

    -- 主线任务不扣次数
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- bfirst = 1;
    -- end

    return bfirst;
end
