--欢乐谷

function CopySceneInfo_Demon_InitCopyScene(ctype,cid)
end

function CopySceneInfo_Demon_OnPlayerIntoCopyScene(cid,uid)
	local cur_time = s_getCurTime(TIME_ALLSECONDS)
	local last_time = s_getVar(uid,101,41)
	if math.floor(last_time/86400) ~= math.floor(cur_time/86400) then
		s_addVar(uid,101,41,cur_time)
		s_addVar(uid,101,42,0)
	end
	local last = s_getVar(uid,101,42)
	s_sysInfo(uid,"剩余时间" .. 60 * 60 - last .. "秒")
	s_addbuff(SCENE_ENTRY_PLAYER,uid,54,1,60*60-last)
end

function CopySceneInfo_Demon_OnPlayerLeaveCopyScene(cid,uid)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,54)
end

function OnLoopCopyScene_5Sec_Demon(ctype,cid)
	local time = s_getCurTime(TIME_ALLSECONDS)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		if math.floor(s_getVar(list[i+1],101,41)/86400) ~= math.floor(time /86400) then
			s_addVar(list[i+1],101,41,time)
			s_addVar(list[i+1],101,42,0)
			s_removebuff(list[i],list[i+1],54)
			s_addbuff(list[i],list[i+1],54,1,60*60)
		end
		local last = s_getVar(list[i+1],101,42)
		if last < 60*60 then
			s_addVar(list[i+1],101,42,last+5)
		else
			ReturnUserHome(list[i+1],"OnLoopCopyScene_5Sec_Demon")
		end
	end
end

------------------------------------------------------------------------------------
local DemonCopyScene = [[
    CopySceneInfo_$1 = { }
    function CopySceneInfo_$1:InitCopyScene(cid)
        CopySceneInfo_Demon_InitCopyScene($1,cid)
    end
    function CopySceneInfo_$1:OnPlayerIntoCopyScene(cid,uid)
        CopySceneInfo_Demon_OnPlayerIntoCopyScene(cid,uid)
    end
    function CopySceneInfo_$1:OnPlayerLeaveCopyScene(cid,uid)
        CopySceneInfo_Demon_OnPlayerLeaveCopyScene(cid,uid)
    end
    function OnLoopCopyScene_5Sec_$1(ctype,cid)
        OnLoopCopyScene_5Sec_Demon(ctype,cid)
    end
]]
RegistetFunction(FormatString(DemonCopyScene,70))
------------------------------------------------------------------------------------
