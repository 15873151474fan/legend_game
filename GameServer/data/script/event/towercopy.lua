-- 爬塔副本
--[[TowerCopyCinfig =
{
	-- 玩家变量
	lastCopySceneIdVar = {149, 1},		-- 上次进入的闯关副本id，不能修改key否则要修改C++文件
	firstInitCopyVar = {149, 2},		-- 是否初始化过重置次数
	curPassedVar = {149, 4},			-- 当前通过的最高关卡
	resetCountVar = {149, 5},			-- 今日重置次数

	-- 场景变量
	copyMonsterCountVar = {1, 1},		-- 副本中怪物数暂存变量
	copyFloorVar = {1, 2},				-- 副本的层级
	copyMonstBatchVar = {1, 3},			-- 副本中第几波怪
	copyFinishedVar = {1, 4},			-- 副本完成状态
	copyOwnerVar = {1, 5},				-- 副本创建者

	maxFloor = 13,						-- 最高层
	copys =
	{
		[1] = {level = 70, mapID = 151, enterPos = {17,20}, script = 1205},
		[2] = {level = 70, mapID = 152, enterPos = {17,20}, script = 1205},
		[3] = {level = 70, mapID = 153, enterPos = {17,20}, script = 1205},
		[4] = {level = 70, mapID = 154, enterPos = {17,20}, script = 1205},
		[5] = {level = 70, mapID = 155, enterPos = {17,20}, script = 1205},
		[6] = {level = 70, mapID = 156, enterPos = {17,20}, script = 1205},
		[7] = {level = 70, mapID = 157, enterPos = {17,20}, script = 1205},
		[8] = {level = 70, mapID = 158, enterPos = {17,20}, script = 1205},
		[9] = {level = 70, mapID = 159, enterPos = {17,20}, script = 1205},
		[10] = {level = 70, mapID = 160, enterPos = {17,20}, script = 1205},
		[11] = {level = 70, mapID = 161, enterPos = {17,20}, script = 1205},
		[12] = {level = 70, mapID = 162, enterPos = {17,20}, script = 1205},
		[13] = {level = 70, mapID = 163, enterPos = {17,20}, script = 1205},
	},
}

-- 请求进入闯关副本
function RequestIntoTowerCopy(userid, lastcopymapid, lastcopysceneid)
	local self = TowerCopyCinfig

	-- 今天通过的最大关(重置后会从0开始)
	local maxPassedFloor = s_getVar(userid, self.curPassedVar[1], self.curPassedVar[2])
	if maxPassedFloor >= self.maxFloor then		s_sysInfo(userid, "你已全部通关！", ChatPos_Tips)
		return
	end

	local curFloor = maxPassedFloor + 1
	local copy = self.copys[curFloor]

	-- 等级限制
	if copy.level > 1000 then
		local needlevel = copy.level - 1000
		local userrebirth = s_getRebirthLevel(userid)
		if userrebirth < needlevel then
			s_sysInfo(userid, "飞升等级不足，达到" .. needlevel .. "级才能进入！", ChatPos_Tips)
			return
		end
	else
		local userlevel = s_getUserLevel(userid)
		if userlevel < copy.level then
			s_sysInfo(userid, "等级不足，达到" .. copy.level .. "级才能进入！", ChatPos_Tips)
			return
		end
	end

	-- 上次创建的副本还在
	if lastcopymapid == copy.mapID and lastcopysceneid ~= 0 then
		local lastFloor = s_getSceneVar(lastcopysceneid, self.copyFloorVar[1], self.copyFloorVar[2])
		if lastFloor == curFloor then
			s_gocopymap(SCENE_ENTRY_PLAYER, userid, lastcopysceneid, copy.enterPos[1], copy.enterPos[2])
			return
		end
	end

	-- 创建并进入副本
    s_intoCopyCustomSingle(userid, copy.script, copy.mapID, copy.enterPos[1], copy.enterPos[2], 0)

	--离线找回
	s_setVar(userid,169,112,0)
end

-- 请求进入下一个副本
function RequestIntoNextTowerCopy(userid, sceneid, mapid)
	local self = TowerCopyCinfig
	local finishedFlag = s_getSceneVar(sceneid, self.copyFinishedVar[1], self.copyFinishedVar[2])
	if finishedFlag ~= 1 then
		return
	end
	
	local curFloor = s_getSceneVar(sceneid, self.copyFloorVar[1], self.copyFloorVar[2])
	local maxPassedFloor = s_getVar(userid, self.curPassedVar[1], self.curPassedVar[2])
	if curFloor ~= maxPassedFloor then
		s_debug("curFloor,maxPassedFloor " .. curFloor .. ", " .. maxPassedFloor)
		return
	end

	local newFloor = curFloor + 1
	local copy = self.copys[newFloor]
	if copy then
		s_intoCopyCustomSingle(userid, copy.script, copy.mapID, copy.enterPos[1], copy.enterPos[2], 0)
	end
end

-- 获得爬塔副本可进入状态
function GetTowerCopyEnterableState(userid)
	local self = TowerCopyCinfig
	local maxPassedFloor = s_getVar(userid, self.curPassedVar[1], self.curPassedVar[2])
	if maxPassedFloor >= self.maxFloor then
		return 0
	end
	local curFloor = maxPassedFloor + 1
	local copy = self.copys[curFloor]
	-- 等级限制
	if copy.level > 1000 then
		local needlevel = copy.level - 1000
		local userrebirth = s_getRebirthLevel(userid)
		if userrebirth >= needlevel then
			return 1
		end
	else
		local userlevel = s_getUserLevel(userid)
		if userlevel >= copy.level then
			return 1
		end
	end
	return 0
end

--爬塔副本一键扫荡
function OneKeyFinishTowerCopy(userid)
	if 1 then return end
	--s_debugUser(userid,"OneKeyFinishTowerCopy...")
	local self = TowerCopyCinfig
	--local curfloor = s_getSceneVar(sceneid, self.copyFloorVar[1], self.copyFloorVar[2])
	local curfloor = s_getVar(userid,149,4)
	local hmaxfloor = s_getVar(userid,169,93)
	s_debugUser(userid,"OneKeyFinishTowerCopy floor=="..curfloor.." maxfloor=="..hmaxfloor)

	if curfloor >= hmaxfloor then
		s_debugUser(userid,"222curFloor >= hmaxfloor")
		s_sysInfo(userid,"当前层级大于或等于历史最高层数，无法扫荡", ChatPos_Tips)
		return 0
	end
	local cost = 0
	local data = TowerCopyNpcDataBase.query(curfloor)
	local maxdata = TowerCopyNpcDataBase.query(hmaxfloor)
	if  maxdata == nil then
		s_debugUser(userid,"OneKeyFinishTowerCopy maxdata nil")
		return 0
	end
	if  data == nil then
		s_debugUser(userid,"222data nil")
	end

	if curfloor == 0 and maxdata ~= nil then
		s_debugUser(userid,"222maxdata sweepnum "..maxdata.sweep)
		cost = maxdata.sweep
	else
		if maxdata ~=nil and data ~= nil and maxdata.sweep > data.sweep then
			s_debugUser(userid,"222final data sweepnum "..(maxdata.sweep - data.sweep))
			cost =  maxdata.sweep - data.sweep
		else
			s_debugUser(userid,"222data maxdata.sweep <= data.sweep")
			return 0
		end
	end

	 if s_checkMoneyByType(userid, MoneyType_Gold,cost) == 0 then
		 s_debugUser(userid,"爬塔一键扫荡，元宝不足 =="..cost)
		 s_sysInfo(userid,"元宝不足，无法一键扫荡",ChatPos_Tips)
		 return 0 
	 end
	 local ret = s_removeMoney(userid, MoneyType_Gold, cost,"爬塔副本一键扫荡消耗元宝",AddItemAction_Advanced)
	 if ret == nil or ret == 0 then
			s_debugUser(userid, "一键扫荡扣除元宝失败"..userid)
			s_sysInfo(userid, "扣除元宝失败", ChatPos_Tips)
	     return 0
	 end
	 --设置当前层数
	s_setVar(userid,149,4,hmaxfloor)
	local rate = 1
	-- 今天未重置过副本（每天可重置次数为2）
	if s_getVar(userid,149,5) == 2 then
		rate = s_getPayRate(enumPaySubType_Double,0)
	end
	 --发送奖励
	 if curfloor == 0 then
			GetRewardWithMail(userid,maxdata.totalreward,"爬塔副本一键扫荡",rate,false,AddItemAction_Task)
	 else 
		for index=curfloor+1,hmaxfloor,1 do
			local wdata = TowerCopyNpcDataBase.query(index)
			s_debugUser(userid,">>>>>>>>>>>>>>>index"..wdata.id)
			if wdata ~= nil then
				GetRewardWithMail(userid,wdata.reward,"爬塔副本一键扫荡",rate,false,AddItemAction_Task)
			end
		end
	 end
	s_sendTowerCopyOpt(userid, 4, hmaxfloor, rate)
	s_setVar(userid,169,112,0)
	return 1
end

--统计扫荡需要消耗的元宝数量
function GetOneKeyTowerCopyCost(userid)
	if 1 then return end
	--s_debugUser(userid,"GetOneKeyTowerCopyCost...")
	local self = TowerCopyCinfig
	if userid == nil then
		s_debug("GetOneKeyTowerCopyCost userid nil")
	end
	--local curfloor = s_getSceneVar(sceneid, self.copyFloorVar[1], self.copyFloorVar[2])
	--if curfloor	== 0 then
	--	local curfloor = s_getVar(userid, self.curPassedVar[1], self.curPassedVar[2]) + 1
	--end
	local curfloor = s_getVar(userid,149,4)
	local hmaxfloor = s_getVar(userid,169,93)
	s_debugUser(userid,"GetOneKeyTowerCopyCost floor=="..curfloor.." maxfloor=="..hmaxfloor)
	if hmaxfloor < 2 then
		s_sysInfo(userid, "一键扫荡需最少通过2层爬塔副本", ChatPos_Tips)
		return 0
	end
	if hmaxfloor > self.maxFloor then
		s_debugUser(userid, "一键扫荡最高层级高于13")
		return 0
	end
	if curfloor >= hmaxfloor then
		s_sysInfo(userid, "当前层级大于或等于历史最高层数，无法扫荡", ChatPos_Tips)
		return 0
	end
	local data = TowerCopyNpcDataBase.query(curfloor)
	local maxdata = TowerCopyNpcDataBase.query(hmaxfloor)
	if  maxdata == nil then
		s_debugUser(userid,"GetOneKeyTowerCopyCost maxdata nil")
		return 0
	end
	if  data == nil then
		s_debugUser(userid,"data nil")
	end

	if curfloor == 0 and maxdata ~= nil then
		s_debugUser(userid,"maxdata sweepnum "..maxdata.sweep)
		return maxdata.sweep
	else
		if maxdata ~=nil and data ~= nil and maxdata.sweep > data.sweep then
			s_debugUser(userid,"final data sweepnum "..(maxdata.sweep - data.sweep))
			return maxdata.sweep - data.sweep
		else
			return 0
		end
	end
end
--]]
