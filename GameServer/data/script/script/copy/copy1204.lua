-- 日常副本之
-- 经验副本
CopySceneInfo_1204 =
{
	initcopy =
	{
		action =
		{
			{s_copySetRecycleTime,{600000}},
		},
	},

	chapterid = 2,

	montypes =
	{
		[1] = 55,
		[2] = 70,
		[3] = 80,
		[4] = 1002,
		[5] = 1004,
	},

	robotids = DailyCopyConfig.robotids,
	fixposes = DailyCopyConfig.fixposes,
	refreshMonsterVar = DailyCopyConfig.copyMonsterRefreshVar,
	chaptername = "exp",
}

function CopySceneInfo_1204:OnPlayerIntoCopyScene(sceneid, userid)
--	s_trace("进入副本============="..sceneid.."===="..userid)
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	s_sendCopyZoneOne(sceneid, tostring(monstercount))
	self:CreateRobot(sceneid, userid)
	local taskProcess = s_getTaskValue(userid, 1058, TaskValue_Process)
     if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(userid,1058)
    end
end


function CopySceneInfo_1204:CreateRobot(sceneid, userid)
  --  s_debug("CopySceneInfo_1204:CreateRobot:" .. sceneid .. "," .. userid)
    local viplevel = s_getVIPLevel(userid)
	local index = viplevel + 1
	local robots = self.robotids[index]
	if robots == nil then
		return 0
	end

	local vipdata = VipDataBase.query(viplevel)
	local notinclude = {}

	local isnewbie = IsNewbieDailyCopy(userid, self.chaptername)
	if not isnewbie then
		local sweeps = 1
		if vipdata ~= nil then
			sweeps = vipdata.sweeps
		end
		if #robots > sweeps then
			local count = #robots - sweeps
			while count > 0 do
				local index = math.random(1, #robots)
				if notinclude[index] == nil then
					notinclude[index] = true
					count = count - 1
				end
			end
		end
	end

	local robotcount = 0
	local userpos = s_getUserPos(userid)
	for i = 1, #robots do
		if notinclude[i] ~= true then
			local npcid = s_summon(SCENE_ENTRY_PLAYER, userid, robots[i],1068,0, userpos.x + math.random(0,10) - 5, userpos.y + math.random(0,10) - 5)
			if npcid ~= 0 then
				robotcount = robotcount + 1
				s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MASTER, userid)
			end
		end
	end
    s_debug("CopySceneInfo_1204:CreateRobot count:" .. robotcount)
end

function CopySceneInfo_1204:ClearRobot(sceneid, userid)
	s_debug("CopySceneInfo_1204:ClearRobot" .. sceneid .. ", " .. userid)
	local viplevel = s_getVIPLevel(userid)
	local robots = self.robotids[viplevel + 1]
	if robots ~= nil then
		s_copyClearNpcByBaseID(userid, 60, 1204, sceneid, robots)
	end
end

function CopySceneInfo_1204:OnCopySceneVarChange(sceneid, key1, key2, newvalue, oldvalue)
	if key1 == self.refreshMonsterVar[1] and key2 == self.refreshMonsterVar[2] then
		local index = newvalue
		local x, y = 0, 0
		local fixpos = nil
		local ds = 4
		local fs = 5
		local monsterdatas = ExpCopyNpcDataBase
		for _,monster in ipairs(monsterdatas) do
			if type(monster) == "table" and monster.montype == self.montypes[index] then
				x = math.random(2,24)
				y = math.random(2,16)
				if math.abs(x - 13) < ds and math.abs(y - 9) < ds then
					fixpos =  self.fixposes[math.random(1,8)]
					if fixpos ~= nil then
						x = x + fixpos[1] * fs
						y = y + fixpos[2] * fs
					end
				end
				s_sysSummon(monster.monid, sceneid, x, y, 0, 1)
			end
		end

		local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
		s_sendCopyZoneOne(sceneid, tostring(monstercount))
	end
end

function CopySceneInfo_1204:OnPlayerLeaveCopyScene(sceneid, userid)
	self:ClearRobot(sceneid, userid)
end

function CopySceneInfo_1204_MyNpcDeadNoraml(userid, npcid)
	local self = CopySceneInfo_1204
	local sceneid = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_SCENE_ID)
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	s_sendCopyZoneOne(sceneid, tostring(monstercount))
end

function CopySceneInfo_1204:RegisterNpcDead()
	local monsterdatas = ExpCopyNpcDataBase
	for _,monster in ipairs(monsterdatas) do
		if type(monster) == "table" and monster.monid ~= nil then
			RegisterMyNpcDeadEvent(monster.monid,"CopySceneInfo_1204_MyNpcDeadNoraml($1,$2)")
		end
	end
end






CopySceneInfo_1204:RegisterNpcDead()

