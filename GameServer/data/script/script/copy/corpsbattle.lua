--团战副本
-- 进入副本后区分阵营模式 17-阵营A(红方-场景属主) 18-阵营B(蓝方)

--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
-- 0-1 ~ 0-N  副本全局变量
CpBattle_Final			= 0		-- 副本销毁标志
CpBattle_RedID			= 1		-- 红方ID
CpBattle_BlueID			= 2		-- 蓝方ID
CpBattle_EndTime		= 3		-- 结束时间
CpBattle_Time			= 4		-- 战场开始时间
CpBattle_BuffOwner		= 5		-- BUFF所属方
CpBattle_Buff			= 6		-- 当前BUFF
CpBattle_AddTime		= 7		-- 水晶下次增长时间
CpBattle_Type			= 8		-- 战斗类型 普通/占领
CpBattle_State			= 9		-- 战斗状态
CpBattle_BuffFlag		= 10	-- BUFF读取标志
CpBattle_PosRedX		= 11	-- 水晶位置
CpBattle_PosRedY		= 12	--
CpBattle_PosBlueX		= 13	--
CpBattle_PosBlueY		= 14	--
CpBattle_UserIn			= 15	-- 玩家进入副本
CpBattle_TimeFlag		= 16	-- 随机标志
CpBattle_OneMin			= 17	-- 分钟计时

-- 用户变量
CpUser_LastWar			= 1		-- 上次参战副本标志
CpUser_Gindex			= 2		-- 阵营索引
CpUser_Crystal			= 3		-- 成功搬运水晶
CpUser_KillUser			= 4		-- 杀人数
CpUser_KillEquip		= 5		-- 击败团魔甲数量
CpUser_KillCar			= 6		-- 击败矿车数量
CpUser_CarryFlag		= 7		-- 在搬水晶所属阵营
CpUser_Killed			= 9		-- 被杀次数
CpUser_CrystalCar		= 10	-- 矿车搬运成功次数
CpUser_Time				= 11	-- 参战时间

-- 2-1 ~ 2-N   两方全局数据
CpGroup_ID				= 1		-- 团ID
CpGroup_Mine			= 2		-- 水晶矿NPC
CpGroup_Car				= 3		-- 矿车
CpGroup_CarryState		= 5		-- 人搬运状态
CpGroup_CarryUser		= 6		-- 搬运人员
CpGroup_LostNpc			= 7		-- 丢失在地的水晶
CpGroup_MineFlag		= 8		-- 水晶矿读取标志
CpGroup_LostNpcFlag		= 9		-- 地上水晶读取标志
CpGroup_CarCrystal		= 10	-- 车上水晶量 同时也是车搬运标志
CpGroup_LostTime		= 11	-- 地上水晶消失定时
CpGroup_ReliveTime		= 12	-- 矿车复活时间


--///////////////////////////////////////////////////////////////////
CopySceneInfo_3 =
{
	--水晶矿信息
	mineInfo = {
		{ npc = 45151, x = 206,y = 116, car = 44321, lost = 45153},
		{ npc = 45152, x = 49, y = 116, car = 44322, lost = 45154}
	},
	--初始进入区
	initZone = {
		{ x = 234, y = 149, width = 2, height = 2 },
		{ x = 21, y = 82, width = 2, height = 2 }
	},
	--复活区
	reliveZone = {
		{ x = 234, y = 149, width = 3, height = 3 },
		{ x = 21, y = 82, width = 3, height = 3 }
	},
	--出阵NPC坐标
	redLineNpcPos = {
		{ x = 146, y = 98}, -- 包裹0位置
		{ x = 154, y = 98}, -- 包裹1位置
		{ x = 162, y = 98}, -- 包裹2位置
		{ x = 170, y = 98}, -- 包裹3位置
		{ x = 178, y = 98}, -- 包裹4位置
		{ x = 186, y = 98}, -- 包裹5位置
		{ x = 194, y = 98}, -- 包裹6位置
		{ x = 202, y = 98}, -- 包裹7位置
		{ x = 210, y = 98}, -- 包裹8位置
		{ x = 218, y = 98}, -- 包裹9位置
		{ x = 226, y = 98}, -- 包裹10位置
		{ x = 231, y = 98}, -- 包裹11位置
		{ x = 238, y = 98}, -- 包裹12位置
		{ x = 146, y = 105},    -- 包裹13位置
		{ x = 162, y = 105},    -- 包裹14位置
		{ x = 168, y = 105},    -- 包裹15位置
		{ x = 178, y = 105},    -- 包裹16位置
		{ x = 190, y = 105},    -- 包裹17位置
		{ x = 194, y = 105},    -- 包裹18位置
		{ x = 202, y = 105},    -- 包裹19位置
		{ x = 209, y = 105},    -- 包裹20位置
		{ x = 218, y = 105},    -- 包裹21位置
		{ x = 230, y = 105},    -- 包裹22位置
		{ x = 236, y = 105},    -- 包裹23位置
		{ x = 244, y = 105},    -- 包裹24位置
		{ x = 146, y = 112},    -- 包裹25位置
		{ x = 154, y = 112},    -- 包裹26位置
		{ x = 162, y = 112},    -- 包裹27位置
		{ x = 170, y = 112},    -- 包裹28位置
		{ x = 178, y = 112},    -- 包裹29位置
		{ x = 186, y = 112},    -- 包裹30位置
		{ x = 196, y = 112},    -- 包裹31位置
		{ x = 216, y = 112},    -- 包裹32位置
		{ x = 228, y = 112},    -- 包裹33位置
		{ x = 235, y = 112},    -- 包裹34位置
		{ x = 238, y = 112},    -- 包裹35位置
		{ x = 146, y = 120},    -- 包裹36位置
		{ x = 154, y = 120},    -- 包裹37位置
		{ x = 162, y = 120},    -- 包裹38位置
		{ x = 170, y = 120},    -- 包裹39位置
		{ x = 178, y = 120},    -- 包裹40位置
		{ x = 186, y = 120},    -- 包裹41位置
		{ x = 196, y = 120},    -- 包裹42位置
		{ x = 216, y = 120},    -- 包裹43位置
		{ x = 228, y = 120},    -- 包裹44位置
		{ x = 235, y = 120},    -- 包裹45位置
		{ x = 238, y = 120},    -- 包裹46位置
		{ x = 146, y = 128},    -- 包裹47位置
		{ x = 162, y = 128},    -- 包裹48位置
		{ x = 168, y = 128},    -- 包裹49位置
		{ x = 178, y = 128},    -- 包裹50位置
		{ x = 190, y = 128},    -- 包裹51位置
		{ x = 194, y = 128},    -- 包裹52位置
		{ x = 202, y = 128},    -- 包裹53位置
		{ x = 209, y = 128},    -- 包裹54位置
		{ x = 218, y = 128},    -- 包裹55位置
		{ x = 230, y = 128},    -- 包裹56位置
		{ x = 236, y = 128},    -- 包裹57位置
		{ x = 244, y = 128},    -- 包裹58位置
		{ x = 146, y = 134},    -- 包裹59位置
		{ x = 154, y = 134},    -- 包裹60位置
		{ x = 162, y = 134},    -- 包裹61位置
		{ x = 170, y = 134},    -- 包裹62位置
		{ x = 178, y = 134},    -- 包裹63位置
		{ x = 186, y = 134},    -- 包裹64位置
		{ x = 194, y = 134},    -- 包裹65位置
		{ x = 202, y = 134},    -- 包裹66位置
		{ x = 210, y = 134},    -- 包裹67位置
		{ x = 218, y = 134},    -- 包裹68位置
		{ x = 226, y = 134},    -- 包裹69位置
		{ x = 236, y = 134},    -- 包裹70位置
		{ x = 241, y = 134},    -- 包裹71位置
	},
	blueLineNpcPos = {
		{ x = 108, y = 98}, -- 包裹0位置
		{ x = 100, y = 98}, -- 包裹1位置
		{ x = 92, y = 98},  -- 包裹2位置
		{ x = 84, y = 98},  -- 包裹3位置
		{ x = 76, y = 98},  -- 包裹4位置
		{ x = 68, y = 98},  -- 包裹5位置
		{ x = 60, y = 98},  -- 包裹6位置
		{ x = 52, y = 98},  -- 包裹7位置
		{ x = 44, y = 98},  -- 包裹8位置
		{ x = 36, y = 98},  -- 包裹9位置
		{ x = 28, y = 98},  -- 包裹10位置
		{ x = 23, y = 98},  -- 包裹11位置
		{ x = 16, y = 98},  -- 包裹12位置
		{ x = 108, y = 105},    -- 包裹13位置
		{ x = 92, y = 105}, -- 包裹14位置
		{ x = 86, y = 105}, -- 包裹15位置
		{ x = 76, y = 105}, -- 包裹16位置
		{ x = 64, y = 105}, -- 包裹17位置
		{ x = 60, y = 105}, -- 包裹18位置
		{ x = 52, y = 105}, -- 包裹19位置
		{ x = 45, y = 105}, -- 包裹20位置
		{ x = 36, y = 105}, -- 包裹21位置
		{ x = 24, y = 105}, -- 包裹22位置
		{ x = 18, y = 105}, -- 包裹23位置
		{ x = 10, y = 105}, -- 包裹24位置
		{ x = 108, y = 112},    -- 包裹25位置
		{ x = 100, y = 112},    -- 包裹26位置
		{ x = 92, y = 112}, -- 包裹27位置
		{ x = 84, y = 112}, -- 包裹28位置
		{ x = 76, y = 112}, -- 包裹29位置
		{ x = 68, y = 112}, -- 包裹30位置
		{ x = 58, y = 112}, -- 包裹31位置
		{ x = 38, y = 112}, -- 包裹32位置
		{ x = 26, y = 112}, -- 包裹33位置
		{ x = 19, y = 112}, -- 包裹34位置
		{ x = 16, y = 112}, -- 包裹35位置
		{ x = 108, y = 120},    -- 包裹36位置
		{ x = 100, y = 120},    -- 包裹37位置
		{ x = 92, y = 120}, -- 包裹38位置
		{ x = 84, y = 120}, -- 包裹39位置
		{ x = 76, y = 120}, -- 包裹40位置
		{ x = 68, y = 120}, -- 包裹41位置
		{ x = 59, y = 120}, -- 包裹42位置
		{ x = 38, y = 120}, -- 包裹43位置
		{ x = 26, y = 120}, -- 包裹44位置
		{ x = 19, y = 120}, -- 包裹45位置
		{ x = 16, y = 120}, -- 包裹46位置
		{ x = 108, y = 128},    -- 包裹47位置
		{ x = 92, y = 128}, -- 包裹48位置
		{ x = 86, y = 128}, -- 包裹49位置
		{ x = 76, y = 128}, -- 包裹50位置
		{ x = 64, y = 128}, -- 包裹51位置
		{ x = 60, y = 128}, -- 包裹52位置
		{ x = 52, y = 128}, -- 包裹53位置
		{ x = 45, y = 128}, -- 包裹54位置
		{ x = 36, y = 128}, -- 包裹55位置
		{ x = 24, y = 128}, -- 包裹56位置
		{ x = 18, y = 128}, -- 包裹57位置
		{ x = 10, y = 128}, -- 包裹58位置
		{ x = 108, y = 134},    -- 包裹59位置
		{ x = 100, y = 134},    -- 包裹60位置
		{ x = 92, y = 134}, -- 包裹61位置
		{ x = 84, y = 134}, -- 包裹62位置
		{ x = 76, y = 134}, -- 包裹63位置
		{ x = 68, y = 134}, -- 包裹64位置
		{ x = 60, y = 134}, -- 包裹65位置
		{ x = 52, y = 134}, -- 包裹66位置
		{ x = 44, y = 134}, -- 包裹67位置
		{ x = 36, y = 134}, -- 包裹68位置
		{ x = 28, y = 134}, -- 包裹69位置
		{ x = 20, y = 134}, -- 包裹70位置
		{ x = 15, y = 134}, -- 包裹71位置
	},
	--BUFF及概率
	buffInfo = {{30,23},{30,24},{30,25},{10,26}},

	--阵营名称
	groupName = {"红方", "蓝方"},
	--水晶矿最大值
	crystalMax = 42,
	--水晶矿初始值
	crystalInit = 20,
	--搬运状态
	carryBuff = 22,
	--最大操作距离
	maxDistance = 3,
	--矿车重生间隔 单位：秒
	carInterval = 180,
}

--用户变量
function CopySceneInfo_3:GetUserVar(uid,key)
	return s_getVar(uid,104,key)
end
function CopySceneInfo_3:SetUserVar(uid,key,value)
	s_addVar(uid,104,key,value)
end

--阵营变量
function CopySceneInfo_3:GetGroupVar(sid,index,key)
	return s_getSceneVar(sid,2,index*1000+key)
end
function CopySceneInfo_3:SetGroupVar(sid,index,key,value)
	s_setSceneVar(sid,2,index*1000+key,value)
end

--副本主循环
function OnLoopCopyScene_1Sec_3(stype,sid)
	CopySceneInfo_3:Loop_1Sec(stype,sid)
end
function CopySceneInfo_3:Loop_1Sec(stype,sid)
	local state = s_getSceneVar(sid,0,CpBattle_State)
	if state == 2 then	-- 结束
		local endtime = s_getSceneVar(sid,0,CpBattle_EndTime)
		endtime = endtime + 1
		if endtime > 5 then
			self:kickAllUser(sid)
			s_setSceneVar(sid,0,CpBattle_State,3) -- 关闭
		end
		s_setSceneVar(sid,0,CpBattle_EndTime,endtime)
		return
	end

	if state ~= 1 then  -- 不在运行状态
		return
	end

	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local addtime = s_getSceneVar(sid,0,CpBattle_AddTime)
	local addflag = 0
	if addtime > 0 and addtime <= curtime then
		addflag = 1
		s_setSceneVar(sid,0,CpBattle_AddTime,curtime+90)
	end
	local nextmin = s_getSceneVar(sid, 0, CpBattle_OneMin)
	if curtime >= nextmin then
		local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			local userid = list[i+1]
			local ontime = self:GetUserVar(userid, CpUser_Time)
			ontime = ontime + 1
			self:SetUserVar(userid, CpUser_Time, ontime)
		end
		s_setSceneVar(sid, 0, CpBattle_OneMin, curtime + 60)
	end
	local endflag = 0
	for i=1, 2 do
		--自动增长
		local npcid = self:GetGroupVar(sid,i,CpGroup_Mine)
		local curnum = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE)
		local oldnum = curnum
		if addflag == 1 then
			local addnum = 1
			local bufowner = s_getSceneVar(sid,0,CpBattle_BuffOwner)
			if bufowner == i then
				local buf = s_getSceneVar(sid,0,CpBattle_Buff)
				if buf == 26 then
					addnum = 2
				end
			end
			curnum = curnum + addnum
			s_copyInfo(sid, self:GetGroupName(sid, i) .. "水晶自动增长" .. addnum .. "块",ChatPos_Sys + ChatPos_Important);
		end
		--搬运到达判定
		local carryUser = self:GetGroupVar(sid,i,CpGroup_CarryUser)
		if carryUser > 0 then
			local which = self:GetUserVar(carryUser,CpUser_CarryFlag)
			local posx = s_getValue(SCENE_ENTRY_PLAYER,carryUser,VALUE_TYPE_POSX)
			local posy = s_getValue(SCENE_ENTRY_PLAYER,carryUser,VALUE_TYPE_POSY)
			if self:CheckNearNpc(SCENE_ENTRY_PLAYER,carryUser,npcid,self.maxDistance) == VALUE_OK then
				curnum = curnum + 1
				s_setValue(SCENE_ENTRY_PLAYER,carryUser,VALUE_TYPE_WEAPON_ID,0)
				s_removebuff(SCENE_ENTRY_PLAYER,carryUser,self.carryBuff)
				self:SetGroupVar(sid,i,CpGroup_CarryUser,0)
				local carryNum = self:GetUserVar(carryUser,CpUser_Crystal)
				carryNum = carryNum + 1
				self:SetUserVar(carryUser,CpUser_Crystal,carryNum)
				self:SetUserVar(carryUser,CpUser_CarryFlag,0)
				local uname = s_getValue(SCENE_ENTRY_PLAYER, carryUser, VALUE_TYPE_NAME)
				s_copyInfo(sid, self:GetGroupName(sid, i) .. "的" ..uname .."为己方搬运1块水晶",ChatPos_Sys + ChatPos_Important);
				posx = 0; posy = 0
			end
			self:SetCrystalPos(sid,which,posx,posy)
		end
		local carCrystal = self:GetGroupVar(sid,i,CpGroup_CarCrystal)
		if carCrystal > 0 then
			local mycar = self:GetGroupVar(sid,i,CpGroup_Car)
			local driver = s_getValue(SCENE_ENTRY_NPC,mycar,VALUE_TYPE_DRIVER)
			local which = self:GetUserVar(driver,CpUser_CarryFlag)
			local posx = s_getValue(SCENE_ENTRY_NPC,mycar,VALUE_TYPE_POSX)
			local posy = s_getValue(SCENE_ENTRY_NPC,mycar,VALUE_TYPE_POSY)
			if driver > 0 and self:CheckNearNpc(SCENE_ENTRY_NPC,mycar,npcid,self.maxDistance) == VALUE_OK then
				curnum = curnum + carCrystal
				s_setValue(SCENE_ENTRY_NPC,mycar,VALUE_TYPE_WEAPON_ID,0)
				s_removebuff(SCENE_ENTRY_NPC,mycar,self.carryBuff)
				self:SetGroupVar(sid,i,CpGroup_CarCrystal,0)
				local carryNum = self:GetUserVar(driver,CpUser_CrystalCar)
				carryNum = carryNum + 1
				self:SetUserVar(driver,CpUser_CrystalCar,carryNum)
				self:SetUserVar(driver,CpUser_CarryFlag,0)
				s_copyInfo(sid, self:GetGroupName(sid, i) .. [[采矿机械人成功搬运]] .. carCrystal .. "块水晶",ChatPos_Sys + ChatPos_Important);
				posx = 0; posy = 0
			end
			self:SetCrystalPos(sid,which,posx,posy)
		end
		--落地水晶死亡
		local lostTime = self:GetGroupVar(sid,i,CpGroup_LostTime)
		if lostTime > 0 and  lostTime <= curtime then
			curnum = curnum + 1
			local lostnpc = self:GetGroupVar(sid,i,CpGroup_LostNpc)
			if lostnpc > 0 then
				s_killnpc(lostnpc,1)
			end
			self:SetGroupVar(sid,i,CpGroup_LostTime,0)
			self:SetGroupVar(sid,i,CpGroup_LostNpc,0)
			s_copyInfo(sid, self:GetGroupName(sid, i) .. "掉落的水晶没人搬运，自动归还",ChatPos_Sys + ChatPos_Important);
			self:SetCrystalPos(sid,i,0,0)
		end
		if curnum >= self.crystalMax then
			endflag = 1
			curnum = self.crystalMax
		end
		if curnum == 0 then
			endflag = 1
		end
		if curnum  ~= oldnum then
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE,curnum)
			self:SendCopyInfo(sid,0,i,curnum)
		end
	end
	if endflag == 1 then
		self:EndBattle(sid)
	end
end

function CopySceneInfo_3:GetGroupName(sid, group)
	local corpsid = s_getSceneVar(sid,0, group)
	local cname = s_getCorpsField(corpsid, CorpVar_Name)
	if cname == nil or cname == "" then
		return self.groupName[group] .. "未知团"
	end
	return self.groupName[group] .. cname .. "团"
end

--副本创建初始化
function CopySceneInfo_3:InitCopyScene(sid)
	local redCorps = s_getSceneVar(sid,0,CpBattle_RedID)
	if redCorps == 0 then
		return
	end
	local maxlevel = s_getCorpsVar(redCorps, 2, 10)
	for i=1,2 do
		local group = i+16
		local mine = self.mineInfo[i]
		local npcid = s_sysSummon(mine.npc, sid, mine.x, mine.y)
		if npcid > 0 then
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE_ALL,self.crystalMax)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE,self.crystalInit)
			self:SetGroupVar(sid,i,CpGroup_Mine,npcid)
		else
			s_debug("团战副本水晶矿初始失败:%u,%u", redCorps, mine.npc)
			return
		end
		local npclist = s_getNpcByBaseID(sid,mine.car)
		if npclist ~= nil and #npclist ~= 0 then
			s_addGroup(SCENE_ENTRY_NPC,npclist[1],group)
			self:SetGroupVar(sid,i,CpGroup_Car,npclist[1])
			if maxlevel == 1 then
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],105,2000,10)
			elseif maxlevel == 2 then
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],105,2500,10)
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],104,2500,10)
			elseif maxlevel == 3 then
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],105,6800,10)
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],104,5000,10)
			elseif maxlevel == 4 then
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],105,7600,10)
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],104,7500,10)
			elseif maxlevel == 5 then
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],105,12400,10)
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],104,10000,10)
			elseif maxlevel == 6 then
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],105,12600,10)
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],104,12500,10)
			elseif maxlevel == 7 then
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],105,25200,10)
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],104,15000,10)
			elseif maxlevel == 8 then
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],105,26800,10)
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],104,20000,10)
			elseif maxlevel == 9 then
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],105,36800,10)
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],104,25000,10)
			elseif maxlevel == 10 then
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],105,38800,10)
				s_addbuff(SCENE_ENTRY_NPC,npclist[1],104,30000,10)
			end
		else
			s_debug("团战副本采矿机械人初始失败:" .. redCorps .. "," .. mine.car)
			return
		end
	end
	local buffnpc = s_sysSummon(45150,sid,127,116)
	if buffnpc == 0 then
		s_debug("团战副本神秘装置初始失败:" .. redCorps)
		return
	end

	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local timeflag = curtime+math.random(0,10000)
	s_setSceneVar(sid,0,CpBattle_AddTime,curtime+90)
	s_setSceneVar(sid,0,CpBattle_State,1) -- 运行状态
	s_setSceneVar(sid,0,CpBattle_TimeFlag, timeflag) -- 战场标志
	s_setSceneVar(sid,0,CpBattle_OneMin, curtime+60)
	s_setSceneVar(sid,0,CpBattle_Time, curtime)
	s_debug("团战战场初始成功1-:%u,2-:%u",redCorps,timeflag)
end

--出阵NPC初始化
function CopySceneInfo_3:OnLinePackNpcInit(sid)
	local redCorps = self:GetGroupVar(sid,1,CpGroup_ID)
	local blueCorps = self:GetGroupVar(sid,2,CpGroup_ID)
	-- 清除出阵NPC包裹
	s_clearCorpLinePack(redCorps)
	s_clearCorpLinePack(blueCorps)
	-- 召唤红方出阵NPC
	for i=0,71 do
		local itemid = s_getCorpsVar(redCorps,9,i)
		if itemid ~= 0 and itemid ~= nil then
			local npcid = s_sysSummon(itemid, sid, self.redLineNpcPos[i+1].x, self.redLineNpcPos[i+1].y)
			if npcid ~= nil and npcid ~= 0 then
				if itemid == 55295 then
					s_addGroup(SCENE_ENTRY_NPC, npcid, 18)
				else
					s_addGroup(SCENE_ENTRY_NPC, npcid, 17)
				end
				s_addbuff(SCENE_ENTRY_NPC,npcid,20311,1,3600)
			end
		end
		s_addCorpsVar(redCorps,9,i,0)
		itemid = s_getCorpsVar(blueCorps,9,i)
		if itemid ~= 0 and itemid ~= nil then
			local npcid = s_sysSummon(itemid, sid, self.blueLineNpcPos[i+1].x, self.blueLineNpcPos[i+1].y)
			if npcid ~= nil and npcid ~= 0 then
				if itemid == 55295 then
					s_addGroup(SCENE_ENTRY_NPC, npcid, 17)
				else
					s_addGroup(SCENE_ENTRY_NPC, npcid, 18)
				end
				s_addbuff(SCENE_ENTRY_NPC,npcid,20312,1,3600)
			end
		end
		s_addCorpsVar(blueCorps,9,i,0)
	end
	s_addCorpsVar(redCorps,10,1,0)
	for i=55288,55297 do
		s_addCorpsVar(redCorps,8,i,0)
	end
	s_addCorpsVar(blueCorps,10,1,0)
	for i=55288,55297 do
		s_addCorpsVar(blueCorps,8,i,0)
	end
end

--玩家进入副本
function CopySceneInfo_3:OnPlayerIntoCopyScene(sid,uid)
	local corps = s_getCorpsId(uid)
	local state = s_getSceneVar(sid,0,CpBattle_State)
	if corps == 0 or state ~= 1 then
		s_gomap(uid,1,1,0,0,1)
		return
	end
	local redCorps = s_getSceneVar(sid,0,CpBattle_RedID)
	local gindex = 1
	if corps ~= redCorps then
		gindex = 2
	end
	s_addGroup(SCENE_ENTRY_PLAYER, uid, gindex+16)
	local userIn = s_getSceneVar(sid,0,CpBattle_UserIn)
	if userIn == 0 then
		-- 第一个进入的玩家 初始双方团数据
		local blueCorps = s_getCorpsVar(corps,2,2)	-- 蓝方
		local battype = s_getCorpsVar(corps,2,5)	-- 战场类型
		self:SetGroupVar(sid,1,CpGroup_ID,redCorps)
		self:SetGroupVar(sid,2,CpGroup_ID,blueCorps)
		s_setSceneVar(sid,0,CpBattle_BlueID,blueCorps)
		s_setSceneVar(sid,0,CpBattle_UserIn,1)
		s_setSceneVar(sid,0,CpBattle_Type,battype)
		s_debug("团战数据初始:%u,%u,%u",redCorps,blueCorps,battype)
		self:OnLinePackNpcInit(sid)
	end

	local wartime = s_getSceneVar(sid,0,CpBattle_TimeFlag)
	local lastwar = self:GetUserVar(uid,CpUser_LastWar)
	if wartime ~= lastwar then
		self:SetUserVar(uid,CpUser_LastWar,wartime)
		self:SetUserVar(uid,CpUser_Gindex,gindex)
		self:SetUserVar(uid,CpUser_CarryFlag,0)
		self:SetUserVar(uid,CpUser_Crystal,0)
		self:SetUserVar(uid,CpUser_KillUser,0)
		self:SetUserVar(uid,CpUser_KillEquip,0)
		self:SetUserVar(uid,CpUser_KillCar,0)
		self:SetUserVar(uid,CpUser_Killed,0)
		self:SetUserVar(uid,CpUser_CrystalCar, 0)
		self:SetUserVar(uid,CpUser_Time, 0)
	end
	self:SendCopyInfo(sid,uid,0,0)
	local bufowner = s_getSceneVar(sid,0,CpBattle_BuffOwner)
	if bufowner == gindex then
		local addbuf = s_getSceneVar(sid,0,CpBattle_Buff)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,addbuf,1,3600)
	end
	self:RandIntoZone(uid,self.initZone[gindex])
end

--前往指定区域
function CopySceneInfo_3:RandIntoZone(uid,zone)
	local posx = zone.x + math.random(1, zone.width)
	local posy = zone.y + math.random(1, zone.height)
	s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
end

function CopySceneInfo_3:CheckNearNpc(etype,eid,npcid,maxdis)
	local x = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
	local myx = s_getValue(etype,eid,VALUE_TYPE_POSX)
	local myy = s_getValue(etype,eid,VALUE_TYPE_POSY)
	if math.abs(x-myx) > maxdis or math.abs(y-myy) > maxdis then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function CopySceneInfo_3:CheckReadState(uid,npcid)
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
	if self:CheckNearNpc(SCENE_ENTRY_PLAYER,uid,npcid,self.maxDistance) == VALUE_FAIL then
		s_sysInfo(uid,"请再靠近一些",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	return VALUE_OK
end

--采矿
function CopySceneInfo_3:ToDrift(uid,npcid,gindex)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if sid == 0 or stype ~= CopySceneType_CorpsBattle then
		return
	end
	local gi = self:GetUserVar(uid,CpUser_Gindex)
	if gi == gindex then
		return
	end
	local lostnpc = self:GetGroupVar(sid,gindex,CpGroup_LostNpc)
	local readFlag = self:GetGroupVar(sid,gindex,CpGroup_MineFlag)
	if readFlag + 3 > s_getCurTime(TIME_ALLSECONDS) then
		s_sysInfo(uid,"已经有人在采矿",ChatPos_Sys + ChatPos_Important)
		return
	end
	local crystalNum = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE)
	if crystalNum == 0 then
		s_sysInfo(uid,"已经被采完了，不可再采",ChatPos_Sys + ChatPos_Important)
		return
	end
	if lostnpc ~= 0 then
		s_sysInfo(uid,"该方已有一块水晶被搬出",ChatPos_Sys + ChatPos_Important)
		return
	end
	local mycar = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ARMY_EQUIP_ID)
	if mycar > 0 then
		local cartype = s_getValue(SCENE_ENTRY_NPC,mycar,VALUE_TYPE_ARMY_EQUIP_TYPE)
		if cartype ~= 41 then --非矿车
			mycar = 0
		end
	end
	if mycar == 0 then	-- 人力采矿
		if self:CheckReadState(uid,npcid) == VALUE_FAIL then
			return
	end
	local carryUser = self:GetGroupVar(sid,gi,CpGroup_CarryUser)
	if carryUser > 0 then
		s_sysInfo(uid,"本方已经有人在搬运,不可采矿",ChatPos_Sys + ChatPos_Important)
		return
	end
	--		local carCrystal = self:GetGroupVar(sid,gi,CpGroup_CarCrystal)
	--		if carCrystal > 0 then
	--			s_sysInfo(uid,"本方矿车正在在搬运,不可采矿",ChatPos_Sys + ChatPos_Important)
	--			return
	--		end
	local buflev = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,self.carryBuff)
	if buflev > 0 then
		s_sysInfo(uid,"已处于搬运状态,不可采矿",ChatPos_Sys + ChatPos_Important)
		return
	end
	else	-- 矿车采矿
		--		local carryUser = self:GetGroupVar(sid,gi,CpGroup_CarryUser)
		--		if carryUser > 0 then
		--			s_sysInfo(uid,"本方已经有人在搬运,不可采矿",ChatPos_Sys + ChatPos_Important)
		--			return
		--		end
		if self:CheckNearNpc(SCENE_ENTRY_PLAYER,uid,npcid,self.maxDistance) == VALUE_FAIL then
			s_sysInfo(uid,"请再靠近一些",ChatPos_Sys + ChatPos_Important)
			return
	end
	local buflev = s_getbufflevel(SCENE_ENTRY_NPC,mycar,self.carryBuff)
	if buflev > 0 then
		s_sysInfo(uid,"已处于搬运状态,不可采矿",ChatPos_Sys + ChatPos_Important)
		return
	end
	end
	self:SetGroupVar(sid,gindex,CpGroup_MineFlag,s_getCurTime(TIME_ALLSECONDS))
	local callback = "CopySceneInfo_3:DoDrift($1,$2," .. npcid .. "," .. gindex .. ")"
	s_showbar(uid,3000,callback,UninterruptActionType_TASK,1,0,1)
end
function CopySceneInfo_3:DoDrift(uid,tbreak,npcid,gindex)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	if sid == 0 then return end

	if tbreak == nil then tbreak = 0 end
	if tbreak == 1 then
		self:SetGroupVar(sid,gindex,CpGroup_MineFlag,0)
		return
	end
	local gi = self:GetUserVar(uid,CpUser_Gindex)
	local crystalNum = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE)
	if crystalNum == 0 then
		s_sysInfo(uid,"已经被采完了",ChatPos_Sys + ChatPos_Important)
		return
	end
	local mycar = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ARMY_EQUIP_ID)
	if mycar > 0 then
		local cartype = s_getValue(SCENE_ENTRY_NPC,mycar,VALUE_TYPE_ARMY_EQUIP_TYPE)
		if cartype ~= 41 then --非矿车
			mycar = 0
		end
	end
	if mycar == 0 then	-- 人力采矿
		local carryUser = self:GetGroupVar(sid,gi,CpGroup_CarryUser)
		if carryUser > 0 then
			s_sysInfo(uid,"本方已经有人在搬运,采矿失败",ChatPos_Sys + ChatPos_Important)
			return
		end
		crystalNum = crystalNum - 1
		s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_WEAPON_ID,self.mineInfo[gindex].lost)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,self.carryBuff,1,3600)
		self:SetGroupVar(sid,gi,CpGroup_CarryUser,uid)
		self:SetUserVar(uid,CpUser_CarryFlag,gindex)
		local uname = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_NAME)
		s_copyInfo(sid, self:GetGroupName(sid, gi) .. "的" .. uname .."为己方采到1块水晶，正在搬运途中",ChatPos_Sys + ChatPos_Important);
	else
		local getNum = 3
		if crystalNum > 3 then
			crystalNum = crystalNum - 3
		else
			crystalNum = 0
			getNum = crystalNum
		end
		s_setValue(SCENE_ENTRY_NPC,mycar,VALUE_TYPE_WEAPON_ID,self.mineInfo[gindex].lost)
		s_addbuff(SCENE_ENTRY_NPC,mycar,self.carryBuff,1,3600)
		self:SetGroupVar(sid,gi,CpGroup_CarCrystal,getNum)
		self:SetUserVar(uid,CpUser_CarryFlag,gindex)
		s_copyInfo(sid, self:GetGroupName(sid, gi) .. "采矿机械人成功采到" .. getNum .."块水晶，正在搬运途中",ChatPos_Sys + ChatPos_Important);
	end
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE,crystalNum)
	self:SendCopyInfo(sid,0,gindex,crystalNum)
end

--读取地上水晶
function CopySceneInfo_3:ToGetLost(uid,npcid,gindex)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if sid == 0 or stype ~= CopySceneType_CorpsBattle then

		local corps = s_getCorpsId(uid)return
	end
	local gi = self:GetUserVar(uid,CpUser_Gindex)
	local readFlag = self:GetGroupVar(sid,gindex,CpGroup_LostNpcFlag)
	if readFlag == 1 then
		s_sysInfo(uid,"已经有人在拾取这块水晶",ChatPos_Sys + ChatPos_Important)
		return
	end
	if self:CheckReadState(uid,npcid) == VALUE_FAIL then
		return
	end
	local carryUser = self:GetGroupVar(sid,gi,CpGroup_CarryUser)
	if carryUser > 0 then
		s_sysInfo(uid,"本方已经有人在搬运,不可采矿",ChatPos_Sys + ChatPos_Important)
		return
	end
	local buflev = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,self.carryBuff)
	if buflev > 0 then
		s_sysInfo(uid,"已处于搬运状态,不可采矿",ChatPos_Sys + ChatPos_Important)
		return
	end
	self:SetGroupVar(sid,gindex,CpGroup_LostNpcFlag,1)
	local callback = "CopySceneInfo_3:DoGetLost($1,$2," .. npcid .. "," .. gindex .. ")"
	s_showbar(uid,3000,callback,UninterruptActionType_TASK,1,0,1)
end
function CopySceneInfo_3:DoGetLost(uid,tbreak,npcid,gindex)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	if sid == 0 then
		return
	end
	if tbreak == nil then
		tbreak = 0
	end
	self:SetGroupVar(sid,gindex,CpGroup_LostNpcFlag,0)
	if tbreak == 1 then  -- 被打断
		return
	end
	local gi = self:GetUserVar(uid,CpUser_Gindex)
	local carryUser = self:GetGroupVar(sid,gi,CpGroup_CarryUser)
	if carryUser > 0 then
		s_sysInfo(uid,"本方已经有人在搬运,拾取失败",ChatPos_Sys + ChatPos_Important)
		return
	end
	s_killnpc(npcid,1)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_WEAPON_ID,self.mineInfo[gindex].lost)
	s_addbuff(SCENE_ENTRY_PLAYER,uid,self.carryBuff,1,3600)
	self:SetGroupVar(sid,gi,CpGroup_CarryUser,uid)
	self:SetUserVar(uid,CpUser_CarryFlag,gindex)

	self:SetGroupVar(sid,gindex,CpGroup_LostTime,0)
	self:SetGroupVar(sid,gindex,CpGroup_LostNpc,0)
	local uname = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_NAME)
	s_copyInfo(sid, self:GetGroupName(sid, gi) .. "的" ..uname .."为己方拾取1块水晶，正在搬运途中",ChatPos_Sys + ChatPos_Important);
end

--争夺BUFF
function CopySceneInfo_3:OnReadBufNpc(uid,npcid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if sid == 0 or stype ~= CopySceneType_CorpsBattle then
		return
	end
	local bufowner = s_getSceneVar(sid,0,CpBattle_BuffOwner)
	local gi = self:GetUserVar(uid,CpUser_Gindex)
	if bufowner == gi then
		return
	end
	if self:CheckReadState(uid,npcid) == VALUE_FAIL then
		return
	end
	local carry = self:GetUserVar(uid,CpUser_CarryFlag)
	if carry ~= 0 then
		s_sysInfo(uid,"搬运水晶途中，不可夺取")
		return
	end
	local readFlag = s_getSceneVar(sid,0,CpBattle_BuffFlag)
	if readFlag == 1 then
		s_sysInfo(uid,"已经有人抢先一步开始夺取",ChatPos_Sys + ChatPos_Important)
		return
	end
	s_setSceneVar(sid,0,CpBattle_BuffFlag,1)
	local callback = "CopySceneInfo_3:DoGetBufNpc($1,$2," .. sid .. "," .. bufowner .. ")"
	s_showbar(uid,3000,callback,UninterruptActionType_TASK,1,0,1)
end
function CopySceneInfo_3:DoGetBufNpc(uid,tbreak,sid,owner)
	if tbreak == nil then
		tbreak = 0
	end
	s_setSceneVar(sid,0,CpBattle_BuffFlag,0)
	if tbreak == 1 then
		return
	end
	local oldbuf = s_getSceneVar(sid,0,CpBattle_Buff)
	local gi = self:GetUserVar(uid,CpUser_Gindex)
	local buf = CopySceneInfo_1:SelectByPercent(self.buffInfo, 100)
	s_setSceneVar(sid,0,CpBattle_Buff,buf)
	s_setSceneVar(sid,0,CpBattle_BuffOwner,gi)

	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		local userid = list[i+1]
		local mygi = self:GetUserVar(userid,CpUser_Gindex)
		if mygi == owner then
			s_removebuff(SCENE_ENTRY_PLAYER,userid,oldbuf)
		elseif mygi == gi then
			s_addbuff(SCENE_ENTRY_PLAYER,userid,buf,1,3600)
		end
	end
	local uname = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_NAME)
	s_copyInfo(sid, self:GetGroupName(sid, gi) .. "的" .. uname .. "为己方成功占领神秘装置",ChatPos_Sys + ChatPos_Important)
	self:SendCopyInfo(sid,0,0,0)
end

--玩家离开副本
function CopySceneInfo_3:OnPlayerLeaveCopyScene(sid,uid)
	CopySceneInfo_3:UserLostCrystal(sid,uid)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,23)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,24)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,25)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,self.carryBuff)
end

--玩家死亡
function CopySceneInfo_3:OnPlayerDie(sid,uid,murder,dtype)
	self:UserLostCrystal(sid,uid)
	local killed = self:GetUserVar(uid,CpUser_Killed)
	killed = killed + 1
	self:SetUserVar(uid,CpUser_Killed,killed)
	--战绩处理
	if murder == nil or #murder == 0 then
		return
	end
	for i=1,#murder do
		local killnum = self:GetUserVar(murder[i],CpUser_KillUser)
		killnum = killnum + 1
		self:SetUserVar(murder[i],CpUser_KillUser,killnum)
		s_debug("----------------:KillUser:" .. murder[i] .. "," .. killnum)
	end
end

--团魔甲死亡
function CopySceneInfo_3:ArmyEquipDie(sid,thisid)
	local murder = GetMurderList(SCENE_ENTRY_NPC,thisid)
	if murder == nil or #murder == 0 then
		return
	end
	for i=1,#murder do
		local killnum = self:GetUserVar(murder[i],CpUser_KillEquip)
		killnum = killnum + 1
		self:SetUserVar(murder[i],CpUser_KillEquip,killnum)
		s_debug("----------------:KillEquip:" .. murder[i] .. "," .. killnum)
	end
end

--回收团魔甲
function CopySceneInfo_3:RecycleArmyEquip(sid,corps)
	s_recycleArmyEquip(sid,corps)
end

--设置水晶位置
function CopySceneInfo_3:SetCrystalPos(sid,which,x,y)
	if which == 1 then
		s_setSceneVar(sid,0,11,x)
		s_setSceneVar(sid,0,12,y)
	end
	if which == 2 then
		s_setSceneVar(sid,0,13,x)
		s_setSceneVar(sid,0,14,y)
	end
end

--玩家水晶掉落
function CopySceneInfo_3:UserLostCrystal(sid,uid)
	local gi = self:GetUserVar(uid,CpUser_Gindex)
	gindex = self:GetUserVar(uid,CpUser_CarryFlag)
	if gindex > 0 then
		s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_WEAPON_ID,0)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,self.carryBuff)
		local state = s_getSceneVar(sid,0,CpBattle_State)
		if state == 1 then
			self:SetGroupVar(sid,gi,CpGroup_CarryUser,0)
			self:SetUserVar(uid,CpUser_CarryFlag,0)
			local x = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
			local y = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
			local lostnpc = s_sysSummon(self.mineInfo[gindex].lost, sid,x,y,0,1)
			s_copyInfo(sid, self:GetGroupName(sid, gindex) .. "的1块水晶掉落在地,90秒后自动归还",ChatPos_Sys + ChatPos_Important);
			local curtime = s_getCurTime(TIME_ALLSECONDS)
			self:SetGroupVar(sid,gindex,CpGroup_LostNpc,lostnpc)
			self:SetGroupVar(sid,gindex,CpGroup_LostTime,curtime+90)
		end
	end
end

--矿车水晶掉落
function CopySceneInfo_3:CarLostCrystal(sid,thisid,gindex)
	local carCrystal = self:GetGroupVar(sid,gindex,CpGroup_CarCrystal)
	local eindex = (gindex == 1) and 2 or 1
	if carCrystal > 0 then
		local npcid = self:GetGroupVar(sid,eindex,CpGroup_Mine)
		local curnum = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE)
		curnum = curnum + carCrystal
		self:SetGroupVar(sid,gindex,CpGroup_CarCrystal,0)
		if curnum >= self.crystalMax then
			curnum = self.crystalMax
		end
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE,curnum)
	end
	s_setValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_WEAPON_ID,0)
	s_removebuff(SCENE_ENTRY_NPC,thisid,self.carryBuff)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	self:SetGroupVar(sid, gindex, CpGroup_ReliveTime, curtime + self.carInterval)
	self:SendCopyInfo(sid,0, gindex+4, self.carInterval)
	local murder = GetMurderList(SCENE_ENTRY_NPC,thisid)
	local iname = s_getCorpsField(s_getSceneVar(sid,0, gindex), CorpVar_Name)
	local ename = s_getCorpsField(s_getSceneVar(sid,0, eindex), CorpVar_Name)
	if #murder == 1 then
		local uname = s_getValue(SCENE_ENTRY_PLAYER, murder[1], VALUE_TYPE_NAME)
		s_copyInfo(sid, iname .. "团的采矿机器人被" .. ename .. "团的" ..uname .."击毁，180秒后重生")
	else
		s_copyInfo(sid, iname .. "团的采矿机器人被" .. ename .. "团击毁，180秒后重生")
	end
	if murder == nil or #murder == 0 then
		return
	end
	for i=1,#murder do
		local killnum = self:GetUserVar(murder[i],CpUser_KillCar)
		killnum = killnum + 1
		self:SetUserVar(murder[i],CpUser_KillCar,killnum)
		s_debug("----------------:KillCar:" .. murder[i] .. "," .. killnum)
	end
end

--玩家复活
function CopySceneInfo_3:OnPlayerRelive(uid, rtype)
	local gindex = self:GetUserVar(uid,CpUser_Gindex)
	if gindex == 0 then
		return
	end
	self:RandIntoZone(uid, self.reliveZone[gindex])
end

--团勋章奖励
function CopySceneInfo_3:GetOffer(uid, point)
	if point < 10 then
		return 0
	elseif point < 20 then
		return 4
	elseif point < 50 then
		return 7
	elseif point < 100 then
		return 10
	else
		return 14
	end
end

--战斗结束
function CopySceneInfo_3:EndBattle(sid)
	s_setSceneVar(sid,0,CpBattle_State,2)
	s_setSceneVar(sid,0,CpBattle_EndTime,0)
	s_setSceneVar(sid,0,CpBattle_Final,1)

	--积分奖励计算 5秒后踢出副本
	local npcid = self:GetGroupVar(sid,1,CpGroup_Mine)
	local redNum = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE)
	npcid = self:GetGroupVar(sid,2,CpGroup_Mine)
	local blueNum = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE)
	local result = {2,2}
	local redCorps = s_getSceneVar(sid,0,CpBattle_RedID)
	local blueCorps = s_getSceneVar(sid,0,CpBattle_BlueID)
	s_addCorpsVar(redCorps,2,1,0)
	s_addCorpsVar(blueCorps,2,1,0)
	s_addCorpsVar(redCorps,2,2,0)
	s_addCorpsVar(blueCorps,2,2,0)

	-- 清除团报名
	if battype == 1 then
		s_addCorpsVar(redCorps,2,3,0)
		s_addCorpsVar(blueCorps,2,3,0)
	end

	--回收团魔甲
	self:RecycleArmyEquip(sid,redCorps)
	self:RecycleArmyEquip(sid,blueCorps)

	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local battype = s_getSceneVar(sid,0,CpBattle_Type)
	local rcountry = s_getCorpsField(redCorps,-3)
	local rname = s_getCorpsField(redCorps,-1)
	local bcountry = s_getCorpsField(blueCorps,-3)
	local bname = s_getCorpsField(blueCorps,-1)
	local allwartime = (curtime - s_getSceneVar(sid, 0, CpBattle_Time))/60
	if allwartime < 1 then allwartime = 1 end
	if redNum == blueNum then
		s_copyInfo(sid,"本场战斗结束,双方平局",ChatPos_Sys + ChatPos_Important)
	elseif redNum > blueNum then
		result = {3,1}
		s_copyInfo(sid,"本场战斗结束,红方胜利",ChatPos_Sys + ChatPos_Important)
		if rcountry ~= nil and rname ~= nil and bcountry ~= nil and bname ~= nil then
			local msg = "恭喜"..rcountry.."的["..rname.."]团战胜了"..bcountry.."国的["..bname.."]团获得了团战优胜!"
			s_worldInfo(msg,ChatPos_Sys + ChatPos_Honor)
		end
	elseif redNum < blueNum then
		result = {1,3}
		s_copyInfo(sid,"本场战斗结束,蓝方胜利",ChatPos_Sys + ChatPos_Important)
		if rcountry ~= nil and rname ~= nil and bcountry ~= nil and bname ~= nil then
			local msg = "恭喜"..bcountry.."的["..bname.."]团战胜了"..rcountry.."国的["..rname.."]团获得了团战优胜!"
			s_worldInfo(msg,ChatPos_Sys + ChatPos_Honor)
		end
	end
	s_debug("团战结束[%u],[红:%u,%u,%u],[蓝:%u,%u,%u]",battype, redCorps, result[1],redNum, blueCorps, result[2],blueNum)
	if battype == 1 then		-- 普通团战
		-- 激战规则
		-- 赢 + K-value*(1-1/(1+10^((对方积分-己方积分)/D-value)))
		-- 输 - K-value*(1/(1+10^((对方积分-己方积分)/D-value)))
		local kValue = 30
		local dValue = 400
		local addpoint = {0,0}
		local redPoint = s_getCorpsField(redCorps,CorpVar_BattlePoint)
		local bluePoint = s_getCorpsField(blueCorps,CorpVar_BattlePoint)
		local redName = s_getCorpsField(redCorps,CorpVar_Name)
		if redName == nil or redName == "" then
			redName = "未知团"
		end
		local blueName = s_getCorpsField(blueCorps,CorpVar_Name)
		if blueName == nil or blueName == "" then
			blueName = "未知团"
		end
		local wincorps = 0
		local times = 0
		if redNum > blueNum then
			addpoint[1] = math.floor(kValue*(1-1.0/(1.0+10^((bluePoint - redPoint)/dValue))))
			addpoint[2] = math.ceil(-1.0 * kValue*(1.0/(1.0+10^((redPoint - bluePoint)/dValue))))
			s_copyInfo(sid, redName .. "团胜利加" .. addpoint[1] .. "积分,".. blueName .."团失败减" .. math.abs(addpoint[2]) .. "积分",ChatPos_Sys + ChatPos_Important)
			s_sysNews(Relation_Corps,redCorps,"与" .. blueName .. "团对战，大获全胜！")
			s_sysNews(Relation_Corps,blueCorps,"与" .. redName .. "团对战，惜败！")
			wincorps = redCorps
			s_addCorpsField(redCorps,CorpVar_BattleWins,1)
			s_addCorpsField(blueCorps,CorpVar_BattleFails,1)
		elseif redNum < blueNum then
			addpoint[1] = math.ceil(-1.0 * kValue*(1.0/(1.0+10^((bluePoint - redPoint)/dValue))))
			addpoint[2] = math.floor(kValue*(1-1.0/(1.0+10^((redPoint - bluePoint)/dValue))))
			s_copyInfo(sid, blueName .. "团胜利加" .. addpoint[2] .. "积分,".. redName .. "团失败减" .. math.abs(addpoint[1]) .. "积分",ChatPos_Sys + ChatPos_Important)
			s_sysNews(Relation_Corps,redCorps,"与" .. blueName .. "团对战，惜败！")
			s_sysNews(Relation_Corps,blueCorps,"与" .. redName .. "团对战，大获全胜！")
			wincorps = blueCorps
			s_addCorpsField(blueCorps,CorpVar_BattleWins,1)
			s_addCorpsField(redCorps,CorpVar_BattleFails,1)
		else
			s_addCorpsField(blueCorps,CorpVar_BattleDraws,1)
			s_addCorpsField(redCorps,CorpVar_BattleDraws,1)
		end
		s_corpsAchieve(redCorps, 5)
		s_corpsAchieve(blueCorps, 5)
		redPoint = redPoint + addpoint[1];
		if redPoint < 0 then redPoint = 0 end
		bluePoint = bluePoint + addpoint[2];
		if bluePoint < 0 then bluePoint = 0 end
		s_setCorpsField(redCorps,CorpVar_BattlePoint,redPoint)
		s_setCorpsField(blueCorps,CorpVar_BattlePoint,bluePoint)
		s_debug("团战积分结果[红:%u,%d,%u],[蓝:%u,%d,%u]",redCorps,addpoint[1],redPoint,blueCorps,addpoint[2],bluePoint)
		if wincorps == 0 then
			s_addCorpsField(redCorps,CorpVar_ArmyGrade,5)
			s_addCorpsField(blueCorps,CorpVar_ArmyGrade,5)
		else
			s_addCorpsField(wincorps,CorpVar_ArmyGrade,10)
		end

		local award = {{3,60},{5,100},{10,150}}
		local vlist,row,col = self:GetCopyInfoList(sid)
		local bufowner = s_getSceneVar(sid,0,CpBattle_BuffOwner)
		local buf = s_getSceneVar(sid,0,CpBattle_Buff)
		for i = 1,table.getn(vlist), 7 do
			local userid = vlist[i]
			local myresult = result[vlist[i+1]]
			local rinfo = award[myresult]
			local ulevel = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_LEVEL)
			s_addField(userid,UserVar_WeekBattleGrade,vlist[i+6])
			local mytime = self:GetUserVar(userid, CpUser_Time)
			if mytime == 0 then mytime = 1 end
			local expmod = (mytime / allwartime) * rinfo[2] + vlist[i+6]
			local myoffer = self:GetOffer(userid, vlist[i+6])

			--团战经验=(60+(团战积分-100)*0.4)*(50+0.1*人物等级^2.2)
			local addexp = math.floor((60+(expmod-100)*0.4)*(50+0.1*ulevel^2.2))
			--经验球
			local expnpclist = s_getNpcByBaseID(sid,55292)
			if #expnpclist ~= 0 then
				for j=1,#expnpclist do
					if vlist[i+1] == 1 then
						if s_getbufflevel(SCENE_ENTRY_NPC,expnpclist[j],20311) ~= 0 then
							addexp = addexp+math.floor(addexp*0.2)
						end
					elseif vlist[i+1] == 2 then
						if s_getbufflevel(SCENE_ENTRY_NPC,expnpclist[j],20312) ~= 0 then
							addexp = addexp+math.floor(addexp*0.2)
						end
					end
				end
			end
			s_refreshExp(userid,addexp*2,ExpType_Corps,3)
			if myoffer > 0 then
				--团勋章球
				local offerlist = s_getNpcByBaseID(sid,55294)
				if #offerlist ~= 0 then
					for j=1,#offerlist do
						if vlist[i+1] == 1 then
							if s_getbufflevel(SCENE_ENTRY_NPC,offerlist[1],20311) ~= 0 then
								myoffer = myoffer+math.floor(myoffer*0.2)
							end
						elseif vlist[i+1] == 2 then
							if s_getbufflevel(SCENE_ENTRY_NPC,offerlist[1],20312) ~= 0 then
								myoffer = myoffer+math.floor(myoffer*0.2)
							end
						end
					end
				end
				if redNum > blueNum and vlist[i+1] == 1 then
					s_addField(userid, UserVar_Offer, myoffer)
				elseif blueNum > redNum and vlist[i+1] == 2 then
					s_addField(userid, UserVar_Offer, myoffer)
				end
			end
			-- 战争勋章
			local medal = rinfo[1]*2
			local medallist = s_getNpcByBaseID(sid,55296)
			if #medallist ~= 0 then
				for j=1,#medallist do
					if vlist[i+1] == 1 then
						if s_getbufflevel(SCENE_ENTRY_NPC,medallist[j],20311) ~= 0 then
							medal = medal+math.floor(medal*0.2)
						end
					elseif vlist[i+1] == 2 then
						if s_getbufflevel(SCENE_ENTRY_NPC,medallist[j],20312) ~= 0 then
							medal = medal+math.floor(medal*0.2)
						end
					end
				end
			end
			s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_WAR_MEDAL, medal)
			if ulevel > 60 then
				s_sysMail(userid,"参与团战获得：羽灵*3",0,27125,3,"1-1", 0, "团战")
			end
			self:SetUserVar(userid,CpUser_LastWar,0)
			if vlist[i+1] == bufowner and buf > 0 then
				s_removebuff(SCENE_ENTRY_PLAYER,userid,buf)
			end

			self:UserLostCrystal(sid,userid)
			if s_getVar(userid,130,3) == 0 then
				s_addVar(userid,130,3,1)
				s_addVar(userid,130,100,s_getVar(userid,130,100)+1);
				s_debugUser(userid,"团活力，团战，参与度：1")
			end
			s_debug("=====团战奖励:%u,%u,%u,%u,%u",userid ,addexp ,rinfo[1], mytime, myoffer)
		end
		s_sendCopyList(2,sid,0,col,row,vlist)
	elseif battype == 2 then	-- 团占领团战
		if result[2] == 3 then	-- 蓝方挑战方 只此情况挑战胜利
			s_sendToSession(1,blueCorps,redCorps) -- 通知Session设置占领
			s_debug("团挑战成功:%u,%u",blueCorps,redCorps)
	else	-- 挑战失败
		s_sendToSession(1,redCorps,blueCorps) -- 通知Session设置占领
		s_debug("团挑战失败:%u,%u",redCorps,blueCorps)
	end
	--无奖励
	local vlist,row,col = self:GetCopyInfoList(sid)
	local bufowner = s_getSceneVar(sid,0,CpBattle_BuffOwner)
	local buf = s_getSceneVar(sid,0,CpBattle_Buff)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		local userid = list[i+1]
		local gindex = self:GetUserVar(userid,CpUser_Gindex)
		if gindex == bufowner and buf > 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,userid,buf)
		end
		self:SetUserVar(userid,CpUser_LastWar,0)
		self:UserLostCrystal(sid,userid)
	end
	s_sendCopyList(2,sid,0,col,row,vlist)
	end
end

--所有退出
function CopySceneInfo_3:kickAllUser(sid)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_resetTrafficType(list[i+1])
		s_relive(list[i],list[i+1])
		local country = s_getValue(list[i],list[i+1],VALUE_TYPE_HOMELAND)
		s_gomap(list[i+1],country,3,0,0)
	end
end

--领取奖励勋章
function CopySceneInfo_3:GetMyMedal(uid)
	local num = s_getVar(uid, 102, 3)
	local msg = "body(    战争是残酷的！奖励是丰厚的！请及时领取，过期不侯！newline()" ..
		"上次团战勋章奖励：" .. num .. "个)"
	msg = parseToTalk(msg)
	if num == 0 then
		ShowNpcMenuBottomStyle(uid,msg,"离开(3)")
	else
		ShowNpcMenuBottomStyle(uid,msg,"领取(3)","CopySceneInfo_3:DoGetMedal($1," .. num .. ")","取消(3)")
	end
end
function CopySceneInfo_3:DoGetMedal(uid,num)
	s_addItem(uid,29023,0,num,0,"1-1","团战奖励")
	s_addVar(uid, 102, 3, 0)
	s_debug("团战奖励领取:%u,%u",uid,num)
end

--申请驾驶
function CopySceneInfo_3:RequstDriverCar(uid,equipid)
	local driver = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_DRIVER)
	if driver > 0 then
		return
	end
	local baseid = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_BASE_ID)
	local gi = self:GetUserVar(uid,CpUser_Gindex)
	if baseid == self.mineInfo[gi].car then
		if self:CheckNearNpc(SCENE_ENTRY_PLAYER,uid,equipid,8) == VALUE_FAIL then
			s_sysInfo(uid,"请再靠近一点",ChatPos_Sys + ChatPos_Important)
			return
		end
		s_addDriver(uid,equipid)
	end
end

--水晶读条
function OnClickNpc_45151(uid,npcid)
	--红方矿
	CopySceneInfo_3:ToDrift(uid,npcid,1)
end
function OnClickNpc_45152(uid,npcid)
	--蓝方矿
	CopySceneInfo_3:ToDrift(uid,npcid,2)
end
function OnClickNpc_45153(uid,npcid)
	--红方水晶
	CopySceneInfo_3:ToGetLost(uid,npcid,1)
end
function OnClickNpc_45154(uid,npcid)
	--蓝方水晶
	CopySceneInfo_3:ToGetLost(uid,npcid,2)
end

--争夺BUFF
function OnClickNpc_45150(uid,npcid)
	CopySceneInfo_3:OnReadBufNpc(uid,npcid)
end


--团战回调
function CopySceneInfo_3:CorpsBattleEventCall(value1,value2,etype)
	if etype == 1 then
		CopySceneInfo_3:StartCorpsBattle(value1,value2)
	elseif etype == 2 then
		CopySceneInfo_3:EndCorpsBattle()
	end
end

--团战开始回调
function CopySceneInfo_3:StartCorpsBattle(red,blue)
	local call = "CopySceneInfo_3:OnAckIntoCopy($1,$2," .. red .. ")"
	local buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
	local msg = "团战开始，是否前往战场参战?（如果中途退场，可在战争狂人西德勒处重返战场）"
	local battype = s_getCorpsVar(red,2,5)	-- 战场类型
	if battype == 2 then
		msg = "团称号争夺开始，是否前往战场参战?（如果中途退场，可在战争狂人西德勒处重返战场）"
	end
	local list = s_getCorpsEntry(0,0,0,red)
	for i = 1,table.getn(list), 2 do
		s_registerMsgBox(list[i+1],call,buttons,msg,300)
	end
	list = s_getCorpsEntry(0,0,0,blue)
	for i = 1,table.getn(list), 2 do
		s_registerMsgBox(list[i+1],call,buttons,msg,300)
	end
end

--团战结束回调
function CopySceneInfo_3:EndCorpsBattle()
	local list = s_getSceneID(CopySceneType_CorpsBattle)
	for i = 1,table.getn(list) do
		local state = s_getSceneVar(list[i],0,CpBattle_State)
		if state == 1 then
			CopySceneInfo_3:EndBattle(list[i])
		end
	end
end

function CopySceneInfo_3:OnAckIntoCopy(uid,result,battle)
	if result == Button_Yes then
		s_resetTrafficType(uid)
		s_intoCopy(uid,CopySceneType_CorpsBattle,battle)
		s_debug("应答前往战场%u,%u",uid,battle)
	end
end


--刷新客户端副本信息
--测试 1 红当前水晶 2 蓝当前水晶  3 当前占领BUFF方 4 当前BUFF 5 我方矿车状态
function CopySceneInfo_3:SendCopyInfo(sid,uid,ckey,cvalue)
	local vlist = {}
	local size = 1
	if ckey == 0 then
		table.insert(vlist,1)
		local npcid = self:GetGroupVar(sid,1,CpGroup_Mine)
		local cvalue = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE)
		table.insert(vlist,cvalue)
		table.insert(vlist,2)
		npcid = self:GetGroupVar(sid,2,CpGroup_Mine)
		cvalue = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_DEGREE)
		table.insert(vlist,cvalue)
		table.insert(vlist,3)
		cvalue = s_getSceneVar(sid,0,CpBattle_BuffOwner)
		table.insert(vlist,cvalue)
		table.insert(vlist,4)
		cvalue = s_getSceneVar(sid,0,CpBattle_Buff)
		table.insert(vlist,cvalue)
		cvalue = 0
		local curtime = s_getCurTime(TIME_ALLSECONDS)
		local livtime = self:GetGroupVar(sid,1,CpGroup_ReliveTime)
		if livtime > curtime then
			cvalue = livtime - curtime
		end
		table.insert(vlist,5)
		table.insert(vlist,cvalue)
		value = 0
		livtime = self:GetGroupVar(sid,2,CpGroup_ReliveTime)
		if livtime > curtime then
			cvalue = livtime - curtime
		end
		table.insert(vlist,6)
		table.insert(vlist,cvalue)
		size = 6
	else
		table.insert(vlist,ckey)
		table.insert(vlist,cvalue)
	end
	s_sendCopyVar(CopySceneType_CorpsBattle,sid,uid,size,vlist)
end

--刷新客户端战绩表
function CopySceneInfo_3:GetCopyInfoList(sid)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	local vlist = {}
	local row = 0
	for i = 1,table.getn(list), 2 do
		local userid = list[i+1]
		local gindex = self:GetUserVar(userid,CpUser_Gindex)
		local crystal = self:GetUserVar(userid,CpUser_Crystal)
		local crystalCar = self:GetUserVar(userid,CpUser_CrystalCar)
		local killuser = self:GetUserVar(userid,CpUser_KillUser)
		local killed = self:GetUserVar(userid,CpUser_Killed)
		local killequip = self:GetUserVar(userid,CpUser_KillEquip)
		local killCar = self:GetUserVar(userid,CpUser_KillCar)
		local grade = math.min(60,3*crystal + 5*crystalCar) + math.min(60,killuser)
			+ math.min(30,6*killequip) + math.min(30,6*killCar)
		table.insert(vlist,userid)
		table.insert(vlist,gindex)
		table.insert(vlist,crystal+crystalCar*3)
		table.insert(vlist,killuser)
		table.insert(vlist,killed)
		table.insert(vlist,killequip+killCar)
		table.insert(vlist,grade)
		row = row + 1
	end
	return vlist,row,7
end

--客户端请求发送战绩数据
function CopySceneInfo_3:SendCopyInfoList(sid,uid,rtype)
	local vlist,row,col = self:GetCopyInfoList(sid)
	if vlist == nil or #vlist == 0 then
		return
	end
	s_sendCopyList(rtype,0,uid,col,row,vlist)
end

--注册矿车死亡处理
RegisterCopyNpcDeadEvent(44321,3,0,"CopySceneInfo_3:CarLostCrystal($1,$2,1)")
RegisterCopyNpcDeadEvent(44322,3,0,"CopySceneInfo_3:CarLostCrystal($1,$2,2)")

--注册团魔甲死亡处理
RegisterCopyNpcDeadEvent(44001,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44002,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44003,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44004,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44005,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44006,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44007,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44008,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44009,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44010,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44011,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44012,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44013,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44014,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")
RegisterCopyNpcDeadEvent(44015,3,0,"CopySceneInfo_3:ArmyEquipDie($1,$2)")

----------------------------------------------------------------------------------------------
-- GM指令
function CopySceneInfo_3:CorpsBattleGmCmd(gmtype,uid,red,blue)
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
		--[[
		local step = s_getEvent(Relation_World,0,WorldEv_CorpsBattleSign)
		if step ~= EventStep_Run then
		s_sysInfo(uid, "请调整时间到每周可以进行团战的天再执行指令",ChatPos_Sys + ChatPos_Important)
		return
		end
		step = s_getEvent(Relation_World,0,WorldEv_CorpsBattle)
		if step ~= EventStep_Run then
		local sec = s_getCurTime(TIME_CURHOURS) * 3600
		sec = sec + s_getCurTime(TIME_CURMINUTES) * 60
		sec = sec + s_getCurTime(TIME_CURSECONDS)
		s_addEvent(Relation_World,0,WorldEv_CorpsBattle,sec,1800,uid)
		end
		--]]
		s_addCorpsVar(red,2,1,red)
		s_addCorpsVar(blue,2,1,red)
		s_addCorpsVar(red,2,2,blue)
		s_addCorpsVar(blue,2,2,blue)
		s_addCorpsVar(red,2,4,blue)
		s_addCorpsVar(blue,2,4,red)
		s_addCorpsVar(red,2,5,1)
		s_addCorpsVar(blue,2,5,1)
		maxlevel = math.max(s_getCorpsField(red, CorpVar_Level), s_getCorpsField(blue, CorpVar_Level))
		s_addCorpsVar(red,2,10, maxlevel)
		s_addCorpsVar(blue,2,10, maxlevel)
		s_sysInfo(uid,"请注意，你使用GM指令开始团战，非本场景成员需从战争狂人西德勒处主动选择进入",ChatPos_Sys + ChatPos_Important)
		s_sysInfo(uid,"请注意，GM指令开战未检测撮合规则!!!",ChatPos_Sys + ChatPos_Important)
		CopySceneInfo_3:StartCorpsBattle(red,blue)
		return
	end
	if gmtype == 2 then
		local state = s_getSceneVar(sid,0,CpBattle_State)
		if stype ~= CopySceneType_CorpsBattle or state ~= 1 then
			s_sysInfo(uid,"非团战斗进行中",ChatPos_Sys + ChatPos_Important)
			return
		end
		s_sysInfo(sid,"使用GM指令结束团战斗",ChatPos_Sys + ChatPos_Important)
		CopySceneInfo_3:EndBattle(sid)
	end
	if gmtype == 3 then
		local corps = s_getCorpsId(uid)
		if corps == 0 then
			return
		end
		s_addCorpsVar(corps,2,1,0)
		s_addCorpsVar(corps,2,2,0)
		s_addCorpsVar(corps,2,6,0)
	end
end

