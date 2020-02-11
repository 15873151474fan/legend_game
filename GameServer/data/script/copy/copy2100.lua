--闯关副本
defencetower_over_time                = 1;        --活动结束时间

CopySceneInfo_2100 =
{

	fixposes = DailyCopyConfig.fixposes,

	copyFloorVar = TowerCopyCinfig.copyFloorVar,	--副本的层级
	monsterCountVar = TowerCopyCinfig.copyMonsterCountVar,--怪物数量
	curPassedVar = TowerCopyCinfig.curPassedVar,	--当前通过最高管卡
	finishedVar = TowerCopyCinfig.copyFinishedVar,	--副本完成状态
	maxfloor = TowerCopyCinfig.maxFloor, 			--最高层
}

function CopySceneInfo_2100:InitCopyScene(cid)
	s_setSceneVar(cid,1,defencetower_over_time,s_getCurTime(TIME_ALLSECONDS) + 120)
    --
    --s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_HP, 910000000)
    --s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP, 910000000)
end

function CopySceneInfo_2100:OnPlayerIntoCopyScene(sceneid, userid)
	s_debug("OnPlayerIntoCopyScene=========")
	s_addDailyTargetTime(userid, enumDailySubTargetType_CopySceneTower, 1)
	local curFloor = s_getVar(userid, self.curPassedVar[1], self.curPassedVar[2]) + 1
	local overtime = s_getSceneVar(sceneid,1,defencetower_over_time) - s_getCurTime(TIME_ALLSECONDS)
    	s_sendCopyTime(sceneid,overtime);
	s_sendCopyCustomTime(sceneid,curFloor,7)
	local data = ChallengeDataBase.query(curFloor)
	if data.monsterid1 ~= 0 and data.monsternum1 ~= 0 then
		for i=1,data.monsternum1,1 do
			s_sysSummon(data.monsterid1,sceneid,22,11,1063,1) 
		end
	end
	if data.monsterid2 ~= 0 and data.monsternum2 ~= 0 then 
		for i=1,data.monsternum2,1 do
			s_sysSummon(data.monsterid2,sceneid,22,11,1063,1) 
		end
	end

	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	s_setVar(userid,481,5,0)
	local npcnum = data.monsternum1 + data.monsternum2
	s_sendCopyZoneOne(sceneid,monstercount..","..npcnum)
end

function CopySceneInfo_2100:ClearNpc(cid)
    --清空npc
    local list = s_getSceneEntry(cid,SCENE_ENTRY_NPC)
--	s_debug("副本剩余npc数量 "..table.getn(list))
    for i = 1,table.getn(list), 2 do --清理NPC
        s_clearNpc(list[i+1])
    end
end

function CopySceneInfo_2100:SendReward(sceneid, userid, floor)
	local data = ChallengeDataBase.query(floor)
	if userid == nil or data == nil then
		return
	end
	local awarditem = data.award1
	GetRewardWithMail(userid, awarditem, "闯关副本第" .. floor .. "层奖励", 1, false, 1012)
	local awarditem1 = data.award2
	GetRewardWithMail(userid, awarditem1, "闯关副本第" .. floor .. "层奖励", 1, false, 1012)
	local i=math.random(1,10000);
	if i <= data.rate then
		local awarditem2 = data.award3
		GetRewardWithMail(userid, awarditem2, "闯关副本第" .. floor .. "层随机奖励", 1, false, 1012)
	end
end

function OnLoopCopyScene_1Sec_2100(ctype,cid)
	--local monstercount = s_getCopyEntryCount(cid, SCENE_ENTRY_NPC)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)	
	local uid = 0
        for i = 1,table.getn(list), 2 do
                if list[i] == SCENE_ENTRY_PLAYER then
                        uid = list[i+1]
                end
        end
	if uid == 0 then
		CopySceneInfo_2100:ClearNpc(cid)
		s_clearCopy(cid)
		return
	end
	local curFloor = s_getVar(uid, 481, 1)+1
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	if curtime >= s_getSceneVar(cid,1,defencetower_over_time) then
		CopySceneInfo_2100:ClearNpc(cid)
		s_clearCopy(cid)
	end
	
--	s_setCopyRecycleTime(cid, 10)	
end

function CopySceneInfo_2100_MyNpcDeadNoraml(userid, npcid)
	local self = CopySceneInfo_2100
	local sceneid = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_SCENE_ID)
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	--s_sysInfo(userid, "怪物数：" .. monstercount)
	local curFloor = s_getVar(userid, 481, 1)+1
	if monstercount == 0 and s_getVar(userid,481,5) == 0 then
		s_debug("oooooooooooooo")
		s_setVar(userid, 481, 1, curFloor)
		s_setField(userid, UserVar_CopyPassNum, curFloor)
		s_debug("1111111111.."..s_getField(userid, UserVar_CopyPassNum))
		s_setField(userid, UserVar_CopyTime, curtime)
		s_debug("222222222.."..s_getField(userid, UserVar_CopyTime))
		CopySceneInfo_2100:SendReward(sceneid, userid, curFloor)
		--s_addDailyTargetTime(userid, enumDailySubTargetType_CopySceneTower, 1)
		s_setVar(userid,481,5,1)
		CopySceneInfo_2100:ClearNpc(sceneid)
	end

	local data = ChallengeDataBase.query(curFloor)
	local npcnum = data.monsternum1 + data.monsternum2
	s_sendCopyZoneOne(sceneid,monstercount..","..npcnum)
end

function CopySceneInfo_2100:RegisterNpcDead()
	-- body
	local monsterdatas = ChallengeDataBase
	local monid = 0
	for _,monster in ipairs(monsterdatas) do
		if monster.monsterid1 ~= 0 then
			monid = monster.monsterid1
			if monid then
				RegisterMyNpcDeadEvent(monid,"CopySceneInfo_2100_MyNpcDeadNoraml($1,$2)")
			end
		end
		if monster.monsterid2 ~= 0 then
			monid = monster.monsterid2
			if monid then
				RegisterMyNpcDeadEvent(monid,"CopySceneInfo_2100_MyNpcDeadNoraml($1,$2)")
			end
		end
	end
end

CopySceneInfo_2100:RegisterNpcDead()
