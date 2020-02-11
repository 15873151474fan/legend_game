--军战副本
--进入副本后区分阵营模式 17-阵营A(红方-场景属主) 18-阵营B(蓝方)

--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
-- 0-1 ~ 0-N  副本全局变量
ArBattle_Final			= 0		-- 副本销毁标志
ArBattle_RedID			= 1		-- 红方 主
ArBattle_BlueID			= 2		-- 蓝方
ArBattle_State			= 3		-- 副本状态
ArBattle_EndTime		= 4		-- 副本踢人倒计时
ArBattle_WarFlag		= 5		-- 战斗标记
ArBattle_WinGroup		= 6		-- 胜利方
ArBattle_Time			= 7		-- 开始时间
ArBattle_OneMin			= 8		-- 一分钟计时
ArBattle_Type           = 9     -- 战斗类型 普通/占领

--旗数据
ArFlag_Npc				= 1		-- 旗子NPC
ArFlag_Group			= 2		-- 当前阵营
ArFlag_ReadUser			= 3		-- 读旗者
ArFlag_ColdEnd			= 4		-- 冷却结束

-- 用户变量
ArUser_Gindex			= 1		-- 阵营索引
ArUser_LastWar			= 2		-- 上次参战副本标志
ArUser_GetFlag			= 3		-- 夺旗次数
ArUser_KillUser			= 4		-- 杀人数
ArUser_Killed			= 5		-- 被杀
ArUser_KillEquip		= 6		-- 击毁装备数量
ArUser_KillGuard		= 7		-- 击败碉堡
ArUser_Time				= 8		-- 参战时间

-- 2-1 ~ 2-N   两方全局数据
ArGroup_ID				= 1		-- 军ID
ArGroup_Points			= 2		-- 军战积分
ArGroup_Get5Time		= 3		-- 上次5旗占领时间
ArGroup_Get6Time		= 4		-- 上次6旗占领时间
ArGroup_General			= 5		-- 将军


--///////////////////////////////////////////////////////////////////
CopySceneInfo_7 =
{
	--阵营BUFF
	groupID = {17,18},
	--初始进入区
	initZone = {
		{ x = 85, y = 127, width = 5, height = 5 },
		{ x = 427, y = 127, width = 5, height = 5 }
	},
	--复活区
	reliveZone = {
		{ x = 39, y = 126, width = 5, height = 5 },
		{ x = 473, y = 126, width = 5, height = 5 }
	},
	--占领复活区
	flagZone =
	{
		{ x =107, y =45, width =5, height =5},
		{ x =403, y =45, width =5, height =5},
		{ x =403, y =205, width =5, height =5},
		{ x =107, y =205, width =5, height =5},
	},
	--将军及守卫配置
	master =
	{
		-- dir朝向(0~7) 0表示正上方向 然后顺时针到7
		--		{id =60117, x =96, y =127, buff =17, dir = 2},
		{id =44323, x =103, y =110, buff =17, dir = 2},
		{id =44323, x =115, y =120, buff =17, dir = 0},
		{id =44323, x =116, y =135, buff =17, dir = 4},
		{id =44323, x =104, y =145, buff =17, dir = 2},
		--		{id =60118, x =417, y =128, buff =18, dir = 6},
		{id =44323, x =409, y =110, buff =18, dir = 6},
		{id =44323, x =396, y =120, buff =18, dir = 0},
		{id =44323, x =396, y =136, buff =18, dir = 4},
		{id =44323, x =409, y =147, buff =18, dir = 6},
	},
	--战旗配置位置
	--1-4复活旗 5-6积分旗 7 BUFF旗
	flag =
	{
		{45155,45156,45157,x =168, y =45,  buff = {75,78}},
		{45155,45156,45157,x =344, y =45,  buff = {75,78}},
		{45155,45156,45157,x =344, y =207, buff = {75,78}},
		{45155,45156,45157,x =168, y =207, buff = {75,78}},
		{45158,45159,45160,x =256, y =45,  buff = {75,78}},
		{45158,45159,45160,x =256, y =207, buff = {75,78}},
		{45161,45162,45163,x =256, y =126, buff = {75,78}},
	},
	-- 冷却时间
	coldTime = 30,
	--增益BUFF
	addBuff = 23,
	--阵营名称
	groupName = {"红方", "蓝方"},
}

--用户变量
function CopySceneInfo_7:GetUserVar(uid,key)
	return s_getVar(uid,104,key)
end
function CopySceneInfo_7:SetUserVar(uid,key,value)
	s_addVar(uid,104,key,value)
end

--阵营变量
function CopySceneInfo_7:GetGroupVar(sid,index,key)
	return s_getSceneVar(sid,2,index*1000+key)
end
function CopySceneInfo_7:SetGroupVar(sid,index,key,value)
	s_setSceneVar(sid,2,index*1000+key,value)
end

--旗变量
function CopySceneInfo_7:GetFlagVar(sid,index,key)
	return s_getSceneVar(sid,3,index*100+key)
end
function CopySceneInfo_7:SetFlagVar(sid,index,key,value)
	s_setSceneVar(sid,3,index*100+key,value)
end

--全局变量
function CopySceneInfo_7:GetVar(sid,index)
	return s_getSceneVar(sid,0,index)
end
function CopySceneInfo_7:SetVar(sid,index,value)
	s_setSceneVar(sid,0,index,value)
end


--副本主循环
function OnLoopCopyScene_1Sec_7(stype,sid)
	CopySceneInfo_7:Loop_1Sec(stype,sid)
end
function CopySceneInfo_7:Loop_1Sec(stype,sid)
	local state = self:GetVar(sid,ArBattle_State)
	if state == 2 then	-- 结束
		local endtime = self:GetVar(sid,ArBattle_EndTime)
		endtime = endtime + 1
		if endtime > 5 then
			self:kickAllUser(sid)
			self:SetVar(sid,ArBattle_State,3)	--关闭
		end
		self:SetVar(sid,ArBattle_EndTime, endtime)
		return
	end

	if state ~= 1 then  -- 不在运行状态
		return
	end

	local curtime = s_getCurTime(TIME_ALLSECONDS)
	for i=5, 6 do
		local coldtime = self:GetFlagVar(sid, i, ArFlag_ColdEnd)
		local gindex = self:GetFlagVar(sid,i,ArFlag_Group)
		if coldtime > 0 and  gindex > 0 and coldtime <= curtime then
			self:SetFlagVar(sid, i, ArFlag_ColdEnd, coldtime+5)
			local points = self:GetGroupVar(sid,gindex,ArGroup_Points)
			points = points + 4
			self:SetGroupVar(sid,gindex,ArGroup_Points,points)
			self:SendCopyInfo(sid,0,0,0)
		end
	end
	local nextmin = self:GetVar(sid, ArBattle_OneMin)
	if curtime >= nextmin then
		local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			local userid = list[i+1]
			local ontime = self:GetUserVar(userid, ArUser_Time)
			ontime = ontime + 1
			self:SetUserVar(userid, ArUser_Time, ontime)
		end
		self:SetVar(sid, ArBattle_OneMin, curtime+60)
	end
	for i=1,2 do
		local points = self:GetGroupVar(sid,i,ArGroup_Points)
		if points >= 500 and self:GetGroupVar(sid,i,ArGroup_General) ~= 1 then
			if i == 2 then
				local npcid = s_sysSummon(60117, sid, 96, 127, 0, 1)
				if npcid > 0 then
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DIR,2)
					s_addGroup(SCENE_ENTRY_NPC,npcid,17)
					local world_level = s_getWorldLevel()
					if world_level == 2 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,3000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,2000,10)
					elseif world_level == 3 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,8000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,5000,10)
					elseif world_level == 4 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,13000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,9000,10)
					elseif world_level == 5 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,19000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,13000,10)
					elseif world_level == 6 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,29000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,20000,10)
					elseif world_level == 7 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,38000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,27000,10)
					elseif world_level == 8 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,47000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,34000,10)
					elseif world_level == 9 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,57000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,42000,10)
					elseif world_level == 10 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,68000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,50000,10)
					end
					local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
					for j = 1,table.getn(list), 2 do
						local userid = list[j+1]
						local mygi = self:GetUserVar(userid,ArUser_Gindex)
						if mygi == 1 then
							s_sysInfo(userid,"由于对方积分成功突破500积分，我方守卫将军亲自前来助战！本方成员获得了能力加成！",ChatPos_Sys + ChatPos_Important)
							s_addbuff(SCENE_ENTRY_PLAYER,userid,31069,1,60)
						else
							s_sysInfo(userid,"由于我方积分成功突破500积分，敌方守卫将军亲自前来助战！敌方成员获得了能力加成！将士们要小心了！", ChatPos_Sys + ChatPos_Important)
						end
					end
				end
			elseif i == 1 then
				local npcid = s_sysSummon(60118, sid, 417, 128, 0, 1)
				if npcid > 0 then
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DIR,6)
					s_addGroup(SCENE_ENTRY_NPC,npcid,18)
					local world_level = s_getWorldLevel()
					if world_level == 2 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,3000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,2000,10)
					elseif world_level == 3 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,8000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,5000,10)
					elseif world_level == 4 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,13000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,9000,10)
					elseif world_level == 5 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,19000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,13000,10)
					elseif world_level == 6 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,29000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,20000,10)
					elseif world_level == 7 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,38000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,27000,10)
					elseif world_level == 8 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,47000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,34000,10)
					elseif world_level == 9 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,57000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,42000,10)
					elseif world_level == 10 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,68000,10)
						s_addbuff(SCENE_ENTRY_NPC,npcid,102,50000,10)
					end
					local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
					for j = 1,table.getn(list), 2 do
						local userid = list[j+1]
						local mygi = self:GetUserVar(userid,ArUser_Gindex)
						if mygi == 2 then
							s_sysInfo(userid,"由于对方积分成功突破500积分，我方守卫将军亲自前来助战！本方成员获得了能力加成！",ChatPos_Sys + ChatPos_Important)
							s_addbuff(SCENE_ENTRY_PLAYER,userid,31069,1,60)
						else
							s_sysInfo(userid,"由于我方积分成功突破500积分，敌方守卫将军亲自前来助战！敌方成员获得了能力加成！将士们要小心了！",ChatPos_Sys + ChatPos_Important)
						end
					end
				end
			end
			self:SetGroupVar(sid,i,ArGroup_General,1)
		end
	end
end

--副本创建初始化
function CopySceneInfo_7:InitCopyScene(sid)
	local redArmy = self:GetVar(sid,ArBattle_RedID)
	if redArmy == 0 then
		return
	end
	local blueArmy = s_getArmyVar(redArmy,2,2)
	--初始将军及守卫
	for i=1, #self.master do
		local npcid = s_sysSummon(self.master[i].id, sid, self.master[i].x, self.master[i].y,0,1)
		if npcid > 0 then
			s_setValue(SCENE_ENTRY_NPC,npcid, VALUE_TYPE_DIR, self.master[i].dir)
			s_addGroup(SCENE_ENTRY_NPC,npcid, self.master[i].buff)
			--[[
			if self.master[i].id == 60117 or self.master[i].id == 60118 then
			local world_level = s_getWorldLevel()
			if world_level == 2 then
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,3000,10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,2000,10)
			elseif world_level == 3 then
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,8000,10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,5000,10)
			elseif world_level == 4 then
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,13000,10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,9000,10)
			elseif world_level == 5 then
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,19000,10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,13000,10)
			elseif world_level == 6 then
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,29000,10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,20000,10)
			elseif world_level == 7 then
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,38000,10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,27000,10)
			elseif world_level == 8 then
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,47000,10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,34000,10)
			elseif world_level == 9 then
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,57000,10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,42000,10)
			elseif world_level == 10 then
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,68000,10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,50000,10)
			end
			end
			]]
		else
			s_debug("军战NPC初始失败:%u",self.master[i].id)
		end
	end
	--初始战旗
	for i=1, 7 do
		local npcid = s_sysSummon(self.flag[i][3], sid, self.flag[i].x, self.flag[i].y,0,1)
		if npcid == 0 then
			s_debug("军战战旗初始失败:%u",self.flag[i][3])
		else
			self:SetFlagVar(sid,i, ArFlag_Npc, npcid)
			self:SetFlagVar(sid,i, ArFlag_Group, 0)
			self:SetFlagVar(sid,i, ArFlag_ReadUser, 0)
			self:SetFlagVar(sid,i, ArFlag_ColdEnd, 0)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,i)
		end
	end

	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local randf = curtime+math.random(0,1000000)
	self:SetVar(sid,ArBattle_State, 1)	--运行状态
	self:SetVar(sid,ArBattle_EndTime,0)
	self:SetVar(sid,ArBattle_BlueID, blueArmy)
	self:SetVar(sid,ArBattle_WarFlag, randf)
	self:SetVar(sid,ArBattle_WinGroup, 0)
	self:SetVar(sid,ArBattle_Time, curtime)
	self:SetVar(sid,ArBattle_OneMin, curtime + 60)

	self:SetGroupVar(sid,1,ArGroup_ID,redArmy)
	self:SetGroupVar(sid,2,ArGroup_ID,blueArmy)
	self:SetGroupVar(sid,1,ArGroup_Points,0)
	self:SetGroupVar(sid,2,ArGroup_Points,0)
	self:SetGroupVar(sid,1,ArGroup_Get5Time,0)
	self:SetGroupVar(sid,2,ArGroup_Get5Time,0)
	self:SetGroupVar(sid,1,ArGroup_Get6Time,0)
	self:SetGroupVar(sid,2,ArGroup_Get6Time,0)

	s_debug("军战场初始成功1-:%u,%u,2-:%u", redArmy, blueArmy, randf)
end

--玩家进入副本
function CopySceneInfo_7:OnPlayerIntoCopyScene(sid,uid)
	local army = s_getArmyID(uid)
	local state = self:GetVar(sid,ArBattle_State)
	if army == 0 or state ~= 1 then
		s_gomap(uid,1,1,0,0,1)
		return
	end

	local battype = s_getArmyVar(army,2,5)    -- 战场类型
	if battype ~= nil or battype ~= 0 then
		s_setSceneVar(sid,0,ArBattle_Type,battype)
	end

	local redArmy = self:GetVar(sid,ArBattle_RedID)
	local blueArmy = self:GetVar(sid,ArBattle_BlueID)
	local gindex = 1
	if army == redArmy then
	elseif army == blueArmy then
		gindex = 2
	else
		s_gomap(uid,1,1,0,0,1)
	end
	s_addGroup(SCENE_ENTRY_PLAYER, uid, gindex+16)

	local warflag = self:GetVar(sid,ArBattle_WarFlag)
	local lastwar = self:GetUserVar(uid,ArUser_LastWar)
	if warflag ~= lastwar then
		self:SetUserVar(uid,ArUser_LastWar,warflag)
		self:SetUserVar(uid,ArUser_Gindex,gindex)
		self:SetUserVar(uid,ArUser_GetFlag, 0)
		self:SetUserVar(uid,ArUser_KillUser, 0)
		self:SetUserVar(uid,ArUser_Killed, 0)
		self:SetUserVar(uid,ArUser_KillEquip, 0)
		self:SetUserVar(uid,ArUser_KillGuard, 0)
		self:SetUserVar(uid,ArUser_Time, 0)
	end
	local bufgroup = self:GetFlagVar(sid,7,ArFlag_Group)
	if bufgroup == gindex then
		s_addbuff(SCENE_ENTRY_PLAYER,uid,self.addBuff,1,3600)
	end
	self:RandIntoZone(uid,self.initZone[gindex])
	self:SendCopyInfo(sid,uid,0,0)
end

--前往指定区域
function CopySceneInfo_7:RandIntoZone(uid,zone)
	local posx = (zone.x - zone.width/2) + math.random(1, zone.width)
	local posy = (zone.y - zone.height/2) + math.random(1, zone.height)
	s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
end

function CopySceneInfo_7:CheckNearNpc(etype,eid,npcid,maxdis)
	local x = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
	local myx = s_getValue(etype,eid,VALUE_TYPE_POSX)
	local myy = s_getValue(etype,eid,VALUE_TYPE_POSY)
	if math.abs(x-myx) > maxdis or math.abs(y-myy) > maxdis then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function CopySceneInfo_7:CheckReadState(uid,npcid)
	if s_checkState(SCENE_ENTRY_PLAYER,uid,0) == VALUE_FAIL then
		s_sysInfo(uid,"非正常显身状态，不可操作",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local traffic = s_getTrafficType(uid)
	if traffic == nil then
		return VALUE_FAIL
	end
	if traffic ~= TrafficType_None then
		s_sysInfo(uid,"步行状态才可操作",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	if self:CheckNearNpc(SCENE_ENTRY_PLAYER,uid,npcid,5) == VALUE_FAIL then
		s_sysInfo(uid,"请再靠近一些",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	return VALUE_OK
end

--争夺BUFF
function OnClickNpc_45155(uid,npcid)
	CopySceneInfo_7:ToReadFlag(uid,npcid)
end
function OnClickNpc_45156(uid,npcid)
	CopySceneInfo_7:ToReadFlag(uid,npcid)
end
function OnClickNpc_45157(uid,npcid)
	CopySceneInfo_7:ToReadFlag(uid,npcid)
end
function OnClickNpc_45158(uid,npcid)
	CopySceneInfo_7:ToReadFlag(uid,npcid)
end
function OnClickNpc_45159(uid,npcid)
	CopySceneInfo_7:ToReadFlag(uid,npcid)
end
function OnClickNpc_45160(uid,npcid)
	CopySceneInfo_7:ToReadFlag(uid,npcid)
end
function OnClickNpc_45161(uid,npcid)
	CopySceneInfo_7:ToReadFlag(uid,npcid)
end
function OnClickNpc_45162(uid,npcid)
	CopySceneInfo_7:ToReadFlag(uid,npcid)
end
function OnClickNpc_45163(uid,npcid)
	CopySceneInfo_7:ToReadFlag(uid,npcid)
end

--争夺BUFF
function CopySceneInfo_7:ToReadFlag(uid,npcid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if sid == 0 or stype ~= CopySceneType_ArmyBattle then
		return
	end
	local npcindex = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	if npcindex == 0 then
		s_debug("读旗时找不到对应序号:%u,%u",uid,npcid)
		return
	end
	if self:CheckReadState(uid,npcid) == VALUE_FAIL then
		return
	end
	local gi = self:GetUserVar(uid,ArUser_Gindex)
	local npcgroup = self:GetFlagVar(sid,npcindex,ArFlag_Group)
	if gi == npcgroup then
		s_sysInfo(uid,"本方已经占领该据点",ChatPos_Sys + ChatPos_Important)
		return
	end
	local reader = self:GetFlagVar(sid,npcindex,ArFlag_ReadUser)
	if reader + 3 > s_getCurTime(TIME_ALLSECONDS) then
		s_sysInfo(uid,"已经有人抢先一步开始夺取",ChatPos_Sys + ChatPos_Important)
		return
	end
	self:SetFlagVar(sid,npcindex,ArFlag_ReadUser,s_getCurTime(TIME_ALLSECONDS))
	local callback = "CopySceneInfo_7:DoGetFlag($1,$2," .. sid .. "," .. npcindex .. ")"
	s_showbar(uid,3000,callback,UninterruptActionType_TASK,1,0,1)
end
function CopySceneInfo_7:DoGetFlag(uid,tbreak,sid,npcindex)
	if tbreak == nil then tbreak = 0 end
	if tbreak == 1 then
		self:SetFlagVar(sid,npcindex,ArFlag_ReadUser,0)
		return
	end
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local gi = self:GetUserVar(uid,ArUser_Gindex)
	local oldgi = self:GetFlagVar(sid,npcindex,ArFlag_Group)
	self:SetFlagVar(sid,npcindex,ArFlag_Group,gi)
	local npcid = self:GetFlagVar(sid,npcindex,ArFlag_Npc)
	if self.flag[npcindex][gi] ~= 0 then
		s_killnpc(npcid,1)
		npcid = s_sysSummon(self.flag[npcindex][gi],sid,self.flag[npcindex].x, self.flag[npcindex].y,0,1)
		if npcid > 0 then
			self:SetFlagVar(sid,npcindex,ArFlag_Npc,npcid)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,npcindex)
			s_addbuff(SCENE_ENTRY_NPC, npcid, self.flag[npcindex].buff[gi], 1, 3600)
		else
			s_debug("换旗招NPC失败:%u,%u",uid,self.flag[npcindex][gi])
		end
	end
	local getnum = self:GetUserVar(uid,ArUser_GetFlag)
	getnum = getnum + 1
	self:SetUserVar(uid,ArUser_GetFlag,getnum)
	-- BUFF NPC
	local armyid = self:GetGroupVar(sid,gi,ArGroup_ID)
	local armyname = s_getArmyField(armyid, ArmyVar_Name)
	if armyname == nil or armyname == "" then
		armyname = "未知军"
	end
	local corpsid = s_getCorpsId(uid)
	local corpsname = s_getCorpsField(corpsid, CorpVar_Name)
	local uname = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_NAME)
	if npcindex == 7 then
		local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			local userid = list[i+1]
			local mygi = self:GetUserVar(userid,ArUser_Gindex)
			if mygi == gi then
				s_addbuff(SCENE_ENTRY_PLAYER,userid,self.addBuff,1,3600)
			end
			if mygi == oldgi then
				s_removebuff(SCENE_ENTRY_PLAYER,userid,self.addBuff)
			end
		end
		s_copyInfo(sid, armyname .. "军" .. corpsname .. "团的" .. uname .. "为己方占领了神秘装置，所有" .. armyname .."军成员攻击力获得提升",ChatPos_Sys + ChatPos_Important)
	else
		local npcname = (npcindex <= 4) and "复活点" or "据点"
		s_copyInfo(sid, armyname .. "军" .. corpsname .. "团的" .. uname .. "为己方占领一座" .. npcname,ChatPos_Sys + ChatPos_Important)
	end
	if npcindex == 5 or npcindex == 6 then
		local lastindex = (npcindex == 5) and 3 or 4
		local lasttime = self:GetGroupVar(sid, gi, lastindex)
		if lasttime + self.coldTime < curtime then
			local batpoint = self:GetGroupVar(sid,gi,ArGroup_Points)
			batpoint = batpoint + 5
			self:SetGroupVar(sid, gi, ArGroup_Points, batpoint)
			self:SendCopyInfo(sid,0,0,0)
		end
		self:SetGroupVar(sid, gi, lastindex, curtime)
		self:SetFlagVar(sid, npcindex, ArFlag_ColdEnd, curtime + self.coldTime)
	end
	self:SendCopyInfo(sid,0,npcindex,gi)
end

--玩家离开副本
function CopySceneInfo_7:OnPlayerLeaveCopyScene(sid,uid)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,self.addBuff)
end

--进入碉堡
function CopySceneInfo_7:RequstIntoFort(uid,equipid)
	local baseid = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_BASE_ID)
	if baseid == 44323 then
		if self:CheckNearNpc(SCENE_ENTRY_PLAYER,uid,equipid,8) == VALUE_FAIL then
			s_sysInfo(uid,"请再靠近一点",ChatPos_Sys + ChatPos_Important)
			return
		end
		s_addDriver(uid,equipid)
	end
end

--玩家死亡
function CopySceneInfo_7:OnPlayerDie(sid,uid,murder,dtype)
	local killed = self:GetUserVar(uid,ArUser_Killed)
	killed = killed + 1
	self:SetUserVar(uid,ArUser_Killed,killed)
	if murder == nil or #murder == 0 then
		return
	end
	for i=1,#murder do
		local killnum = self:GetUserVar(murder[i],ArUser_KillUser)
		killnum = killnum + 1
		self:SetUserVar(murder[i],ArUser_KillUser,killnum)
	end
end

--玩家复活
function CopySceneInfo_7:OnPlayerRelive(uid, rtype)
	if rtype == 3 then
		local gindex = self:GetUserVar(uid,ArUser_Gindex)
		local zone = self.reliveZone[gindex]
		self:RandIntoZone(uid,zone)
	elseif rtype == 4 then
		--就近复活
		local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
		if sid == 0 then
			return
		end
		local gindex = self:GetUserVar(uid,ArUser_Gindex)
		local zone = self.reliveZone[gindex]
		local distance = self:GetReliveDistance(uid,zone)
		for i =1, 4 do
			local group = self:GetFlagVar(sid,i,ArFlag_Group)
			if group == gindex then
				local dis = self:GetReliveDistance(uid,self.flagZone[i])
				if dis < distance then
					distance = dis
					zone = self.flagZone[i]
				end
			end
		end
		self:RandIntoZone(uid,zone)
	end
end

--离复活区的距离
function CopySceneInfo_7:GetReliveDistance(uid,zone)
	local x = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	return math.sqrt((x-zone.x)^2 + (y-zone.y)^2)
end

--注册将军死亡事件
RegisterCopyNpcDeadEvent(60117,7,0,"CopySceneInfo_7:OnMasterDie($1,$2,2)")
RegisterCopyNpcDeadEvent(60118,7,0,"CopySceneInfo_7:OnMasterDie($1,$2,1)")

--注册碉堡死亡处理
RegisterCopyNpcDeadEvent(44323,7,0,"CopySceneInfo_7:OnGuardDie($1,$2)")

--将军死亡
function CopySceneInfo_7:OnMasterDie(sid,thisid,wingroup)
	local state = self:GetVar(sid,ArBattle_State)
	if state ~= 1 then
		return
	end
	self:SetVar(sid,ArBattle_WinGroup,wingroup)
	s_debug("军战中将军死亡:%u,胜利方:%u",thisid,wingroup)
	self:EndBattle(sid)
end

--战斗结束
function CopySceneInfo_7:EndBattle(sid)
	self:SetVar(sid,ArBattle_State,2)
	self:SetVar(sid,ArBattle_EndTime,0)
	self:SetVar(sid,ArBattle_Final,1)

	--积分奖励计算 5秒后踢出副本
	local allpoint = {0,0}
	local army = {0,0}
	army[1] = self:GetGroupVar(sid,1,ArGroup_ID)
	army[2] = self:GetGroupVar(sid,2,ArGroup_ID)
	allpoint[1] = self:GetGroupVar(sid,1,ArGroup_Points)
	allpoint[2] = self:GetGroupVar(sid,2,ArGroup_Points)
	local wgroup = self:GetVar(sid,ArBattle_WinGroup)
	local fgroup = 0
	if wgroup == 0 then
		if allpoint[1] > allpoint[2] then wgroup = 1 end
		if allpoint[2] > allpoint[1] then wgroup = 2 end
		allpoint[1] = allpoint[1] + 250
		allpoint[2] = allpoint[2] + 250
	else
		fgroup = (wgroup == 1) and 2 or 1
		allpoint[wgroup] = allpoint[wgroup] + 600
	end
	local scvalue = {1,1}
	if wgroup == 0 then
		s_copyInfo(sid, "本次军战结束，双方不分胜负",ChatPos_Sys + ChatPos_Important)
	else
		scvalue[wgroup] = 2
		scvalue[fgroup] = 0
		s_copyInfo(sid, "本次军战结束，" .. self.groupName[wgroup] .. "胜利", ChatPos_Sys + ChatPos_Important)
	end

	-- 激战规则 积分公式=K-value*(1+SC-2/(1+10^((对方积分-己方积分)/D-value))) K-value=30 D-value=1000
	-- SC 胜利2分，失败0分，平1分
	local curpoint = {0,0}
	curpoint[1] = s_getArmyField(army[1], ArmyVar_Grade)
	curpoint[2] = s_getArmyField(army[2], ArmyVar_Grade)
	curpoint[1] = curpoint[1] + 30 * (1+ scvalue[1]-2.0/(1+10^((curpoint[2]-curpoint[1])/1000)))
	curpoint[2] = curpoint[2] + 30 * (1+ scvalue[2]-2.0/(1+10^((curpoint[1]-curpoint[2])/1000)))
	if curpoint[1] < 0 then curpoint[1] = 0 end
	if curpoint[2] < 0 then curpoint[2] = 0 end
	s_setArmyField(army[1], ArmyVar_Grade, curpoint[1])
	s_setArmyField(army[2], ArmyVar_Grade, curpoint[2])
	s_debug("军战结果:%u,%u--%d,%d,%u--%d,%d",wgroup,army[1],allpoint[1],curpoint[1],army[2],allpoint[2],curpoint[2])
	s_addArmyVar(army[1],2,1,0)
	s_addArmyVar(army[1],2,2,0)
	s_addArmyVar(army[2],2,1,0)
	s_addArmyVar(army[2],2,2,0)
	-- 清除军报名
	s_addArmyVar(army[1],2,3,0)
	s_addArmyVar(army[2],2,3,0)

	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local battype = s_getSceneVar(sid,0,ArBattle_Type)
	local allwartime = (curtime - self:GetVar(sid, ArBattle_Time))/60
	if allwartime < 1 then allwartime = 1 end

	if battype == 1 then --普通军战
		local vlist,row,col = self:GetCopyInfoList(sid)
		for i = 1,table.getn(vlist), col do
			local userid = vlist[i]
			local gindex = vlist[i+1]
			local mytime = self:GetUserVar(userid, ArUser_Time)
			if mytime == 0 then mytime = 1 end
			local mypoint = vlist[i+7] + allpoint[gindex] * (mytime / allwartime)
			vlist[i+8] = mypoint
			local ulevel = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_LEVEL)
			-- 军战经验=军战积分*0.15*(50+0.1*人物等级^2.2)
			local myexp = mypoint * 0.15 * (50 + 0.1 * ulevel^2.2)
			s_refreshExp(userid,myexp*2,ExpType_Army,0)
			local medalnum = 5
			if gindex == wgroup then medalnum = 10 end
			if gindex == fgroup then medalnum = 3  end
			s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_WAR_MEDAL, medalnum*2)
			self:SetUserVar(userid,ArUser_LastWar,0)
		end
		s_sendCopyList(4,sid,0,col,row,vlist)
	elseif battype == 2 then --国王争夺战
		local vlist,row,col = self:GetCopyInfoList(sid)
		s_sendCopyList(4,sid,0,col,row,vlist)
		if wgroup > 0 then
			if wgroup == 1 then
				s_sendToSession(100,army[1],army[2])
			else
				s_sendToSession(100,army[2],army[1])
			end
		end
	elseif battype == 3 then
		local vlist,row,col = self:GetCopyInfoList(sid)
		s_sendCopyList(4,sid,0,col,row,vlist)
		if wgroup > 0 then
			if wgroup == 1 then
				s_sendToSession(101,army[1],army[2])
			else
				s_sendToSession(101,army[2],army[1])
			end
		elseif wgroup == 0 then
			local country = s_getArmyField(army[1],-2)
			if s_getArmyField(army[1],ArmyVar_ALeader) == s_getCountryVar(country,1,25) then
				s_sendToSession(101,army[1],army[2])
			else
				s_sendToSession(101,army[2],army[1])
			end
		end
	elseif battype == 4 then
		local vlist,row,col = self:GetCopyInfoList(sid)
		s_sendCopyList(4,sid,0,col,row,vlist)
		if wgroup > 0 then
			if wgroup == 1 then
				s_sendToSession(102,army[1],army[2])
			else
				s_sendToSession(102,army[2],army[1])
			end
		elseif wgroup == 0 then
			s_sendToSession(102,army[1],army[2])
		end
	end

	local rname = s_getArmyField(army[1],-1)
	local rcountry = s_getArmyField(army[1],-3)
	local bname = s_getArmyField(army[2],-1)
	local bcountry = s_getArmyField(army[2],-3)
	if wgroup > 0 and rcountry ~= nil and rname ~= nil and bcountry ~= nil and bname ~= nil then
		if wgroup == 1 then
			local msg = "恭喜"..rcountry.."的["..rname.."]军战胜了"..bcountry.."国的["..bname.."]军获得了军战优胜!"
			s_worldInfo(msg,ChatPos_Sys + ChatPos_Honor)
		else
			local msg = "恭喜"..bcountry.."的["..bname.."]军战胜了"..rcountry.."国的["..rname.."]军获得了军战优胜!"
			s_worldInfo(msg,ChatPos_Sys + ChatPos_Honor)
		end
	end
end

--所有退出
function CopySceneInfo_7:kickAllUser(sid)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_resetTrafficType(list[i+1])
		s_relive(list[i],list[i+1])
		local country = s_getValue(list[i],list[i+1],VALUE_TYPE_HOMELAND)
		s_gomap(list[i+1],country,3,0,0)
	end
end

--军战回调
function CopySceneInfo_7:ArmyBattleEventCall(value1,value2,etype)
	if etype == 1 then
		CopySceneInfo_7:StartArmyBattle(value1,value2)
	elseif etype == 2 then
		CopySceneInfo_7:EndArmyBattle()
	end
end

--军战开始回调
function CopySceneInfo_7:StartArmyBattle(red,blue)
	local call = "CopySceneInfo_7:OnAckIntoCopy($1,$2," .. red .. ")"
	local buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
	local msg = "<p><n>军战开始，是否前往战场参战?</n><newline/><n color='GXColorGreen'>（如果中途退场，可在战争狂人西德勒处重返战场）</n></p>"
	local battype = s_getArmyVar(red,2,5)  -- 战场类型
	if battype == 2 then
		msg = "<p><n>国王争夺战开始，是否前往战场参战?</n><newline/><n color='GXColorGreen'>（如果中途退场，可在战争狂人西德勒处重返战场）</n></p>"
	elseif battype == 3 then
		msg = "<p><n>国王竞选战开始，是否前往战场参战?</n><newline/><n color='GXColorGreen'>（如果中途退场，可在战争狂人西德勒处重返战场）</n></p>"
	elseif battype == 4 then
		msg = "<p><n>神之守护军争夺战开始，是否前往战场参战?</n><newline/><n color='GXColorGreen'>（如果中途退场，可在战争狂人西德勒处重返战场）</n></p>"
	end
	local list = s_getArmyEntry(red)
	for i = 1,table.getn(list) do
		s_registerMsgBox(list[i],call,buttons,msg,300)
	end
	local list = s_getArmyEntry(blue)
	for i = 1,table.getn(list) do
		s_registerMsgBox(list[i],call,buttons,msg,300)
	end
end

function CopySceneInfo_7:OnAckIntoCopy(uid,result,battle)
	if result == Button_Yes then
		s_resetTrafficType(uid)
		s_intoCopy(uid,CopySceneType_ArmyBattle,battle)
		s_debug("应答前往军战%u,%u",uid,battle)
	end
end

--军战结束回调
function CopySceneInfo_7:EndArmyBattle()
	local list = s_getSceneID(CopySceneType_ArmyBattle)
	for i = 1,table.getn(list) do
		local state = self:GetVar(list[i],ArBattle_State)
		if state == 1 then
			CopySceneInfo_7:EndBattle(list[i])
		end
	end
end

--刷新客户端副本信息
--1-7 当前7个占领点被占情况(0无,1红,2篮)
function CopySceneInfo_7:SendCopyInfo(sid,uid,ckey,cvalue)
	local vlist = {}
	local size = 1
	if ckey == 0 then
		for i=1, 7 do
			table.insert(vlist,i)
			local group = self:GetFlagVar(sid,i,ArFlag_Group)
			table.insert(vlist,group)
		end
		local batpoint = self:GetGroupVar(sid,1,ArGroup_Points)
		table.insert(vlist, 8)
		table.insert(vlist, batpoint)
		batpoint = self:GetGroupVar(sid,2,ArGroup_Points)
		table.insert(vlist, 9)
		table.insert(vlist, batpoint)
		size = 9
	else
		table.insert(vlist,ckey)
		table.insert(vlist,cvalue)
	end
	s_sendCopyVar(CopySceneType_ArmyBattle, sid,uid,size,vlist)
end

--刷新客户端战绩表
function CopySceneInfo_7:GetCopyInfoList(sid)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	local vlist = {}
	local row = 0
	for i = 1,table.getn(list), 2 do
		local userid = list[i+1]
		local gindex = self:GetUserVar(userid,ArUser_Gindex)
		local getnum = self:GetUserVar(userid,ArUser_GetFlag)
		local killuser = self:GetUserVar(userid,ArUser_KillUser)
		local killed = self:GetUserVar(userid,ArUser_Killed)
		local killequip = self:GetUserVar(userid, ArUser_KillEquip)
		local killguard = self:GetUserVar(userid, ArUser_KillGuard)
		table.insert(vlist,userid)
		table.insert(vlist,gindex)
		table.insert(vlist,getnum)
		table.insert(vlist,killuser)
		table.insert(vlist,killed)
		table.insert(vlist,killequip)
		table.insert(vlist,killguard)
		local mypoint = 100 * killguard + math.min(200, killuser*3) + math.min(200, killequip*20)
		table.insert(vlist,mypoint)
		table.insert(vlist,0)
		row = row + 1
	end
	return vlist,row,9
end

--客户端请求发送战绩数据
function CopySceneInfo_7:SendCopyInfoList(sid,uid,rtype)
	local vlist,row,col = self:GetCopyInfoList(sid)
	if vlist == nil or #vlist == 0 then
		return
	end
	s_sendCopyList(rtype,0,uid,col,row,vlist)
end

----------------------------------------------------------------------------------------------
-- GM指令
function CopySceneInfo_7:ArmyBattleGmCmd(gmtype,uid,red,blue)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if sid == 0 then
		return
	end
	if gmtype == 1 then
		if stype ~= CopySceneType_None then
			s_sysInfo(uid,"请在普通场景中执行",ChatPos_Sys + ChatPos_Important)
			return
		end
		if red == blue then
			s_sysInfo(uid,"不可以和自己打",ChatPos_Sys + ChatPos_Important)
			return
		end
		s_addArmyVar(red,2,1,red)
		s_addArmyVar(blue,2,1,red)
		s_addArmyVar(red,2,2,blue)
		s_addArmyVar(blue,2,2,blue)
		s_addArmyVar(red,2,4,blue)
		s_addArmyVar(blue,2,4,red)
		s_addArmyVar(red,2,5,1)
		s_addArmyVar(blue,2,5,1)
		s_sysInfo(uid,"请注意，你使用GM指令开始军战，非本场景成员需从战争狂人西德勒处主动选择进入",ChatPos_Sys + ChatPos_Important)
		CopySceneInfo_7:StartArmyBattle(red,blue)
		return
	end
	if gmtype == 2 then
		local state = self:GetVar(sid,ArBattle_State)
		if stype ~= CopySceneType_ArmyBattle or state ~= 1 then
			s_sysInfo(uid,"非军战战斗进行中",ChatPos_Sys + ChatPos_Important)
			return
		end
		s_sysInfo(sid,"使用GM指令结束军战",ChatPos_Sys + ChatPos_Important)
		CopySceneInfo_7:EndBattle(sid)
	end
	if gmtype == 3 then
		local army = s_getArmyID(uid)
		if army == 0 then
			return
		end
		s_addArmyVar(army,2,1,0)
		s_addArmyVar(army,2,2,0)
	end
end

--团魔甲死亡
function CopySceneInfo_7:ArmyEquipDie(sid,thisid)
	local murder = GetMurderList(SCENE_ENTRY_NPC,thisid)
	if murder == nil or #murder == 0 then
		return
	end
	for i=1,#murder do
		local killnum = self:GetUserVar(murder[i],ArUser_KillEquip)
		killnum = killnum + 1
		self:SetUserVar(murder[i],ArUser_KillEquip,killnum)
	end
end

--碉堡死亡
function CopySceneInfo_7:OnGuardDie(sid,thisid)
	local state = self:GetVar(sid,ArBattle_State)
	if state ~= 1 then
		return
	end
	local murder = GetMurderList(SCENE_ENTRY_NPC,thisid)
	if murder == nil or #murder == 0 then
		return
	end
	for i=1,#murder do
		local killnum = self:GetUserVar(murder[i],ArUser_KillGuard)
		killnum = killnum + 1
		self:SetUserVar(murder[i],ArUser_KillGuard, killnum)
	end
end

--领取奖励勋章
function CopySceneInfo_7:GetMyMedal(uid)
	local num = s_getVar(uid, 102, 4)
	local msg = "body(    战争是残酷的！奖励是丰厚的！请及时领取，过期不侯！newline()" ..
		"上次军战勋章奖励：" .. num .. "个)"
	msg = parseToTalk(msg)
	if num == 0 then
		ShowNpcMenuBottomStyle(uid,msg,"离开(3)")
	else
		ShowNpcMenuBottomStyle(uid,msg,"领取(3)","CopySceneInfo_7:DoGetMedal($1," .. num .. ")","取消(3)")
	end
end
function CopySceneInfo_7:DoGetMedal(uid,num)
	s_addItem(uid,29023,0,num,0,"1-1","军战奖励")
	s_addVar(uid, 102, 4, 0)
	s_debug("军战奖励领取:%u,%u",uid,num)
end

--注册团魔甲死亡处理
RegisterCopyNpcDeadEvent(44001,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44002,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44003,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44004,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44005,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44006,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44007,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44008,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44009,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44010,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44011,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44012,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44013,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44014,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44015,7,0,"CopySceneInfo_7:ArmyEquipDie($1,$2)")


