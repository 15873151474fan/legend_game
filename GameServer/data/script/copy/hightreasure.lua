--打宝地宫

function CopySceneInfo_HighTreasure_InitCopyScene(ctype,cid)
end

function CopySceneInfo_HighTreasure_OnPlayerIntoCopyScene(cid,uid)
	local cur_time = s_getCurTime(TIME_ALLSECONDS)
	local last_time = s_getVar(uid,101,30)
	if math.floor(last_time/86400) ~= math.floor(cur_time/86400) then
		s_addVar(uid,101,30,cur_time)
		s_addVar(uid,101,31,0)
	end
	local last = s_getVar(uid,101,31)
	s_sysInfo(uid,"剩余时间" .. 60 * 60 - last .. "秒")
	s_addbuff(SCENE_ENTRY_PLAYER,uid,54,1,60*60-last)
end

function CopySceneInfo_HighTreasure_OnPlayerLeaveCopyScene(cid,uid)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,54)
end

function OnLoopCopyScene_5Sec_HighTreasure(ctype,cid)
	local time = s_getCurTime(TIME_ALLSECONDS)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		if math.floor(s_getVar(list[i+1],101,30)/86400) ~= math.floor(time /86400) then
			s_addVar(list[i+1],101,30,time)
			s_addVar(list[i+1],101,31,0)
			s_removebuff(list[i],list[i+1],54)
			s_addbuff(list[i],list[i+1],54,1,60*60)
		end
		local last = s_getVar(list[i+1],101,31)
		if last < 60*60 then
			s_addVar(list[i+1],101,31,last+5)
		else
			RefreshTaskDailyInfo(list[i+1], 30035)
			ReturnUserHome(list[i+1],"OnLoopCopyScene_5Sec_HighTreasure")
		end
	end
end

------------------------------------------------------------------------------------
local HighTreasureCopyScene = [[
    CopySceneInfo_$1 = { }
    function CopySceneInfo_$1:InitCopyScene(cid)
        CopySceneInfo_HighTreasure_InitCopyScene($1,cid)
    end
    function CopySceneInfo_$1:OnPlayerIntoCopyScene(cid,uid)
        CopySceneInfo_HighTreasure_OnPlayerIntoCopyScene(cid,uid)
    end
    function CopySceneInfo_$1:OnPlayerLeaveCopyScene(cid,uid)
        CopySceneInfo_HighTreasure_OnPlayerLeaveCopyScene(cid,uid)
    end
    function OnLoopCopyScene_5Sec_$1(ctype,cid)
        OnLoopCopyScene_5Sec_HighTreasure(ctype,cid)
    end
]]
for i = 50,51 do
	RegistetFunction(FormatString(HighTreasureCopyScene,i))
end
------------------------------------------------------------------------------------
