--执行检查列表
function RunCopyCheckList(uid, stype, customid, sid, checklist)
	if checklist == nil or type(checklist) ~= "table" or table.getn(checklist) == 0 then
		return VALUE_OK
	end

	for i = 1, table.getn(checklist), 1 do
		if checklist[i][1](uid, stype, customid, sid, checklist[i][2]) == VALUE_FAIL then
			return VALUE_FAIL
		end
	end
	return VALUE_OK
end

--执行事件表
function RunCopyActionList(uid, stype, customid, sid, actionlist)
	if actionlist == nil or type(actionlist) ~= "table" or table.getn(actionlist) == 0 then
		return
	end
	for i = 1, table.getn(actionlist), 1 do
		if actionlist[i][3] == nil then
			actionlist[i][1](uid, stype, customid, sid, actionlist[i][2])
		else
			actionlist[i][3].actionlist[i][1](actionlist[i][3], uid, stype, customid, sid, actionlist[i][2])
		end
	end
end

--执行事件
function RunCopyEvent(uid, stype, customid, sid, event)
	if event == nil then return end
	if event.action == nil then return end
	if RunCopyCheckList(uid, stype, customid, sid, event.check) == VALUE_FAIL then
		RunCopyActionList(uid, stype, customid, sid, event.actionnot)
	else
		RunCopyActionList(uid, stype, customid, sid, event.action)
	end
end

--返回副本信息
function GetCopyInfo(stype, customid, sid)
	local copy = nil
	if customid == 0 then
		copy = rawget(_G, "CopySceneInfo_" .. stype)
	else
		copy = rawget(_G, "CopySceneInfo_" .. customid)
	end
	return copy
end

--初始化副本
function InitCopyScene(stype, customid, sid)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end
	if copy.InitCopyScene_pre ~= nil then
		copy.InitCopyScene_pre(copy,sid)
	end
	RunCopyEvent(0, stype, customid, sid, copy.initcopy)
	if copy.InitCopyScene ~= nil then
		copy.InitCopyScene(copy, sid)
	end
end

--销毁副本
function FinalCopyScene(stype, customid, sid)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	RunCopyEvent(0, stype, customid, sid, copy.finalcopy)
	if copy.FinalCopyScene ~= nil then
		copy.FinalCopyScene(copy, sid)
	end
end

--召唤守卫
function RefreshNpc(typeid, stype, customid, sid, uid)
	-- body
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	RunCopyEvent(uid, stype, customid, copy.refresh)
	if copy.RefreshNpc ~= nul then
		copy.RefreshNpc(copy, typeid, sid, uid)
	end
end

--自定义副本变量改变
function OnCopySceneVarChange(stype, customid, sid, key1, key2, newvalue, oldvalue)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	local varchange = rawget(copy, "varchange_" .. key1 .. "_" .. key2 .. "_" .. newvalue)
	if varchange ~= nil then
		RunCopyEvent(0, stype, customid, sid, varchange)
	end
	if copy.OnCopySceneVarChange ~= nil then
		copy.OnCopySceneVarChange(copy, sid, key1, key2, newvalue, oldvalue)
	end
end

--进入副本
function OnPlayerIntoCopyScene(stype, customid, sid, uid)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	RunCopyEvent(uid, stype, customid, sid, copy.playerinto)
	if copy.OnPlayerIntoCopyScene ~= nil then
		copy.OnPlayerIntoCopyScene(copy, sid, uid)
	end
end

--离开副本
function OnPlayerLeaveCopyScene(stype, customid, sid, uid)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	RunCopyEvent(uid, stype, customid, sid, copy.playerleave)
	if copy.OnPlayerLeaveCopyScene~= nil then
		copy.OnPlayerLeaveCopyScene(copy,sid,uid)
	end
end

--玩家进入区域
function OnCopyScenePlayerIntoZone(stype, customid, sid, uid, zoneid)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	local playerintozone = rawget(copy, "playerintozone_" .. zoneid)
	if playerintozone ~= nil then
		RunCopyEvent(uid, stype, customid, sid, playerintozone)
	end
	if copy.OnCopyScenePlayerIntoZone ~= nil then
		copy.OnCopyScenePlayerIntoZone(copy, sid, uid, zoneid)
	end
end

--玩家离开区域
function OnCopyScenePlayerLeaveZone(stype, customid, sid, uid, zoneid)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	local playerleavezone = rawget(copy, "playerleavezone_" .. zoneid)
	if playerleavezone ~= nil then
		RunCopyEvent(uid, stype, customid, sid, playerleavezone)
	end
	if copy.OnCopyScenePlayerLeaveZone ~= nil then
		copy.OnCopyScenePlayerLeaveZone(copy, sid, uid, zoneid)
	end
end

--NPC进入区域
function OnCopySceneNpcIntoZone(stype, customid, sid, npcid, zoneid)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	local npcbaseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
	local npcintozone = rawget(copy, "npcintozone_" .. zoneid .. "_" .. npcbaseid)
	if npcintozone ~= nil then
		RunCopyEvent(0, stype, customid, sid, npcintozone)
	end
	if copy.OnCopySceneNpcIntoZone ~= nil then
		copy.OnCopySceneNpcIntoZone(copy, sid, npcid, zoneid)
	end
end

--NPC离开区域
function OnCopySceneNpcLeaveZone(stype, customid, sid, npcid, zoneid)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	local npcbaseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
	local npcleavezone = rawget(copy, "npcleavezone_" .. zoneid .. "_" .. npcbaseid)
	if npcleavezone ~= nil then
		RunCopyEvent(0, stype, customid, sid, npcleavezone)
	end
	if copy.OnCopySceneNpcLeaveZone ~= nil then
		copy.OnCopySceneNpcLeaveZone(copy, sid, npcid, zoneid)
	end
end


--设置场景定时器
function OnCopySceneTimer(stype, customid, sid, timerid)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	local timer = rawget(copy, "timer_" .. timerid)
	if timer ~= nil then
		RunCopyEvent(0, stype, customid, sid, timer)
	end
	if copy.OnCopySceneTimer ~= nil then
		copy.OnCopySceneTimer(copy, sid, timerid)
	end
end


--玩家在副本中死亡
function OnPlayerDeadInCopy(stype, customid, sid, uid, dtype)
	s_debug("玩家在副本中死亡 stype="..stype.." customid="..customid)
	local copy = GetCopyInfo(stype, customid, sid)
	if copy == nil then return end

	RunCopyEvent(uid, stype, customid, sid, copy.playerdie)
	if copy.OnPlayerDie~= nil then
		local murderlist = GetMurderList(SCENE_ENTRY_PLAYER,uid)
		copy.OnPlayerDie(copy,sid,uid,murderlist,dtype)
	end
end

--NPC在副本中死亡
function OnNpcDeadInCopy(stype,customid,sid,baseid,thisid)
	--s_debug("npc在副本中死亡 stype="..stype.." customid="..customid.."baseid="..baseid)
	if CopyNpcDeadEventTable == nil then return end
	if CopyNpcDeadEventTable[stype] == nil then return end
	if CopyNpcDeadEventTable[stype][customid] == nil then return end
	local funs = CopyNpcDeadEventTable[stype][customid][baseid]
	if funs == nil or #funs == 0 then return end

	--local mlist = GetMurderList(SCENE_ENTRY_NPC,thisid)
	for i=1,table.getn(funs) do
		local call = nil
		if type(funs[i]) == "function" then
			fun = funs[i]
		elseif type(funs[i]) == "string" then
			fun = StringToFunction(funs[i])
			if fun == nil then
				s_debug("副本死亡回调函数有问题:"..funs[i])
			end
		end
		if fun ~= nil then
			--死亡事件必须执行，可以没有murder
			fun(sid,thisid)
		end
	end
end

--注册副本中NPC死亡事件
function RegisterCopyNpcDeadEvent(baseid,ctype,customid,callback)
	if callback == nil then
		s_debug("注册NPC死亡事件的回调函数无效(".. baseid ..")")
		return
	end
	if CopyNpcDeadEventTable == nil then
		CopyNpcDeadEventTable = {}
	end
	if CopyNpcDeadEventTable[ctype] == nil then
		CopyNpcDeadEventTable[ctype] = {}
	end
	if CopyNpcDeadEventTable[ctype][customid] == nil then
		CopyNpcDeadEventTable[ctype][customid] = {}
	end
	if CopyNpcDeadEventTable[ctype][customid][baseid] == nil then
		CopyNpcDeadEventTable[ctype][customid][baseid] = {}
	end

	local find = false
	if table.getn(CopyNpcDeadEventTable[ctype][customid][baseid]) > 0 then
		for i=1, table.getn(CopyNpcDeadEventTable[ctype][customid][baseid]), 1 do
			if CopyNpcDeadEventTable[ctype][customid][baseid][i] == callback then
				find = true
				break
			end
		end
	end

	if find == false then
		table.insert(CopyNpcDeadEventTable[ctype][customid][baseid],callback)
	end
end

--获得杀我的人列表
function GetMurderList(etype,eid)
	local mtype = s_getValue(etype,eid,VALUE_TYPE_MURDER_TYPE)
	local mid = s_getValue(etype,eid,VALUE_TYPE_MURDER_ID)
	local murderlist = nil
	if mtype == SCENE_ENTRY_PLAYER then
		if mid > 0 then
			murderlist = {mid}
		end
	elseif mtype == SCENE_ENTRY_NPC then
		murderlist = s_getEquipEntry(mid)
		if murderlist == nil or #murderlist == 0 then
			local master = s_getValue(mtype,mid,VALUE_TYPE_MASTER)
			if master > 0 then
				murderlist = {master}
			end
		end
	end
	if murderlist == nil then
		murderlist = {}
	end
	return murderlist
end

--额外属性初始化
function OnCopyExtInitEvent(stype, sid)
	local copy = rawget(_G, "CopySceneInfo_" .. stype)
	if copy ~= nil and copy.CopyExtInitEvent ~= nil then
		copy.CopyExtInitEvent(copy,stype, sid)
	end
end

--//////////////////////////////////////////////////////////////////
--团养殖变量
function GetBreedVar(corps, index)
	return s_getCorpsVar(corps,101,index)
end

--TODO 以下数据接口可以考虑其他方法

--团养殖变量
function SetBreedVar(corps, index, value)
	s_addCorpsVar(corps,101,index,value)
end

--团种植变量
function GetPlantVar(corps, index)
	return s_getCorpsVar(corps,102,index)
end

--团种植变量
function SetPlantVar(corps, index, value)
	s_addCorpsVar(corps,102,index,value)
end

--团植物数据
function GetPlantInfo(corps,index,key)
	return s_getCorpsVar(corps,103,(index or 0)*20+key)
end

--团植物数据
function SetPlantInfo(corps,index,key,value)
	s_addCorpsVar(corps,103,index*20 + key, value)
end

--宠物乐园数据
function GetDemonParkInfo(corps,index,key)
	return c_getCorpsVar(corps,105,index*20+key)
end

--宠物乐园数据
function SetDemonParkInfo(corps,index,key,value)
	s_addCorpsVar(corps,105,index*20+key,value)
end

function GetWaterVar(corps,index,user)
	for i = 0, 3 do
		local v0 = s_getCorpsVar(corps,104,index*100+i*10)
		if v0 == 0 then
			return nil
		end
		if v0 == user then
			return s_getCorpsVar(corps,104,index*100+i*10+1)
		end
	end
	return nil
end

function SetWaterVar(corps,index,user,value)
	for i = 0, 3 do
		local v0 = s_getCorpsVar(corps,104,index*100+i*10)
		if v0 == 0 then
			s_addCorpsVar(corps,104,index*100+i*10,user)
			s_addCorpsVar(corps,104,index*100+i*10+1,value)
			return
		end
		if v0 == user then
			s_addCorpsVar(corps,104,index*100+i*10+1,value)
			return
		end
	end
end

function ResetWaterVar(corps,index)
	for i = 0, 3 do
		s_addCorpsVar(corps,104,index*100+i*10,0)
	end
end

function GetWaterList(corps,index)
	local list = {}
	for i = 0, 3 do
		local v0 = s_getCorpsVar(corps,104,index*100+i*10)
		if v0 == 0 then
			return list
		end
		table.insert(list, v0)
		table.insert(list, s_getCorpsVar(corps,104,index*100+i*10+1))
	end
	return list
end

function GetStealVar(corps,index,user)
	for i = 0, 19 do
		local v0 = s_getCorpsVar(corps,106,index*100+i*5)
		if v0 == 0 then
			return nil
		end
		if v0 == user then
			return s_getCorpsVar(corps,106,index*100+i*5+1)
		end
	end
	return nil
end

function SetStealVar(corps,index,user,value)
	for i = 0, 19 do
		local v0 = s_getCorpsVar(corps,106,index*100+i*5)
		if v0 == 0 then
			s_addCorpsVar(corps,106,index*100+i*5,user)
			s_addCorpsVar(corps,106,index*100+i*5+1,value)
			return
		end
		if v0 == user then
			s_addCorpsVar(corps,106,index*100+i*5+1,value)
			return
		end
	end
end

function ResetStealVar(corps,index)
	for i = 0, 19 do
		s_addCorpsVar(corps,106,index*100+i*5,0)
	end
end

function GetStealList(corps,index)
	local list = {}
	for i = 0, 19 do
		local v0 = s_getCorpsVar(corps,106,index*100+i*5)
		if v0 == 0 then
			return list
		end
		table.insert(list, v0)
		table.insert(list, s_getCorpsVar(corps,106,index*100+i*5+1))
	end
	return list
end

function GetDayPlantTimes(uid, seedType)
	-- 103 21~ 50 对应种植日期  51~80 种植次数
	local curdays = s_getCurTime(TIME_ALLDAYS)
	local lastday = s_getVar(uid, 103, 20 + seedType)
	local times = s_getVar(uid, 103, 50 + seedType)
	if curdays ~= lastday then
		s_addVar(uid, 103, 20 + seedType, curdays)
		s_addVar(uid, 103, 50 + seedType, 0)
		times = 0
	end
	return times
end

function AddDayPlantTimes(uid, seedType)
	local curdays = s_getCurTime(TIME_ALLDAYS)
	local lastday = s_getVar(uid, 103, 20 + seedType)
	local times = s_getVar(uid, 103, 50 + seedType)
	if curdays ~= lastday then
		s_addVar(uid, 103, 20 + seedType, curdays)
		times = 0
	end
	times = times + 1
	s_addVar(uid, 103, 50 + seedType, times)

	--总种植次数
	lastday = s_getVar(uid, 103, 98)
	times = s_getVar(uid, 103, 99)
	if curdays ~= lastday then
		s_addVar(uid, 103, 98, curdays)
		times = 0
	end
	times = times + 1
	s_addVar(uid, 103, 99, times)
end

