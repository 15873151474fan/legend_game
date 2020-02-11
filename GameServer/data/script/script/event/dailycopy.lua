-- 日常副本章节
DailyCopyChapterName =
{
	[1] = "equip",	-- 装备副本
	[2] = "exp",	-- 经验副本
	[3] = "coin",	-- 金币副本
}

DailyCopyNewbieTask =
{
	equip = {1099,1131,1132,1133,1152},	-- 装备副本新手任务
	exp   = {1058,1118,1128,1147,1137},		-- 经验副本新手任务
	coin  = {1133},						-- 金币副本新手任务
}

-- 日常副本配置
-- 副本配置参数说明
--   level			副本进入等级限制
--   mapID			地图编号
--   enterCountVar	p1、p2为玩家副本次数变量，p3为重置默认值
--   buyCountVar	p1、p2为副本次数购买变量，p3为重置默认值，p3为购买消耗元宝值
--   enterPos		进入副本坐标
--   script			自定义副本脚本
--   buff			p1为buffid，p2为购买buff消耗金币值，p3为buff持续秒数
--   monBatch		p1为总共几波怪，p2为每波最大数量
--   maxMonCount	小于等于这个数时可以再次刷新怪物
--   enterItem		p1物品id,p2物品数量,p2副本名
DailyCopyConfig =
{
	---- 玩家变量
	firstInitCopyVar = {140, 13},		-- 是否刷新过副本次数、购买次数
	--lastCopySceneIdVar = {140,14},		-- 上次进入的日常副本场景id，不能修改key否则要修改C++文件

	---- 副本变量
	copyMonsterRefreshVar = {1, 1},		-- 刷新副本怪物
	copyMonsterCountVar = {1, 2},		-- 副本中怪物数暂存变量
	copyBuffIdVar = {1, 3},				-- 副本中购买的buff
	copyRobotCountVar = {1, 4},			-- 副本中机器人数量
	copyMonstBatchVar = {1, 5},			-- 副本中第几波怪
	copyIndexVar = {1, 6},				-- 副本的节号（某章的第几节）
	copyNewbieVar = {1, 7},				-- 副本是否是新手
	copyUseridVar = {1, 8},				-- 副本玩家id

	-- 金币副本
	coin =
	{
		[1] = {level = 50 , mapID = 180, enterCountVar = {140,20,5}, buyCountVar = {140,21,5,2}, enterPos = {17,15}, script = 1201, maxMonCount = 60},
		[2] = {level = 80, mapID = 181, enterCountVar = {140,22,2}, buyCountVar = {140,23,2,10}, enterPos = {11,9}, script = 1202, maxMonCount = 3},
	},

	-- 装备副本
	equip =
	{
		[1] = {level = 60, mapID = 142, buff = {3001,20000,3600}, buyCountVar = {140,107,1,5}, enterCountVar = {140,25,1}, enterPos = {22,15}, script = 1203},
		[2] = {level = 70, mapID = 143, buff = {3001,50000,3600}, buyCountVar = {140,108,1,10}, enterCountVar = {140,26,1}, enterPos = {22,15}, script = 1203},
		[3] = {level = 80, mapID = 144, buff = {3001,100000,3600}, buyCountVar = {140,109,1,20}, enterCountVar = {140,27,1}, enterPos = {22,15}, script = 1203},
		[4] = {level = 1001, mapID = 145, buff = {3001,200000,3600}, buyCountVar = {140,110,1,40}, enterCountVar = {140,28,1}, enterPos = {22,15}, script = 1203},
		[5] = {level = 1002, mapID = 146, buff = {3001,400000,3600}, buyCountVar = {140,111,1,80}, enterCountVar = {140,29,1}, enterPos = {22,15}, script = 1203},
		[6] = {level = 1004, mapID = 147, buff = {3001,700000,3600}, buyCountVar = {140,121,1,150},enterCountVar = {140,30,1}, enterPos = {22,15}, script = 1203},
	},

	-- 经验副本
	exp =
	{
		[1] = {level = 55, mapID = 129, enterCountVar = {140,44,5}, buyCountVar = {140,54,5,20}, enterPos = {13,9}, script = 1204, maxMonCount = 60},
		[2] = {level = 70, mapID = 130, enterCountVar = {140,45,5}, buyCountVar = {140,55,5,30}, enterPos = {13,9}, script = 1204, maxMonCount = 60},
		[3] = {level = 80, mapID = 131, enterCountVar = {140,46,5}, buyCountVar = {140,56,5,40}, enterPos = {13,9}, script = 1204, maxMonCount = 60},
		[4] = {level = 1002, mapID = 132, enterCountVar = {140,47,5}, buyCountVar = {140,57,5,50}, enterPos = {13,9}, script = 1204, maxMonCount = 60},
		[5] = {level = 1004, mapID = 133, enterCountVar = {140,48,5}, buyCountVar = {140,58,5,60}, enterPos = {13,9}, script = 1204, maxMonCount = 60},
	},

	-- 坐标修正
	fixposes =
	{
		[1] = {-1,1},
		[2] = {0,1},
		[3] = {1,1},
		[4] = {1,0},
		[5] = {1,-1},
		[6] = {0,-1},
		[7] = {-1,-1},
		[8] = {-1,0},
	},

	-- 经验副本佣兵
	robotids =
	{
		{4600,4601,4602,4603,4604,},    -- vip0
		{4605,4606,4607,4608,4609,},    -- vip1
		{4610,4611,4612,4613,4614,},    -- vip2
		{4615,4616,4617,4618,4619,},    -- vip3
		{4620,4621,4622,4623,4624,},    -- vip4
		{4625,4626,4627,4628,4629,},    -- vip5
		{4630,4631,4632,4633,4634,},    -- vip6
		{4635,4636,4637,4638,4639,},    -- vip7
		{4640,4641,4642,4643,4644,},    -- vip8
		{4645,4646,4647,4648,4649,},    -- vip9
		{4650,4651,4652,4653,4654,},    -- vip10
		{4655,4656,4657,4658,4659,},    -- vip11
		{4660,4661,4662,4663,4664,},    -- vip12
	},

	-- 装备副本佣兵
	equiprobotids =
	{
		{4665,4666,4667,4668,4669,},    -- vip0
		{4670,4671,4672,4673,4674,},    -- vip1
		{4675,4676,4677,4678,4679,},    -- vip2
		{4680,4681,4682,4683,4684,},    -- vip3
		{4685,4686,4687,4688,4689,},    -- vip4
		{4690,4691,4692,4693,4694,},    -- vip5
		{4695,4696,4697,4698,4699,},    -- vip6
		{4700,4701,4702,4703,4704,},    -- vip7
		{4705,4706,4707,4708,4709,},    -- vip8
		{4710,4711,4712,4713,4714,},    -- vip9
		{4715,4716,4717,4718,4719,},    -- vip10
		{4720,4721,4722,4723,4724,},    -- vip11
		{4725,4726,4727,4728,4729,},    -- vip12
	},
}

-- 副本是否在新手引导
function IsNewbieDailyCopy(userid, chaptername)
	local tasks = DailyCopyNewbieTask[chaptername]
	if tasks == nil then
		return false,0
	end
	for _, taskid in ipairs(tasks) do
		if s_getTaskValue(userid, taskid, TaskValue_Process) == TaskProcess_Doing then
			return true,taskid
		end
	end
	return false,0
end

-- 获得日常副本完成信息
function GetDailyFinishInfo(userid, outvec)
	if outvec == nil then return end
	local total = 0
	local surplus = 0
	local userlevel = s_getUserLevel(userid)
	--[[for _, chapterName in ipairs(DailyCopyChapterName) do
		local copys = DailyCopyConfig[chapterName]
		DailyCopyCheckUserVar(userid)
		for _, copy in ipairs(copys) do
			if UserLevelCompare(userid, userlevel, copy.level) then
				surplus = surplus + s_getVar(userid, copy.enterCountVar[1], copy.enterCountVar[2])
				total = total + copy.enterCountVar[3]
			end
		end
	end
	local finish = total - surplus]]--
	total = 2
	local finish = s_getVar(userid,473,1)	
    	for i=1,3 do
        	finish = finish + s_getField(userid, 50 + i)
    	end
	--finish = finish + s_getField(userid, 75)
	--total = total + 1
    	--组队副本次数
    	total = total + 3
	s_debug("GetDailyFinishInfo:userid,finish,total: " .. userid .. ", " .. finish .. ", " .. total)

	--taskid
	table.insert(outvec, 30003)
	--dayNum
	table.insert(outvec, total)
	--dayDoneNum
	table.insert(outvec, finish)
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end

-- 记录玩家上一个日常副本信息
function SaveDailyCopyHistory(userid, chapterid, checkpointid, sceneid, mapid)
	local index = chapterid * 1000 + checkpointid

	DailyCopyHistory = DailyCopyHistory or {}
	if DailyCopyHistory[userid] == nil then
		DailyCopyHistory[userid] = {}
	end

	local historys = DailyCopyHistory[userid]
	if historys[index] == nil then
		historys[index] = {}
	end

	local history = historys[index]
	history.sceneid = sceneid
	history.mapid = mapid
end

-- 获得还未销毁的上一个同副本
function GetLastDailyCopySceneid(userid, chapterid, checkpointid)
	if DailyCopyHistory == nil then
		return nil
	end
	local historys = DailyCopyHistory[userid]
	if historys == nil then
		return nil
	end
	local index = chapterid * 1000 + checkpointid
	local history = historys[index]
	if history == nil or history.sceneid == nil then
		return nil
	end
	local mapid = s_getCopyMapid(history.sceneid,userid)
	if mapid ~= history.mapid then
		return nil
	end
	return history.sceneid, history.mapid
end

-- 获得日常副本可进入状态
function GetDailyCopyEnterableState(userid, chapterid)
	local userlevel = s_getUserLevel(userid)
	local chapterName = DailyCopyChapterName[chapterid]
	if chapterName == nil then
		return 0
	end
	local copys = DailyCopyConfig[chapterName]
	DailyCopyCheckUserVar(userid)
	for _, copy in ipairs(copys) do
		if UserLevelCompare(userid, userlevel, copy.level) and s_getVar(userid, copy.enterCountVar[1], copy.enterCountVar[2]) ~= 0 then
			return 1
		end
	end
	return 0
end

function UserLevelCompare(userid, userlevel, level)
	local needlevel = level
	if needlevel > 1000 then
		needlevel = needlevel - 1000
		local userrebirth = s_getRebirthLevel(userid)
		return userrebirth >= needlevel
	end
	return userlevel >= needlevel
end

-- 请求一章副本的数据
function RequestDailyCopyData(userid, chapterid)
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>客户端请求装备副本发来 chapterid = "..chapterid)
	local userlevel = s_getUserLevel(userid)
	local chapterName = DailyCopyChapterName[chapterid]
	if chapterName == nil then
		return
	end

	local row = 0
	local list = {}
	local copys = DailyCopyConfig[chapterName]
	DailyCopyCheckUserVar(userid)

	for i, copy in ipairs(copys) do
		table.insert(list, i)
		table.insert(list, copy.mapID)
		if UserLevelCompare(userid, userlevel, copy.level) then
			local buyCount = 0
			local buyCount1 = 0
			local enterCount = s_getVar(userid, copy.enterCountVar[1], copy.enterCountVar[2])
			if copy.buyCountVar ~= nil then
				buyCount = s_getVar(userid, copy.buyCountVar[1], copy.buyCountVar[2])
				--s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>可购买次数 i="..i)
				--s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>已经买过的次数 buyCount1 = "..buyCount1)
				--s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>可购买总次数 = "..copy.buyCountVar[3])
				--buyCount = copy.buyCountVar[3] - buyCount1
				s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>剩余可购买次数 buyCount = "..buyCount..","..i)
			end
			table.insert(list, enterCount)
			table.insert(list, buyCount)
		else
			table.insert(list, 0)
			table.insert(list, 0)
		end

		local buyCountMoney = 0
		local equipConfig1 = EquipCopyNpcDataBase.query(i)
		--[[if copy.buyCountVar ~= nil then
			buyCountMoney = copy.buyCountVar[4]
		end]]--
		if equipConfig1.gold ~= nil then
			buyCountMoney = equipConfig1.gold
		end
		table.insert(list, buyCountMoney)

		local buyBufMoney = 0
		--[[if copy.buff ~= nil then
			buyBufMoney = copy.buff[2]
		end]]--
		if equipConfig1.buffcost ~= nil then
			buyBufMoney = equipConfig1.buffcost
		end
		table.insert(list, buyBufMoney)
		row = row + 1
	end
	s_sendDailyCopyList(userid, chapterid, row, list)
end

function GetDailyCopyConfigByMapid(mapid)
	for chapterid, name in ipairs(DailyCopyChapterName) do
		local config = DailyCopyConfig[name]
		if config ~= nil then
			for i, copy in ipairs(config) do
				if mapid == copy.mapID then
					return chapterid,i,copy
				end
			end
		end
	end
end

function GetDailyCopyConfigByChapter(chapterid, index)
	local name = DailyCopyChapterName[chapterid]
	if name ~= nil then
		local config = DailyCopyConfig[name]
		if config ~= nil then
			return config[index]
		end
	end
end

function DailyCopyResetUserVar(userid)
	for i, name in ipairs(DailyCopyChapterName) do
		local config = DailyCopyConfig[name]
		if config ~= nil then
			for i, copy in ipairs(config) do
				-- 副本剩余次数
				local var = copy.enterCountVar
				if var ~= nil then
					s_setVar(userid, var[1], var[2], var[3])
				end
				-- 副本购买次数
				var = copy.buyCountVar
				if var ~= nil then
					s_setVar(userid, var[1], var[2], var[3])
				end
			end
		end
	end
end

-- 日常副本首次设置玩家数据
function DailyCopyCheckUserVar(userid)
	local initVar = DailyCopyConfig.firstInitCopyVar
	if s_getVar(userid, initVar[1], initVar[2]) ~= 0 then
		return
	end
	s_setVar(userid, initVar[1], initVar[2], 1)
	DailyCopyResetUserVar(userid)
end

-- 请求进入日常副本
function RequestIntoDailyCopy(userid, chapterid, index)
	if s_getbufflevel(SCENE_ENTRY_PLAYER,userid,2007) ~= 0 then
		s_sysInfo(userid,"正在押镖中，不允许进行传送", ChatPos_Tips)
		return;
	end

	local chapterName = DailyCopyChapterName[chapterid]
	if chapterName == nil then
		s_sysInfo(userid, "副本不存在", ChatPos_Tips)
		return
	end

	local config = DailyCopyConfig[chapterName][index]
	if config == nil then
		s_sysInfo(userid, "副本不存在", ChatPos_Tips)
		return
	end

	local userlevel = s_getUserLevel(userid)
	if not UserLevelCompare(userid, userlevel, config.level) then
		s_sysInfo(userid, "等级或飞升等级不足！", ChatPos_Tips)
		return
	end
	if chapterid == 1 then	
		s_setVar(userid,140,101,index)
	end
	-- 上次创建的副本还在
	local lastcopysceneid, lastcopymapid = GetLastDailyCopySceneid(userid, chapterid, index)
	if lastcopymapid == config.mapID and lastcopysceneid ~= 0 then
		s_gocopymap(SCENE_ENTRY_PLAYER, userid, lastcopysceneid, config.enterPos[1], config.enterPos[2])
		return
	end

	DailyCopyCheckUserVar()

	local isnewbie = IsNewbieDailyCopy(userid, chapterName)

	-- 需要卷轴才能进入
	local item = config.enterItem
	if item ~= nil and not isnewbie then
		if s_checkItem(userid,item[1],item[2],0) ~= VALUE_OK then
			s_sysInfo(userid, "需要副本卷轴才能进入", ChatPos_Tips)
			s_sendNeedItem(userid,item[1],item[2])
			return
		end
	end
--[[	
	-- 剩余进入次数
	local enterCount = s_getVar(userid, config.enterCountVar[1], config.enterCountVar[2])
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>用元宝刷新次数 enterCount = "..enterCount)
	if enterCount == 0 and not isnewbie then
		if config.buyCountVar ~= nil then
			local buycount = s_getVar(userid, config.buyCountVar[1], config.buyCountVar[2])
			if buycount == 0 then
				s_sysInfo(userid, "今日次数已用完，请明日再来挑战", ChatPos_Tips)
				return
			end
		else
			s_sysInfo(userid, "今日次数已用完，请明日再来挑战", ChatPos_Tips)
			return
		end
	end
]]--	
	-- 创建并进入副本
	local newsceneid = s_intoCopyCustomSingle(userid, config.script, config.mapID, config.enterPos[1], config.enterPos[2], 0)
    if newsceneid ~= nil and newsceneid ~= 0 then
    	-- 记录副本历史信息
    	SaveDailyCopyHistory(userid, chapterid, index, newsceneid, config.mapID)
    end
end

function reqBuyEquipNum(userid,copyid,sceneid)
	-- 怪物数量判断
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	if monstercount > 0 then
			s_sysInfo(userid, "刷新失败，请先消灭当前怪物!", ChatPos_Tips)
			return 0
	end
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>000发送装备副本时间 copyid = "..copyid)
	local copyname = EquipCopyNpcDataBase.query(copyid)
	--local sallnum = copyname.limit
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>限制次数 次数 = "..s_getVar(userid,140,106 + copyid))
	--s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>限制次数 sallnum = "..sallnum)
	if copyid < 6 then
		if s_getVar(userid,140,106 + copyid) == 0 then
			s_sysInfo(userid, "今天刷新已用完，请明天再来", ChatPos_Tips)
			return 0
		end
	else
		if s_getVar(userid,140,121) == 0 then
			s_sysInfo(userid, "今天刷新已用完，请明天再来", ChatPos_Tips)
			return 0
		end
	end
	if copyid == 0 then
		s_sysInfo(userid, "发送有误", ChatPos_Tips)
		return 0
	end
	--local copyname = EquipCopyNpcDataBase.query(copyid)
	local userlevel = s_getUserLevel(userid)
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>000发送装备副本时间 copyname.needlevel = "..copyname.needlevel)
	if not UserLevelCompare(userid, userlevel, copyname.needlevel) then
		s_sysInfo(userid, "等级不够", ChatPos_Tips)
		return 0
	end
	local num = 0
	num = copyname.gold
	if s_removeMoney(userid,MoneyType_Gold,num,"刷新装备副本怪物") ~= VALUE_OK then
			s_sysInfo(userid, "元宝不足", ChatPos_Tips)
			return 0
	end
	if copyid < 6 then
		s_setVar(userid,140,101 + copyid,0)
	else
		s_setVar(userid,140,120,0)
	end
	s_setVar(userid,140,24 + copyid, s_getVar(userid,140,24 + copyid) + 1)
	--local ssid = 1
	--s_setVar(userid,140,106 + copyid,s_getVar(userid,106 + copyid) + 1)
	if copyid < 6 then
		s_setVar(userid,140,106 + copyid, s_getVar(userid,140,106 + copyid) - 1)
	else
		s_setVar(userid,140,121, s_getVar(userid,140,121) - 1)
	end
	--[[local ssid = s_getVar(userid,140,24 + copyid) - 1
	if ssid > 0 then
	else
		ssid = 0
	end]]--
	RequestDailyCopyData(userid, 1)
	return 1
	--s_sendEquipcopyNum(userid,s_getVar(140,106 + copyid))		
end
function reqEquipCopyTime(userid)
	local userlevel = s_getUserLevel(userid)
	local list = {}
	local rownum = 0
	local chapterName = EquipCopyNpcDataBase
	for i, name in ipairs(chapterName) do
		if UserLevelCompare(userid, userlevel, name.needlevel) then
			local copyneedtime = name.time
			local scopytime = 0
			if i < 6 then
				scopytime = s_getVar(userid,140,101 + i)
			else
				scopytime = s_getVar(userid,140,120)
			end
			s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>000发送装备副本时间 scopytime = i = "..scopytime..","..i)
			s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>000发送装备副本时间 scopytime11111 = i = "..s_getCurTime(TIME_ALLSECONDS)..","..i)
			if s_getCurTime(TIME_ALLSECONDS) >= scopytime then
				--local scopyid = s_getVar(userid,140,101)
				--s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>000发送装备副本时间副本id scopyid = "..scopyid)
				--s_setVar(userid,140,24 + i, s_getVar(userid,24 + i) + 1)
			
				local stime = 0
				--s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>000发送装备副本时间 stime = "..stime)
				table.insert(list, 0)
			else
				local stime = scopytime - s_getCurTime(TIME_ALLSECONDS)
				if stime < 0 then
					stime = 0
				end
				table.insert(list, stime)
				s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>1111111111发送装备副本时间 stime=  i = "..stime..","..i)
			end
			rownum = rownum + 1
		end
	end
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>1111111111发送装备副本时间 rownum = "..rownum)
	s_sendEquipcopytime(userid,rownum,list)
end

function RequestRefreshDailyCopyMonster(userid, sceneid, mapid)
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>刷怪1 sceneid = "..sceneid)
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>刷怪2 mapid = "..mapid)
	local chapterid, index, copy = GetDailyCopyConfigByMapid(mapid)
	if copy == nil then
		s_sysInfo(userid, "刷新失败！", ChatPos_Tips)
		return
	end

	-- 当怪物分波出现时，必须完成最后一波后才可以刷怪
	local monBatch = copy.monBatch
	if monBatch ~= nil then
		local monsterbatchvar = DailyCopyConfig.copyMonstBatchVar
		local curbatch = s_getSceneVar(sceneid, monsterbatchvar[1], monsterbatchvar[2])
		s_debug("monBatch:" .. curbatch .. "," .. copy.monBatch[1])
		if curbatch ~= 0 and curbatch ~= copy.monBatch[1] then
			s_sysInfo(userid, "请先消灭当前怪物", ChatPos_Tips)
			return
		end
	end

	-- 怪物数量判断
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	if monstercount > 0 then
		if copy.maxMonCount == nil then
			--s_sysInfo(userid, "刷新失败，请先消灭当前怪物!", ChatPos_Tips)
			return
		end
		if monstercount > copy.maxMonCount then
			s_sysInfo(userid, "怪物数量小于" ..  copy.maxMonCount .. "，才可继续刷新",ChatPos_Tips)
			return
		end
	end

	local isnewbie, taskid = IsNewbieDailyCopy(userid, DailyCopyChapterName[chapterid])

	-- 进入次数
	local entercount = s_getVar(userid, copy.enterCountVar[1], copy.enterCountVar[2])
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>元宝刷新怪物 entercount = "..entercount)
	if entercount == 0 and not isnewbie then
		s_sysInfo(userid, "今日次数已用完，请明日再来挑战", ChatPos_Tips)
		return
	end

	--[[-- 进入道具扣除
	local item = copy.enterItem
	if item ~= nil and not isnewbie then
		if s_deleteItemByBaseID(userid,item[1],item[2],item[3]) ~= VALUE_OK then
			s_sysInfo(userid, "缺少副本卷轴!", ChatPos_Tips)
			s_sendNeedItem(userid,item[1],item[2])
			return
		end
		s_sysInfo(userid,  item[3] .. "扣除" .. item[2] .. "个[副本卷轴]", ChatPos_Tips)
	end]]--

	-- 装备副本战胜boss后才扣除刷怪次数
	--if  isnewbie then
		s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>刷怪后剩余次")
		entercount = entercount - 1
		s_setVar(userid, copy.enterCountVar[1], copy.enterCountVar[2], entercount)
	--end
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>刷怪后剩余次数 entercount = "..entercount)
	-- 刷新怪物
	local monstervar = DailyCopyConfig.copyMonsterRefreshVar
	s_setSceneVar(sceneid, monstervar[1], monstervar[2], index)
	if mapid == 142 then
		s_setVar(userid,140,112,2)
	elseif mapid == 143 then
		s_setVar(userid,140,113,2)
	elseif mapid == 144 then
		s_setVar(userid,140,114,2)
	elseif mapid == 145 then
		s_setVar(userid,140,115,2)
	elseif mapid == 146 then
		s_setVar(userid,140,116,2)
	elseif mapid == 147 then
		s_setVar(userid,140,117,2)
	end
	-- 完成任务
	if taskid ~= 0 then
		AddRoleTaskOperate(userid,taskid)
	end
	RefreshCopyDailyInfo(userid)

	-- 刷新怪物刷新次数
	local buycount = 0
	if copy.buyCountVar ~= nil then
		buycount = s_getVar(userid, copy.buyCountVar[1], copy.buyCountVar[2])
	end
	s_sendDailyCopyEnter(userid, chapterid, index, entercount, buycount)

	-- 每日目标次数
	if chapterid == 1 then
		s_addDailyTargetTime(userid, enumDailySubTargetType_CopySceneEquip, 1)
	elseif chapterid == 2 then
		s_addDailyTargetTime(userid, enumDailySubTargetType_CopySceneExp, 1)
		--离线找回
		FindOfflineBackExp(userid,mapid)
	elseif chapterid == 3 then
		s_addDailyTargetTime(userid, enumDailySubTargetType_CopySceneGold, 1)
	end	
end

--[[
-- 请求刷新副本怪物
function RequestRefreshDailyCopyMonster(userid, sceneid, mapid)
	local chapterid, index, copy = GetDailyCopyConfigByMapid(mapid)
	if copy == nil then
		s_sysInfo(userid, "刷新失败！", ChatPos_Tips)
		return
	end

	-- 当怪物分波出现时，必须完成最后一波后才可以刷怪
	local monBatch = copy.monBatch
	if monBatch ~= nil then
		local monsterbatchvar = DailyCopyConfig.copyMonstBatchVar
		local curbatch = s_getSceneVar(sceneid, monsterbatchvar[1], monsterbatchvar[2])
		s_debug("monBatch:" .. curbatch .. "," .. copy.monBatch[1])
		if curbatch ~= 0 and curbatch ~= copy.monBatch[1] then
			s_sysInfo(userid, "请先消灭当前怪物", ChatPos_Tips)
			return
		end
	end

	-- 怪物数量判断
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	if monstercount > 0 then
		if copy.maxMonCount == nil then
			s_sysInfo(userid, "刷新失败，请先消灭当前怪物!", ChatPos_Tips)
			return
		end
		if monstercount > copy.maxMonCount then
			s_sysInfo(userid, "怪物数量小于" ..  copy.maxMonCount .. "，才可继续刷新",ChatPos_Tips)
			return
		end
	end

	local isnewbie, taskid = IsNewbieDailyCopy(userid, DailyCopyChapterName[chapterid])

	-- 进入次数
	local entercount = s_getVar(userid, copy.enterCountVar[1], copy.enterCountVar[2])
	if entercount == 0 and not isnewbie then
		s_sysInfo(userid, "今日次数已用完，请明日再来挑战", ChatPos_Tips)
		return
	end

	-- 进入道具扣除
	local item = copy.enterItem
	if item ~= nil and not isnewbie then
		if s_deleteItemByBaseID(userid,item[1],item[2],item[3]) ~= VALUE_OK then
			s_sysInfo(userid, "缺少副本卷轴!", ChatPos_Tips)
			s_sendNeedItem(userid,item[1],item[2])
			return
		end
		s_sysInfo(userid,  item[3] .. "扣除" .. item[2] .. "个[副本卷轴]", ChatPos_Tips)
	end

	-- 装备副本战胜boss后才扣除刷怪次数
	if chapterid ~= 1 and not isnewbie then
		entercount = entercount - 1
		s_setVar(userid, copy.enterCountVar[1], copy.enterCountVar[2], entercount)
	end

	-- 刷新怪物
	local monstervar = DailyCopyConfig.copyMonsterRefreshVar
	s_setSceneVar(sceneid, monstervar[1], monstervar[2], index)

	-- 完成任务
	if taskid ~= 0 then
		AddRoleTaskOperate(userid,taskid)
	end
	RefreshCopyDailyInfo(userid)

	-- 刷新怪物刷新次数
	local buycount = 0
	if copy.buyCountVar ~= nil then
		buycount = s_getVar(userid, copy.buyCountVar[1], copy.buyCountVar[2])
	end
	s_sendDailyCopyEnter(userid, chapterid, index, entercount, buycount)

	-- 每日目标次数
	if chapterid == 1 then
		s_addDailyTargetTime(userid, enumDailySubTargetType_CopySceneEquip, 1)
	elseif chapterid == 2 then
		s_addDailyTargetTime(userid, enumDailySubTargetType_CopySceneExp, 1)
		--离线找回
		FindOfflineBackExp(userid,mapid)
	elseif chapterid == 3 then
		s_addDailyTargetTime(userid, enumDailySubTargetType_CopySceneGold, 1)
	end
end
]]--
-- 请求购买副本进入次数
function RequestBuyDailyCopyCount(userid, chapterid, index)
	local chapterName = DailyCopyChapterName[chapterid]
	if chapterName == nil then
		s_sysInfo(userid, "副本不存在", ChatPos_Tips)
		return
	end

	local copy = DailyCopyConfig[chapterName][index]
	if copy == nil then
		return
	end

	if copy.buyCountVar == nil then
		s_sysInfo(userid, "不能购买次数的副本！！", ChatPos_Tips)
		return
	end

	local buycount = s_getVar(userid, copy.buyCountVar[1], copy.buyCountVar[2])
	if buycount == 0 then
		s_sysInfo(userid, "今日购买次数已用完！", ChatPos_Tips)
		return
	end

	local gold = s_getMoney(userid, MoneyType_Gold)
	local needgold = copy.buyCountVar[4]
	if needgold > gold then
		s_sysInfo(userid, "元宝不足，需要" .. needgold .. "元宝！", ChatPos_Tips)
		return
	end

	local success = s_removeMoney(userid, MoneyType_Gold, needgold,"购买副本刷新次数扣除")
	if success == 0 or success == nil then
		s_sysInfo(userid, "购买失败！", ChatPos_Tips)
		return
	end
	-- 购买次数 - 1
	buycount = buycount - 1
	s_setVar(userid, copy.buyCountVar[1], copy.buyCountVar[2], buycount)
	-- 刷新次数 + 1
	local entercount = s_getVar(userid, copy.enterCountVar[1], copy.enterCountVar[2])
	entercount = entercount + 1
	s_setVar(userid, copy.enterCountVar[1], copy.enterCountVar[2], entercount)
	-- 返回结果
	s_sendDailyCopyEnter(userid, chapterid, index, entercount, buycount)
end

-- 请求购买副本神力
function RequestBuyDailyCopyBuff(userid, sceneid, mapid)
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>购买神力 mapid = "..mapid)
	local chapterid, index, copy = GetDailyCopyConfigByMapid(mapid)
	s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>购买神力 chapterid = "..chapterid)
	--s_debugUser(userid,">>>>>>>>>>>>>>>>>>>>>>>>购买神力 copy = "..copy.buff)
	if copy == nil then
		s_sysInfo(userid, "购买失败！", ChatPos_Tips)
		return
	end

	if copy.buff == nil then
		s_sysInfo(userid, "不能购买神力的副本！！", ChatPos_Tips)
		return
	end

	-- 判断是否已有神力，提示 购买失败，你已经有[神力]！
	local buffid = copy.buff[1]
	local bufflevel = s_getbufflevel(SCENE_ENTRY_PLAYER, userid, buffid)
	if bufflevel ~= 0 then
		s_sysInfo(userid, "购买失败，你已经有[神力]！", ChatPos_Tips)
		return
	end

	local gold = s_getMoney(userid, MoneyType_MoneyTicket)
	local needgold = copy.buff[2]
	if chapterid == 1 then
		local equipConfig = EquipCopyNpcDataBase.query(index)
		if equipConfig then
			needgold = equipConfig.buffcost
		end
	end

	if needgold > gold then
		s_sysInfo(userid, "购买失败，需要" .. needgold .. "银两！", ChatPos_Tips)
		return
	end

	local success = s_removeMoney(userid, MoneyType_MoneyTicket, needgold,"购买副本神力扣除")
	if success == 0 or success == nil then
		s_sysInfo(userid, "购买失败！", ChatPos_Tips)
		return
	end

	-- 添加神力
	local bufftime = copy.buff[3]
	s_addbuff(SCENE_ENTRY_PLAYER, userid, buffid, 1, bufftime)

	local buffVar = DailyCopyConfig.copyBuffIdVar
	s_setSceneVar(sceneid, buffVar[1], buffVar[2], buffid)
end

-- 副本胜利
function OnDailyCopySuccessed(userid, chapterid, index)
	-- 装备副本
	if chapterid == 1 then
		local copy = GetDailyCopyConfigByChapter(chapterid, index)
		if copy ~= nil then
			local entercount = s_getVar(userid, copy.enterCountVar[1], copy.enterCountVar[2])
			if entercount ~= 0 then
				--entercount = entercount - 1
				--s_setVar(userid, copy.enterCountVar[1], copy.enterCountVar[2], entercount)
				s_sendDailyCopyEnter(userid, chapterid, index, entercount, 0)
			end
			-- 刷新副本任务次数显示
			RefreshCopyDailyInfo(userid)
		end
	end
end
 
---离线找回 
function FindOfflineBackExp(userid,mapid)

	--local rebirthnum = s_getRebirthLevel(userid)
    --local level = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_LEVEL)
	s_trace(userid .. " FindOfflineBackExp mapid ".. mapid )
	if 1 then return end
	if mapid  <129 or mapid > 133 then
		return 0
	end
	local expcopynum = 5
	if 129 == mapid then 
		if s_getVar(userid,169,151) < expcopynum then
			s_setVar(userid,169,151,s_getVar(userid,169,151)+1)
		end
		if s_getVar(userid,169,151) <= expcopynum then
			s_setVar(userid,169,107,expcopynum - s_getVar(userid,169,151))
		end
		if s_getVar(userid,169,151) == expcopynum then
			s_setVar(userid,169,107,0)
		end
	elseif 130 == mapid then
		if s_getVar(userid,169,119) < expcopynum then
			s_setVar(userid,169,119,s_getVar(userid,169,119)+1)
		end
		if s_getVar(userid,169,119) <= expcopynum then
			s_setVar(userid,169,123,expcopynum - s_getVar(userid,169,119))
		end
		if s_getVar(userid,169,119) == expcopynum then
			s_setVar(userid,169,123,0)
		end
	elseif 131 == mapid then
		if s_getVar(userid,169,120) < expcopynum then
			s_setVar(userid,169,120,s_getVar(userid,169,120)+1)
		end
		if s_getVar(userid,169,120) <= expcopynum then
			s_setVar(userid,169,124,expcopynum - s_getVar(userid,169,120))
		end
		if s_getVar(userid,169,120) == expcopynum then
			s_setVar(userid,169,124,0)
		end
	elseif 132 == mapid then
		if s_getVar(userid,169,121) < expcopynum then
			s_setVar(userid,169,121,s_getVar(userid,169,121)+1)
		end
		if s_getVar(userid,169,121) <= expcopynum then
			s_setVar(userid,169,125,expcopynum - s_getVar(userid,169,121))
		end
		if s_getVar(userid,169,121) == expcopynum then
			s_setVar(userid,169,125,0)
		end
	elseif 133 == mapid then
		if s_getVar(userid,169,122) < expcopynum then
			s_setVar(userid,169,122,s_getVar(userid,169,122)+1)
		end
		if s_getVar(userid,169,122) <= expcopynum then
			s_setVar(userid,169,126,expcopynum - s_getVar(userid,169,122))
		end
		if s_getVar(userid,169,122) == expcopynum then
			s_setVar(userid,169,126,0)
		end
	end
		
	s_debugUser(userid,"Exp offline back  %u %u %u %u %u",s_getVar(userid,169,107),s_getVar(userid,169,123),s_getVar(userid,169,124),s_getVar(userid,169,125),s_getVar(userid,169,126))
end

 
