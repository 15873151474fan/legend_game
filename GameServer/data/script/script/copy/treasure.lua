--打宝地宫

function CopySceneInfo_Treasure_InitCopyScene(ctype,cid)
end

function CopySceneInfo_Treasure_OnPlayerIntoCopyScene(cid,uid)
	local cur_time = s_getCurTime(TIME_ALLSECONDS)
	local last_time = s_getVar(uid,101,9)
	if math.floor(last_time/86400) ~= math.floor(cur_time/86400) then
		s_addVar(uid,101,9,cur_time)
		s_addVar(uid,101,10,0)
	end
	local last = s_getVar(uid,101,10)
	s_sysInfo(uid,"剩余时间" .. 60 * 60 - last .. "秒")
	s_addbuff(SCENE_ENTRY_PLAYER,uid,54,1,60*60-last)
end

function CopySceneInfo_Treasure_OnPlayerLeaveCopyScene(cid,uid)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,54)
end

function OnLoopCopyScene_5Sec_Treasure(ctype,cid)
	local time = s_getCurTime(TIME_ALLSECONDS)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		if math.floor(s_getVar(list[i+1],101,9)/86400) ~= math.floor(time /86400) then
			s_addVar(list[i+1],101,9,time)
			s_addVar(list[i+1],101,10,0)
			s_removebuff(list[i],list[i+1],54)
			s_addbuff(list[i],list[i+1],54,1,60*60)
		end
		local last = s_getVar(list[i+1],101,10)
		if last < 60*60 then
			s_addVar(list[i+1],101,10,last+5)
		else
			--活力点
			s_addVigorPoint(list[i+1], 10)
			s_debugUser(list[i+1],"完成探险者地宫，获得10点活力点")
			RefreshTaskDailyInfo(list[i+1], 30035)
			ReturnUserHome(list[i+1],"OnLoopCopyScene_5Sec_Treasure")
		end
	end
end

function CopySceneInfo_Treasure_OnNpcDead22701_22708(uid)
	if math.random(1,10000) > 30 then return end
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if ctype >= 20 and ctype <= 27 then
		s_summon(SCENE_ENTRY_PLAYER,uid,22711)
	end
end
function CopySceneInfo_Treasure_OnNpcDead22709_22719(uid)
	if math.random(1,10000) > 30 then return end
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if ctype >= 20 and ctype <= 27 then
		s_summon(SCENE_ENTRY_PLAYER,uid,22712)
	end
end
function CopySceneInfo_Treasure_OnNpcDead22725_22734(uid)
	if math.random(1,10000) > 30 then return end
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if (ctype >= 20 and ctype <= 27) or (ctype >= 80 and ctype <= 84) then
		s_summon(SCENE_ENTRY_PLAYER,uid,22713)
	end
end

-- RegisterMyNpcDeadEvent(22701,"CopySceneInfo_Treasure_OnNpcDead22701_22708($1)")
-- RegisterMyNpcDeadEvent(22702,"CopySceneInfo_Treasure_OnNpcDead22701_22708($1)")
-- RegisterMyNpcDeadEvent(22703,"CopySceneInfo_Treasure_OnNpcDead22701_22708($1)")
-- RegisterMyNpcDeadEvent(22704,"CopySceneInfo_Treasure_OnNpcDead22701_22708($1)")
-- RegisterMyNpcDeadEvent(22705,"CopySceneInfo_Treasure_OnNpcDead22701_22708($1)")
-- RegisterMyNpcDeadEvent(22706,"CopySceneInfo_Treasure_OnNpcDead22701_22708($1)")
-- RegisterMyNpcDeadEvent(22707,"CopySceneInfo_Treasure_OnNpcDead22701_22708($1)")
-- RegisterMyNpcDeadEvent(22708,"CopySceneInfo_Treasure_OnNpcDead22701_22708($1)")

-- RegisterMyNpcDeadEvent(22709,"CopySceneInfo_Treasure_OnNpcDead22709_22719($1)")
-- RegisterMyNpcDeadEvent(22710,"CopySceneInfo_Treasure_OnNpcDead22709_22719($1)")
-- RegisterMyNpcDeadEvent(22714,"CopySceneInfo_Treasure_OnNpcDead22709_22719($1)")
-- RegisterMyNpcDeadEvent(22715,"CopySceneInfo_Treasure_OnNpcDead22709_22719($1)")
-- RegisterMyNpcDeadEvent(22716,"CopySceneInfo_Treasure_OnNpcDead22709_22719($1)")
-- RegisterMyNpcDeadEvent(22717,"CopySceneInfo_Treasure_OnNpcDead22709_22719($1)")
-- RegisterMyNpcDeadEvent(22718,"CopySceneInfo_Treasure_OnNpcDead22709_22719($1)")
-- RegisterMyNpcDeadEvent(22719,"CopySceneInfo_Treasure_OnNpcDead22709_22719($1)")

-- RegisterMyNpcDeadEvent(22725,"CopySceneInfo_Treasure_OnNpcDead22725_22734($1)")
-- RegisterMyNpcDeadEvent(22726,"CopySceneInfo_Treasure_OnNpcDead22725_22734($1)")
-- RegisterMyNpcDeadEvent(22727,"CopySceneInfo_Treasure_OnNpcDead22725_22734($1)")
-- RegisterMyNpcDeadEvent(22728,"CopySceneInfo_Treasure_OnNpcDead22725_22734($1)")
-- RegisterMyNpcDeadEvent(22729,"CopySceneInfo_Treasure_OnNpcDead22725_22734($1)")
-- RegisterMyNpcDeadEvent(22730,"CopySceneInfo_Treasure_OnNpcDead22725_22734($1)")
-- RegisterMyNpcDeadEvent(22731,"CopySceneInfo_Treasure_OnNpcDead22725_22734($1)")
-- RegisterMyNpcDeadEvent(22732,"CopySceneInfo_Treasure_OnNpcDead22725_22734($1)")
-- RegisterMyNpcDeadEvent(22733,"CopySceneInfo_Treasure_OnNpcDead22725_22734($1)")
-- RegisterMyNpcDeadEvent(22734,"CopySceneInfo_Treasure_OnNpcDead22725_22734($1)")
------------------------------------------------------------------------------------
local TreasureCopyScene = [[
    CopySceneInfo_$1 = { }
    function CopySceneInfo_$1:InitCopyScene(cid)
        CopySceneInfo_Treasure_InitCopyScene($1,cid)
    end
    function CopySceneInfo_$1:OnPlayerIntoCopyScene(cid,uid)
        CopySceneInfo_Treasure_OnPlayerIntoCopyScene(cid,uid)
    end
    function CopySceneInfo_$1:OnPlayerLeaveCopyScene(cid,uid)
        CopySceneInfo_Treasure_OnPlayerLeaveCopyScene(cid,uid)
    end
    function OnLoopCopyScene_5Sec_$1(ctype,cid)
        OnLoopCopyScene_5Sec_Treasure(ctype,cid)
    end
]]
for i = 20,27 do
	RegistetFunction(FormatString(TreasureCopyScene,i))
end
for i = 80,84 do
	RegistetFunction(FormatString(TreasureCopyScene,i))
end
------------------------------------------------------------------------------------
