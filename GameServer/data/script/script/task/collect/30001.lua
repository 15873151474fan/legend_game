-- --每采集一次都随机给奖励
-- function collectTaskRandomReward(uid,taskid,subtaskid)
    -- local rand = math.random(1,10000)
    -- if rand <= 10000 then
        -- s_addMoneyMe(uid,MoneyType_MoneyTicket,20000,"摇钱树获得")
    -- end

    -- if rand <= 1 then
        -- s_addItem(uid,10210,0,1,0,"1-1","摇钱树获得奖励")
    -- end

    -- if rand <= 1 then
        -- s_addItem(uid,10223,0,1,0,"1-1","摇钱树获得奖励")
    -- end

    -- if rand <= 50 then
        -- s_addItem(uid,10191,0,1,0,"1-1","摇钱树获得奖励")
    -- end

    -- if rand <= 1 then
        -- s_addItem(uid,17006,0,1,0,"1-1","摇钱树获得奖励")
    -- end
-- end
-- --每采集一次都随机给奖励
-- function qunxiongduobaoRandomReward(uid,taskid,subtaskid)
    -- local rand = math.random(1,1000)
    -- if rand <= 1 then
        -- s_addItem(uid,10210,0,1,0,"1-1","摇钱树获得奖励")
    -- end

    -- if rand <= 1 then
        -- s_addItem(uid,10223,0,1,0,"1-1","摇钱树获得奖励")
    -- end

    -- if rand <= 150 then
        -- s_addItem(uid,19103,0,10,0,"1-1","摇钱树获得奖励")
    -- end

    -- if rand <= 1 then
        -- s_addItem(uid,17006,0,1,0,"1-1","摇钱树获得奖励")
    -- end
-- end
-- --摇钱树采集
-- RoleTaskInfo30001 =
-- {
	-- subtasknum = 1,
	-- subtask1 =
	-- {

		-- onsuccess =
		-- {
            -- {collectTaskRandomReward,{0,0,0}},
		-- },
		-- clicknpc = {301, 10, 0, 3500, 100, 100},
        -- --collectitem =
        -- --{
            -- --{12001, 0, 5},
        -- --},
		-- task = {s_taskClickNpc, {115, 115}},
		-- onfinish =
		-- {
			-- --{s_actionDeleteItemByBaseID,{12001,5,"RoleTaskInfo30001_1"}},
		-- },
        -- onaccept = {
			-- {s_actionIntoCopyCustomSingle,{1002,195,20,20}},
        -- },
	-- },

-- }

-- function RoleTaskInfo30001:GetSubTaskAcceptText(uid,taskid,subtaskid)
	-- --确定收集内容
	-- return self.accepttext
-- end

-- --返回客户接受任务界面上所需要的一些信息
-- function RoleTaskInfo30001:GetSubTaskCustomeText(uid,taskid)
    -- local msg = ",dlgType=15"..","..string.format("finishNum=%d",GetTaskDayDoneNum(uid,taskid))..","..string.format("totalNum=%d",s_getTaskValue(0,taskid,TaskValue_DayNum))..","
    -- print("30001msg=",msg,GetTaskDayDoneNum(uid,taskid))
	-- return msg
-- end

-- --完成检查
-- function RoleTaskInfo30001:OnFinishCheck(uid, taskid, subtaskid)
	-- --超出任务时间以后才显示
	-- local process = s_getTaskValue(uid,taskid,TaskValue_Process)
    -- --如果等于正在做，则传送进去
    -- if process == TaskProcess_Doing then 
        -- local msg = "dlgType=15"..","..string.format("finishNum=%d",GetTaskDayDoneNum(uid,taskid))..","..string.format("totalNum=%d",s_getTaskValue(0,taskid,TaskValue_DayNum))..","
        -- local call = "RoleTaskInfo30001:Continue($1)"
        -- ShowNpcMenuBottomStyle(uid,msg,"未完成继续(1)",call,"取消(1)")
        -- return VALUE_FAIL
    -- end
	-- return VALUE_OK
-- end

-- --继续传送副本
-- function RoleTaskInfo30001:Continue(uid,taskid,subtaskid)
    -- s_intoCopyCustomSingle(uid,1002,195,20,20)
-- end


-- ---任务完成时的操作
-- function RoleTaskInfo30001:OnFinishTask(uid)
    -- s_addDailyTargetTime(uid, enumDailySubTargetType_MoneyTree, 1)
-- end

-- --每日完成次数
-- function RoleTaskInfo30001:GetTaskDailyInfo(uid, outvec)
	-- if outvec == nil then return end
	-- --taskid
	-- table.insert(outvec, 30001)
	-- --dayNum
	-- table.insert(outvec, s_getTaskValue(0,30001,TaskValue_DayNum))
	-- --dayDoneNum
	-- table.insert(outvec,  GetTaskDayDoneNum(uid,30001))
	-- --weekNum
	-- table.insert(outvec, 0)
	-- --weekDoneNum
	-- table.insert(outvec, 0)
-- end
