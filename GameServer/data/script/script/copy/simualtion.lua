--1v1模拟战
--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
--0_101		开始时间
--0_102		比赛结束
--0_103		0:竞技场初始化,1:玩家进入竞技场, 2:产生对手, 3:跳出循环
--0_104		npc死亡时间
--0_105		玩家死亡时间
--1_30		npcid
--1_101		挑战类型
--1_102		挑战方ID
--1_103		被挑战方ID
--1_104		被挑战方是否是竞技场守卫

CopySceneInfo_69 = {}
--竞技场副本变量
function CopySceneInfo_69:GetSimulationCopyVar(sid,index,key)
	return s_getSceneVar(sid,3,index*100+key)
end

function CopySceneInfo_69:SetSimulationCopyVar(sid,index,key,value)
	s_setSceneVar(sid,3,index*100+key,value)
end

function CopySceneInfo_69:InitCopyScene(cid)
	self:SetSimulationCopyVar(cid, 0, 101, 0)
	self:SetSimulationCopyVar(cid, 0, 102, 0)
	self:SetSimulationCopyVar(cid, 0, 103, 0)
	self:SetSimulationCopyVar(cid, 0, 104, 0)
	self:SetSimulationCopyVar(cid, 0, 105, 0)
	self:SetSimulationCopyVar(cid, 1, 30, 0)
end

function CopySceneInfo_69:CopyExtInitEvent(ctype, cid)
	local simulationinfo = s_getSimulationInfo(cid)
	if simulationinfo == nil then
		s_error("获取竞技场相关数据错误")
		return
	end

	self:SetSimulationCopyVar(cid, 1, 101, simulationinfo[1])
	self:SetSimulationCopyVar(cid, 1, 102, simulationinfo[2])
	self:SetSimulationCopyVar(cid, 1, 103, simulationinfo[3])
	self:SetSimulationCopyVar(cid, 1, 104, simulationinfo[4])
	--s_trace("simulation "..simulationinfo[1]..","..simulationinfo[2]..","..simulationinfo[3]..","..simulationinfo[4])
end

function CopySceneInfo_69:OnPlayerLeaveCopyScene(cid, uid)
	--删除buff
	--s_removebuff(SCENE_ENTRY_PLAYER,uid,71)
	--s_setSelfHide(SCENE_ENTRY_PLAYER,uid,2)

	--s_trace("simulation player Leave uid="..uid)
	local maxhp = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MAXHP)
	local maxsp = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MAXSP)
	local maxintervalue = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MAXINTERVALUE)

	--s_trace("simulation player maxhp = ".. maxhp)
	s_subState(SCENE_ENTRY_PALYER, uid,	SceneEntry_Death)
	s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_HP, maxhp)
	s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SP, maxsp)
	s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_INTERVALUE, maxintervalue)
	--移除中毒buff
	s_removebuff(SCENE_ENTRY_PLAYER, uid, 1500, 1)
	--移除麻痹buff
	s_removebuff(SCENE_ENTRY_PLAYER, uid, 2003, 1)
	--移除冰冻buff
	s_removebuff(SCENE_ENTRY_PLAYER, uid, 2004, 1)
end

function CopySceneInfo_69:OnPlayerIntoCopyScene(cid,uid)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	--s_trace("simulation start sec = ".. cursec)
	self:SetSimulationCopyVar(cid, 0, 101, cursec)
	self:SetSimulationCopyVar(cid, 0, 103, 1)
	--添加buff
	--s_addbuff(SCENE_ENTRY_PLAYER,uid,71,1,10*60)
	--s_setSelfHide(SCENE_ENTRY_PLAYER,uid,1)
	--	AddRoleTaskOperate(uid,15223)
	--	AddAchieveTaskOperate(uid,41004,1)
    --每日目标次数
    s_addDailyTargetTime(uid, enumDailySubTargetType_JJC, 1)

    --完成主线任务
    if s_hasTask(uid,1114)  == VALUE_OK then
		--正在做竞技场任务,不扣次数
		local taskProcess = s_getTaskValue(uid, 1114, TaskValue_Process)
		s_trace("竞技场任务:"..taskProcess)
		if taskProcess == TaskProcess_Doing then
			s_trace("竞技场任务:"..uid)
			s_addField(uid, UserVar_SimulationNum, 1)
		end
        AddRoleTaskOperate(uid,1114)
    end
    --完成主线任务
    local taskProcess = s_getTaskValue(uid, 1120, TaskValue_Process)
    if taskProcess == TaskProcess_Doing then
        s_addField(uid, UserVar_SimulationNum, 1)
        AddRoleTaskOperate(uid,1120)
    end

    --完成主线任务
    local taskProcess = s_getTaskValue(uid, 1122, TaskValue_Process)
    if taskProcess == TaskProcess_Doing then
        s_addField(uid, UserVar_SimulationNum, 1)
        AddRoleTaskOperate(uid,1122)
    end
end

function OnLoopCopyScene_1Sec_69(ctype,cid)
	CopySceneInfo_69:Loop_1Sec(ctype,cid)
end

function CopySceneInfo_69:Loop_1Sec(ctype,cid)
	if self:GetSimulationCopyVar(cid, 0, 103) == 3 then
		return
	end

	if self:GetSimulationCopyVar(cid, 0, 103) == 2 then
		local cursec = s_getCurTime(TIME_ALLSECONDS)
		local start = self:GetSimulationCopyVar(cid, 0, 101)
		local npcdie = self:GetSimulationCopyVar(cid, 0, 104)
		local playdie = self:GetSimulationCopyVar(cid, 0, 105)
		--s_trace("simulation cursec = ".. cursec)
		--s_trace("simulation start sec = "..start)
		--s_trace("simulation npcdie = ".. npcdie)
		--s_trace("simulation playdie = "..playdie)

		-- time over
		if cursec  >= (start + 5 * 60 + 3) and npcdie == 0 and playdie == 0 then
			self:PlayDie(cid)
		end

		-- npc die
		if npcdie ~= 0 and playdie == 0 then
			if cursec - npcdie >= 1 then
				self:NpcDie(cid)
			end
		end

		-- play die
		if playdie ~= 0 and npcdie == 0 then
			if cursec - playdie >= 1 then
				self:PlayDie(cid)
			end
		end

		-- npc die and play die
		if playdie ~= 0 and npcdie ~= 0 then
			if cursec - playdie >= 1 then
				self:PlayDie(cid)
			end
		end
	end

	if self:GetSimulationCopyVar(cid, 0, 103) == 1 then
		--create npc
		local npcid = s_sysSummon(15000,cid,20,5,1044)
		if npcid == nil or npcid == 0 then
			s_error("模拟战NPC配置错误")
			self:SetSimulationCopyVar(cid, 0, 103, 3)
			return
		end
		self:SetSimulationCopyVar(cid,1,30,npcid)
		self:SetSimulationCopyVar(cid, 0, 103, 2)
	end
end

--对方死亡
function CopySceneInfo_69:OnCopyFinish(sid)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	--s_trace("simulation npc die cursec ="..cursec)
	self:SetSimulationCopyVar(sid, 0, 104, cursec)
end

--玩家死亡
function CopySceneInfo_69:OnPlayerDie(sid, uid, murderlist, dtype)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	--s_trace("simulation play die cursec = "..cursec)
	self:SetSimulationCopyVar(sid,0, 105, cursec)
end

--竞技场结束发送消息
function CopySceneInfo_69:finishSimulation(sid, copytype, winer, loser, winisrobot, loseisrobot)
	s_finishSimulation(copytype, winer, loser, winisrobot, loseisrobot)
	local npcid = self:GetSimulationCopyVar(sid, 1, 30)
	s_clearNpc(npcid)
	self:SetSimulationCopyVar(sid, 0, 102, 1)
	self:SetSimulationCopyVar(sid, 0, 103, 3)
end

--npc die
function CopySceneInfo_69:NpcDie(cid)
	local battletype = self:GetSimulationCopyVar(cid, 1, 101)
	local winer = self:GetSimulationCopyVar(cid, 1, 102)
	local loser = self:GetSimulationCopyVar(cid, 1, 103)
	local loseisrobot = self:GetSimulationCopyVar(cid, 1, 104)
	self:finishSimulation(cid, battletype, winer, loser, 0, loseisrobot)
end

--player die
function CopySceneInfo_69:PlayDie(cid)
	local battletype = self:GetSimulationCopyVar(cid, 1, 101)
	local winer = self:GetSimulationCopyVar(cid, 1, 103)
	local loser = self:GetSimulationCopyVar(cid, 1, 102)
	local winisrobot = self:GetSimulationCopyVar(cid, 1, 104)
	self:finishSimulation(cid, battletype, winer, loser, winisrobot, 0)
end
