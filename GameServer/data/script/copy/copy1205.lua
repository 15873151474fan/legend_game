-- 闯关副本
CopySceneInfo_1205 =
{
	initcopy =
	{
		action =
		{
			{s_copySetRecycleTime,{600000}},
		},
	},

	fixposes = DailyCopyConfig.fixposes,

	lastSceneIdVar = TowerCopyCinfig.lastCopySceneIdVar,
	copyFloorVar = TowerCopyCinfig.copyFloorVar,
	monsterCountVar = TowerCopyCinfig.copyMonsterCountVar,
	monstBatchVar = TowerCopyCinfig.copyMonstBatchVar,
	curPassedVar = TowerCopyCinfig.curPassedVar,
	finishedVar = TowerCopyCinfig.copyFinishedVar,
	ownerVar = TowerCopyCinfig.copyOwnerVar,
	maxfloor = TowerCopyCinfig.maxFloor 
}

function CopySceneInfo_1205:SendReward(sceneid, userid, floor)
	local data = TowerCopyNpcDataBase.query(floor)
	if userid == nil or data == nil then
		return
	end

	local rate = 1

	-- 今天未重置过副本（每天可重置次数为2）
	if s_getVar(userid,149,5) == 2 then
		rate = s_getPayRate(enumPaySubType_Double,0)
	end

	local awarditem = data.reward
	GetRewardWithMail(userid, awarditem, "闯关副本第" .. floor .. "层奖励", rate, false, 1012)

	if floor > s_getVar(userid,169,93) and floor <= self.maxfloor then
		s_setVar(userid,169,93,floor)
	end
	--离线找回
	--爬过一次 第二天就无找回
	--if  s_getVar(userid,169,106) < s_getVar(userid,169,93) then
	--	s_setVar(userid,169,106,s_getVar(userid,169,106)+1)
	--end
	--if s_getVar(userid,169,106) <= s_getVar(userid,169,93) then
	--	s_setVar(userid,169,112,s_getVar(userid,169,93) - s_getVar(userid,169,106))
	--end
	--if s_getVar(userid,169,106) == s_getVar(userid,169,93) then
	--	s_setVar(userid,169,112,0)
	--end
	s_setVar(userid,169,106,s_getVar(userid,169,106)+1)
	s_setVar(userid,169,112,0)

end

function CopySceneInfo_1205:OnPlayerIntoCopyScene(sceneid, userid)
	s_setSceneVar(sceneid, self.ownerVar[1], self.ownerVar[2], userid)
	s_setVar(userid, self.lastSceneIdVar[1], self.lastSceneIdVar[2], sceneid)
	local curFloor = s_getSceneVar(sceneid, self.copyFloorVar[1], self.copyFloorVar[2])
	if curFloor	== 0 then
		local curFloor = s_getVar(userid, self.curPassedVar[1], self.curPassedVar[2]) + 1
		s_setSceneVar(sceneid, self.copyFloorVar[1], self.copyFloorVar[2], curFloor)
		s_setSceneVar(sceneid, self.monstBatchVar[1], self.monstBatchVar[2], 0)
		self:CreateNextMonster(sceneid, userid)
	else
		local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
		s_sendCopyZoneOne(sceneid,tostring(monstercount))
		if monstercount == 0 then
			self:CreateNextMonster(sceneid, userid)
		end
	end
    --每日目标次数
--		s_addDailyTargetTime(userid, enumDailySubTargetType_CopySceneTower, 1)
end

function CopySceneInfo_1205:CreateNextMonster(sceneid, userid)
    local curFloor = s_getSceneVar(sceneid, self.copyFloorVar[1], self.copyFloorVar[2])
    local curBatch = s_getSceneVar(sceneid, self.monstBatchVar[1], self.monstBatchVar[2])
    s_debug("CopySceneInfo_1205:CreateNextMonster:" .. sceneid .. "," .. userid .. "," .. curFloor .. "," .. curBatch)
    if curBatch >= 2 then
		if curBatch > 2 then
    		return
    	end
    	s_setCopyRecycleTime(sceneid, 10)
		s_setVar(userid, self.curPassedVar[1], self.curPassedVar[2], curFloor)
		s_setSceneVar(sceneid, self.finishedVar[1], self.finishedVar[2], 1)
    	self:SendReward(sceneid, userid, curFloor)

		local rate = 1
		-- 今天未重置过副本（每天可重置次数为2）
		if s_getVar(userid,149,5) == 2 then
			rate = s_getPayRate(enumPaySubType_Double,0)
		end
		s_sendTowerCopyOpt(userid, 4, curFloor, rate)
    	return
    end
    curBatch = curBatch + 1
    s_setSceneVar(sceneid, self.monstBatchVar[1], self.monstBatchVar[2], curBatch)

	local data = TowerCopyNpcDataBase.query(curFloor)
	if data == nil then
		return
	end
	local mons = data.mons1
	if curBatch == 2 then
		mons = data.mons2
	end
	if mons == nil then
		return
	end
	local index = string.find(mons, ",")
	if index == nil then
		return
	end
	local monid = tonumber(string.sub(mons, 1, index - 1))
	local monnum = tonumber(string.sub(mons, index + 1, string.len(mons)))
	if monid == nil or monnum == nil then
		return
	end

	if monnum == 1 then
		s_sysSummon(monid, sceneid, 17, 20, 0, 1)
	else
		local x, y = 0, 0
		local fixpos = nil
		local ds = 2
		local fs = 2
		for i = 1, monnum do
			x = math.random(12,21)
			y = math.random(17,24)
			if math.abs(x - 17) < ds and math.abs(y - 13) < ds then
				fixpos =  self.fixposes[math.random(1,8)]
				if fixpos ~= nil then
					x = x + fixpos[1] * fs
					y = y + fixpos[2] * fs
				end
			end
			s_sysSummon(monid, sceneid, x, y, 0, 1)
		end
	end

	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	s_sendCopyZoneOne(sceneid,tostring(monstercount))
end

function CopySceneInfo_1205_MyNpcDeadNoraml(userid, npcid)
	local self = CopySceneInfo_1205
	local sceneid = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_SCENE_ID)
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	--s_sysInfo(userid, "怪物数：" .. monstercount)
	s_sendCopyZoneOne(sceneid,tostring(monstercount))
	if monstercount == 0 then
		self:CreateNextMonster(sceneid, userid)
	end
end

--function CopySceneInfo_1205:OnPlayerLeaveCopyScene(cid,uid)
--	s_setCopyLifeTime(cid,10)
--end

function CopySceneInfo_1205:RegisterNpcDead()
	local monsterdatas = TowerCopyNpcDataBase
	local monid = 0
	local index = 0
	for _,monster in ipairs(monsterdatas) do
		if type(monster) == "table" and monster.mons1 ~= nil then
			if monster.mons1 ~= nil then
				index = string.find(monster.mons1, ",")
				if index ~= nil then
					monid = tonumber(string.sub(monster.mons1, 1, index - 1))
					if monid then
						RegisterMyNpcDeadEvent(monid,"CopySceneInfo_1205_MyNpcDeadNoraml($1,$2)")
					end
				end
			end
			if monster.mons2 ~= nil then
				index = string.find(monster.mons2, ",")
				if index ~= nil then
					monid = tonumber(string.sub(monster.mons2, 1, index - 1))
					if monid then
						RegisterMyNpcDeadEvent(monid,"CopySceneInfo_1205_MyNpcDeadNoraml($1,$2)")
					end
				end
			end
		end
	end
end

CopySceneInfo_1205:RegisterNpcDead()

