-- 日常副本
-- 金币副本
CopySceneInfo_1201 =
{
	initcopy =
	{
		action =
		{
			{s_copySetRecycleTime,{600000}},
		},
	},

	robotids = DailyCopyConfig.robotids,
	refreshMonsterVar = DailyCopyConfig.copyMonsterRefreshVar,
	chaptername = "coin",
}

function CopySceneInfo_1201:OnPlayerIntoCopyScene(sceneid, userid)
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	s_sendCopyZoneOne(sceneid,tostring(monstercount))
	self:CreateRobot(sceneid, userid)
end

function CopySceneInfo_1201:CreateRobot(sceneid, userid)
	local isnewbie = IsNewbieDailyCopy(userid, self.chaptername)
	if not isnewbie then
		return
	end

    local viplevel = s_getVIPLevel(userid)
	local index = viplevel + 1
	local robots = self.robotids[index]
	if robots == nil then
		return
	end

	local userpos = s_getUserPos(userid)
	for i = 1, #robots do
		local npcid = s_summon(SCENE_ENTRY_PLAYER, userid, robots[i],1068,0, userpos.x + math.random(0,10) - 5, userpos.y + math.random(0,10) - 5)
		if npcid ~= 0 then
			s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MASTER, userid)
		end
	end
end

function CopySceneInfo_1201:ClearRobot(sceneid, userid)
	local viplevel = s_getVIPLevel(userid)
	local robots = self.robotids[viplevel + 1]
	if robots ~= nil then
		s_copyClearNpcByBaseID(userid, 60, 1201, sceneid, robots)
	end
end

function CopySceneInfo_1201:OnCopySceneVarChange(sceneid, key1, key2, newvalue, oldvalue)
	if key1 == self.refreshMonsterVar[1] and key2 == self.refreshMonsterVar[2] then
		local monsterdatas = CoinCopyNpcDataBase
		for _,monster in ipairs(monsterdatas) do
			if type(monster) == "table" and monster.montype == 1 then
				s_sysSummon(monster.monid, sceneid, 17 + math.random(0,12) - 6, 15 + math.random(0,12) - 6, 0, 1)
			end
		end

		local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
		s_sendCopyZoneOne(sceneid,tostring(monstercount))
	end
end

function CopySceneInfo_1201_MyNpcDeadNoraml(userid, npcid)
	local sceneid = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_SCENE_ID)
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	s_sendCopyZoneOne(sceneid,tostring(monstercount))
end

function CopySceneInfo_1201:RegisterNpcDead()
	local monsterdatas = CoinCopyNpcDataBase
	for _,monster in ipairs(monsterdatas) do
		if type(monster) == "table" and monster.montype == 1 then
			RegisterMyNpcDeadEvent(monster.monid,"CopySceneInfo_1201_MyNpcDeadNoraml($1,$2)")
		end
	end
end

--玩家离开副本
function CopySceneInfo_1201:OnPlayerLeaveCopyScene(sceneid, userid)
	self:ClearRobot(sceneid, userid)
end

CopySceneInfo_1201:RegisterNpcDead()

