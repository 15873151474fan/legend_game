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
-- RoleTaskInfo30003 =
-- {
	-- subtasknum = 1,
	-- subtask1 =
	-- {

		-- onsuccess =
		-- {
            -- {collectTaskRandomReward,{0,0,0}},
		-- },
		-- clicknpc = {272, 10, 0, 6000, 100, 100},
        -- --collectitem =
        -- --{
            -- --{12001, 0, 5},
        -- --},
		-- task = {s_taskClickNpc, {0, 0}},
		-- onfinish =
		-- {
			-- --{s_actionDeleteItemByBaseID,{12001,5,"RoleTaskInfo30001_1"}},
		-- },
        -- onaccept = {
			-- {s_actionIntoCopyCustomSingle,{1002,195,20,20}},
        -- },
	-- },

-- }

-- function RoleTaskInfo30003:GetSubTaskAcceptText(uid,taskid,subtaskid)
	-- --确定收集内容
	-- return self.accepttext
-- end




