-- 日常副本之
-- 装备副本
CopySceneInfo_1203 =
{
	initcopy =
	{
		action =
		{
			{s_copySetRecycleTime,{600000}},
		},
	},

	robotids = DailyCopyConfig.equiprobotids,
	buffVar = DailyCopyConfig.copyBuffIdVar,
	newbieVar = DailyCopyConfig.copyNewbieVar,
	refreshMonsterVar = DailyCopyConfig.copyMonsterRefreshVar,
	copyIndexVar = DailyCopyConfig.copyIndexVar,
	chapterid = 1,
	chaptername = "equip",
}
function CopySceneInfo_1203:InitCopyScene_pre(ctype,cid)
	self.initcopy.action[1][2][1]=12*60*60*1000
end
function CopySceneInfo_1203:OnPlayerIntoCopyScene(sceneid, userid)
--	s_trace("进入副本============="..sceneid.."===="..userid)
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	s_sendCopyZoneOne(sceneid,tostring(monstercount))
	self:CreateRobot(sceneid, userid)
	local taskProcess = s_getTaskValue(userid, 1099, TaskValue_Process)
     if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(userid,1099)
    end
end



function CopySceneInfo_1203:CreateRobot(sceneid, userid)
  --  s_debug("CopySceneInfo_1203:CreateRobot:" .. sceneid .. "," .. userid)
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
	else
		s_setSceneVar(sceneid, self.newbieVar[1], self.newbieVar[2], 1)
	end

	local robotcount = 0
	local userpos = s_getUserPos(userid)
	s_debug(">>>>>>>>>>>>>>>>>>人的X 坐标 = "..userpos.x)
	s_debug(">>>>>>>>>>>>>>>>>>人的Y 坐标 = "..userpos.y)
	for i = 1, #robots do
		if notinclude[i] ~= true then
			--local npcid = s_summon(SCENE_ENTRY_PLAYER, userid, robots[i],1068,0)
			local npcid = s_summon(SCENE_ENTRY_PLAYER, userid, robots[i],1068,0, userpos.x + math.random(0,10) - 5, userpos.y + math.random(0,10) - 5)
			if npcid ~= 0 then
				robotcount = robotcount + 1
				s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MASTER, userid)
			end
		end
	end
    s_debug("CopySceneInfo_1203:CreateRobot count:" .. robotcount)
end

function CopySceneInfo_1203:ClearRobot(sceneid, userid)
	s_debug("CopySceneInfo_1203:ClearRobot" .. sceneid .. ", " .. userid)
	local viplevel = s_getVIPLevel(userid)
	local robots = self.robotids[viplevel + 1]
	if robots ~= nil then
		s_copyClearNpcByBaseID(userid, 60, 1203, sceneid, robots)
	end
end

function CopySceneInfo_1203:OnCopySceneVarChange(sceneid, key1, key2, newvalue, oldvalue)
	if key1 == self.refreshMonsterVar[1] and key2 == self.refreshMonsterVar[2] then
		local monster = EquipCopyNpcDataBase.query(newvalue)
		if monster ~= nil then
			s_setSceneVar(sceneid, self.copyIndexVar[1], self.copyIndexVar[2], newvalue)
			s_sysSummon(monster.monid, sceneid, monster.x, monster.y, 0, 1)
		end
		local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
		s_sendCopyZoneOne(sceneid,tostring(monstercount))
	end
end

function CopySceneInfo_1203:OnPlayerLeaveCopyScene(sceneid, userid)
	self:ClearRobot(sceneid, userid)
	s_debugUser(userid,">>>>>>>>>>>>>>>>>清除怪物buff sceneid = "..sceneid)
	local buffID = s_getSceneVar(sceneid, self.buffVar[1], self.buffVar[2])
	s_debugUser(userid,">>>>>>>>>>>>>>>>>清除怪物buff buffID = "..buffID)
	if buffID ~= 0 then
		s_removebuff(SCENE_ENTRY_PLAYER, userid, buffID)
	end
end

function CopySceneInfo_1203_MyNpcDeadNoraml(userid, npcid)
	local self = CopySceneInfo_1203
	local sceneid = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_SCENE_ID)

	local newbie = s_getSceneVar(sceneid, self.newbieVar[1], self.newbieVar[2], 1)
	if newbie ~= 1 then
		local index = s_getSceneVar(sceneid, self.copyIndexVar[1], self.copyIndexVar[2])
		OnDailyCopySuccessed(userid, self.chapterid, index)
	else
		s_setSceneVar(sceneid, self.newbieVar[1], self.newbieVar[2], 0)
	end

	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	s_sendCopyZoneOne(sceneid,tostring(monstercount))
	
	if monstercount == 0 then
		local scopyid = 0
		local scopyid = s_getVar(userid,140,101)
		if scopyid == 0 then	
			s_debugUser(userid,">>>>>>>>>>>>>>>>>取装备副本id时没取到 scopyid = "..scopyid)
			--s_setVar(userid,140,101,s_getCurTime(TIME_ALLSECONDS))
			--s_setVar(userid,140,102,0)
			return
		end
		s_debugUser(userid,">>>>>>>>>>>>>>>>>取装备副本id scopyid = "..scopyid)
		local copyname = EquipCopyNpcDataBase.query(scopyid)
		local copytime = copyname.time / 1000
		if scopyid < 6 then
			s_setVar(userid,140,101 + scopyid,0)
			s_setVar(userid,140,101 + scopyid,s_getCurTime(TIME_ALLSECONDS) + copyname.time)
			s_setVar(userid,140,111 + scopyid,1)
		else
			s_setVar(userid,140,120,0)
			s_setVar(userid,140,120,s_getCurTime(TIME_ALLSECONDS) + copyname.time)
			s_setVar(userid,140,117,1)
		end
		--s_setVar(userid,140,112,1)
		--s_setVar(userid,140,113,1)
		--s_setVar(userid,140,114,1)
		--s_setVar(userid,140,115,1)
		--s_setVar(userid,140,116,1)	
		--s_setVar(userid,140,115,2)
		--s_setVar(userid,140,101,0)
	end	
	--s_sendCopyZoneOne(sceneid,tostring(monstercount))
end

function CopySceneInfo_1203:RegisterNpcDead()
	local monsterdatas = EquipCopyNpcDataBase
	for _,monster in ipairs(monsterdatas) do
		if type(monster) == "table" and monster.monid ~= nil then
			RegisterMyNpcDeadEvent(monster.monid,"CopySceneInfo_1203_MyNpcDeadNoraml($1,$2)")
		end
	end
end




CopySceneInfo_1203:RegisterNpcDead()


