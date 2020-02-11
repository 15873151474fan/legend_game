--无双擂台赛
-- 进入副本后区分阵营模式 17-阵营A(红方-场景属主) 18-阵营B(蓝方)

--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
--0_101 开始时间
--0_102 红方队伍
--0_103 蓝方队伍
--0_104 红方队长
--0_105 蓝方队长
--0_106 红方杀人数
--0_107 蓝方杀人数
--0_108 已经结束

--角色数据
TCUser_Gindex           = 1     -- 阵营索引
TCUser_IntoTime			= 2		-- 进入时间
TCUser_DieTime			= 3		-- 死亡时间
TCUser_LifeNum			= 4		-- 人命数量

--用户变量
function CopySceneInfo_TeamChallenge_GetUserVar(uid,key)
	return s_getVar(uid,104,key)
end
function CopySceneInfo_TeamChallenge_SetUserVar(uid,key,value)
	s_addVar(uid,104,key,value)
end

--刷新客户端副本信息
--1红方战队ID，2红方队长，3红队长生命，4红队队员1，5红队队员生命1，6红队队员2，7红队队员生命2
--8蓝方战队ID，9蓝方队长，10蓝方队长生命，11蓝队队员1，12蓝队队员生命1，13蓝队队员2，14蓝队队员生命2
function CopySceneInfo_TeamChallenge_SendCopyInfo(cid,uid,ckey,cvalue)
	local vlist = {}
	local size = 1
	local ctype = 0
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		ctype = s_getValue(list[i],list[i+1],VALUE_TYPE_SCENE_TYPE)
	end
	if ckey == 0 then
		table.insert(vlist, 1)
		table.insert(vlist, s_getSceneVar(cid,0,102))
		table.insert(vlist, 2)
		table.insert(vlist, s_getSceneVar(cid,0,104))
		table.insert(vlist, 3)
		if  CopySceneInfo_TeamChallenge_GetUserVar(s_getSceneVar(cid,0,104),TCUser_LifeNum) == nil then
			table.insert(vlist, 0)
		else
			local value = CopySceneInfo_TeamChallenge_GetUserVar(s_getSceneVar(cid,0,104),TCUser_LifeNum)
			table.insert(vlist, value)
		end
		local i = 4
		table.insert(vlist,i)
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for j = 1,table.getn(list), 2 do
			if s_getFightTeamID(list[j+1]) == s_getSceneVar(cid,0,102) and list[j+1] ~= s_getSceneVar(cid,0,104) then
				table.insert(vlist, list[j+1])
				i = i+1
				table.insert(vlist, i)
				local value = CopySceneInfo_TeamChallenge_GetUserVar(list[j+1],TCUser_LifeNum)
				table.insert(vlist, value)
				i = i+1
				table.insert(vlist, i)
			end
		end
		for j=i, 7 do
			table.insert(vlist,0)
			i = i+1
			table.insert(vlist,i)
		end
		table.insert(vlist, s_getSceneVar(cid,0,103))
		i = i+1
		table.insert(vlist,i)
		table.insert(vlist, s_getSceneVar(cid,0,105))
		i = i+1
		table.insert(vlist,i)
		if  CopySceneInfo_TeamChallenge_GetUserVar(s_getSceneVar(cid,0,105),TCUser_LifeNum) == nil then
			table.insert(vlist, 0)
		else
			local value = CopySceneInfo_TeamChallenge_GetUserVar(s_getSceneVar(cid,0,105),TCUser_LifeNum)
			table.insert(vlist, value)
		end
		i = i+1
		table.insert(vlist,i)
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for j = 1,table.getn(list), 2 do
			if s_getFightTeamID(list[j+1]) == s_getSceneVar(cid,0,103) and list[j+1] ~= s_getSceneVar(cid,0,105)  then
				table.insert(vlist, list[j+1])
				i = i+1
				table.insert(vlist, i)
				local value = CopySceneInfo_TeamChallenge_GetUserVar(list[j+1],TCUser_LifeNum)
				table.insert(vlist, value)
				i = i+1
				table.insert(vlist, i)
			end
		end
		for j=i, 14 do
			table.insert(vlist,0)
			if i == 14 then
				break
			end
			i = i+1
			table.insert(vlist,i)
		end
		table.insert(vlist,15)
		local curtime = s_getCurTime(TIME_ALLSECONDS)
		local inittime = s_getSceneVar(cid,0,101)
		table.insert(vlist,inittime+6*60-curtime)
		size = 15
	else
		table.insert(vlist,ckey)
		table.insert(vlist,cvalue)
	end
	s_sendCopyVar(ctype, cid,uid,size,vlist)
end

function CopySceneInfo_TeamChallenge_InitCopyScene(cid)
	s_setSceneVar(cid,0,101,s_getCurTime(TIME_ALLSECONDS))--开始时间
end

function CopySceneInfo_TeamChallenge_OnPlayerIntoCopyScene(cid,uid)
	--	if s_getVar(uid,103,101) == cid and CopySceneInfo_TeamChallenge_GetUserVar(uid,TCUser_LifeNum) == 0 then
	--		ReturnUserHome(uid,"CopySceneInfo_TeamChallenge_OnPlayerIntoCopyScene")
	--		return
	--	end
	local inittime = s_getSceneVar(cid,0,101)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	if s_getFightTeamID(uid) == s_getSceneVar(cid,0,102) then
		s_addGroup(SCENE_ENTRY_PLAYER, uid, 17)
		CopySceneInfo_TeamChallenge_SetUserVar(uid,TCUser_Gindex,1)
		if curtime < inittime+30 then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,95,1,inittime+30-curtime)
		end
	elseif s_getFightTeamID(uid) == s_getSceneVar(cid,0,103) then
		s_addGroup(SCENE_ENTRY_PLAYER, uid, 18)
		CopySceneInfo_TeamChallenge_SetUserVar(uid,TCUser_Gindex,2)
		if curtime < inittime+30 then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,95,1,inittime+30-curtime)
		end
	else
		s_addbuff(SCENE_ENTRY_PLAYER,uid,95,1,6*60)
		s_setSelfHide(SCENE_ENTRY_PLAYER,uid,1)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,3,1,6*60)
	end
	CopySceneInfo_TeamChallenge_SetUserVar(uid,TCUser_IntoTime,curtime)
	s_setField(uid,UserVar_TeamChallengeTime,curtime)
	CopySceneInfo_TeamChallenge_SetUserVar(uid,TCUser_LifeNum,5)
	CopySceneInfo_TeamChallenge_SetUserVar(uid,TCUser_DieTime,0)
	CopySceneInfo_TeamChallenge_SendCopyInfo(cid,0,0,0)
	CopySceneInfo_TeamChallenge_SendCopyInfo(cid,uid,0,0)
	if s_getVar(uid,103,101) == 0 then
		s_setVar(uid,103,101,cid)
	end
end

function CopySceneInfo_TeamChallenge_OnPlayerLeaveCopyScene(cid,uid)
	for i=17,18 do--清理buff
		s_removebuff(SCENE_ENTRY_PLAYER,uid,i)
	end
	s_removebuff(SCENE_ENTRY_PLAYER,uid,95)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,3)
	s_setSelfHide(SCENE_ENTRY_PLAYER,uid,2)
	CopySceneInfo_TeamChallenge_SetUserVar(uid,TCUser_LifeNum,0)
	CopySceneInfo_TeamChallenge_SendCopyInfo(cid,0,0,0)

	local life = 0
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		if s_getFightTeamID(list[i+1]) == s_getFightTeamID(uid) then
			life = life+CopySceneInfo_TeamChallenge_GetUserVar(list[i+1],TCUser_LifeNum)
		end
	end
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if life == 0 then
		if CopySceneInfo_TeamChallenge_GetUserVar(uid,TCUser_Gindex) == 1 then
			-- 蓝方胜
			s_teamChallengeWin(s_getSceneVar(cid,0,103),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
		elseif CopySceneInfo_TeamChallenge_GetUserVar(uid,TCUser_Gindex) == 2 then
			--红方胜
			s_teamChallengeWin(s_getSceneVar(cid,0,102),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
		end
		s_clearCopy(cid)
	end
end

function CopySceneInfo_TeamChallenge_OnPlayerDie(cid,uid,murder,dtype)
	local lifenum = CopySceneInfo_TeamChallenge_GetUserVar(uid,TCUser_LifeNum)
	if lifenum >= 1 then
		CopySceneInfo_TeamChallenge_SetUserVar(uid,TCUser_LifeNum,lifenum-1)
	end
	local life = 0
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		if s_getFightTeamID(list[i+1]) == s_getFightTeamID(uid) then
			life = life+CopySceneInfo_TeamChallenge_GetUserVar(list[i+1],TCUser_LifeNum)
		end
	end
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if life == 0 then
		if CopySceneInfo_TeamChallenge_GetUserVar(uid,TCUser_Gindex) == 1 then
			-- 蓝方胜
			s_teamChallengeWin(s_getSceneVar(cid,0,103),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
		elseif CopySceneInfo_TeamChallenge_GetUserVar(uid,TCUser_Gindex) == 2 then
			--红方胜
			s_teamChallengeWin(s_getSceneVar(cid,0,102),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
		end
		s_clearCopy(cid)
		return
	end
	if CopySceneInfo_TeamChallenge_GetUserVar(uid,TCUser_Gindex) == 1 then
		s_setSceneVar(cid,0,107,s_getSceneVar(cid,0,107)+1)
	elseif CopySceneInfo_TeamChallenge_GetUserVar(uid,TCUser_Gindex) == 2 then
		s_setSceneVar(cid,0,106,s_getSceneVar(cid,0,106)+1)
	end
	CopySceneInfo_TeamChallenge_SetUserVar(uid,TCUser_DieTime,s_getCurTime(TIME_ALLSECONDS))
	CopySceneInfo_TeamChallenge_SendCopyInfo(cid,0,0,0)
end

function CopySceneInfo_TeamChallenge_OnPlayerRelive(uid,rtype)
	if rtype == 14 then
		local zone = { x = 115, y = 111, width = 30, height = 30 }
		local posx = zone.x + math.random(0, zone.width)
		local posy = zone.y + math.random(0, zone.height)
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
	end
	local lifenum = CopySceneInfo_TeamChallenge_GetUserVar(uid,TCUser_LifeNum)
	if lifenum == 0 then
		s_sysInfo(uid,"您的生命数已用完，系统自动帮你切换到观察模式")
		s_addbuff(SCENE_ENTRY_PLAYER,uid,95,1,6*60)
		s_setSelfHide(SCENE_ENTRY_PLAYER,uid,1)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,3,1,6*60)
	end
	CopySceneInfo_TeamChallenge_SetUserVar(uid,TCUser_DieTime,0)
end

function OnLoopCopyScene_1Sec_TeamChallenge(ctype,cid)
	local inittime = s_getSceneVar(cid,0,101)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	if curtime < inittime+30 then
		local wait = inittime+30-curtime
		s_copyInfo(cid,"开始倒计时:" .. wait)
		return
	end
	if curtime > inittime+60 then
		--有一方在的，在的胜
		local rednum = 0
		local bluenum = 0
		local redpower = 0
		local bluepower = 0
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			if s_getFightTeamID(list[i+1]) == s_getSceneVar(cid,0,102) then
				rednum = rednum+1
				redpower = redpower+s_getField(list[i+1],UserVar_Power)
			elseif s_getFightTeamID(list[i+1]) == s_getSceneVar(cid,0,103) then
				bluenum = bluenum+1
				bluepower = bluepower+s_getField(list[i+1],UserVar_Power)
			end
		end
		if rednum == 0 and bluenum == 0 then
			if redpower < bluepower then
				if s_getSceneVar(cid,0,108) == 0 then
					s_teamChallengeWin(s_getSceneVar(cid,0,102),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
					s_setSceneVar(cid,0,108,1)
				end
			else
				if s_getSceneVar(cid,0,108) == 0 then
					s_teamChallengeWin(s_getSceneVar(cid,0,103),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
					s_setSceneVar(cid,0,108,1)
				end
			end
			s_clearCopy(cid)
			return
		elseif rednum == 0 then
			if s_getSceneVar(cid,0,108) == 0 then
				s_teamChallengeWin(s_getSceneVar(cid,0,103),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
				s_setSceneVar(cid,0,108,1)
			end
			s_clearCopy(cid)
			return
		elseif bluenum == 0 then
			if s_getSceneVar(cid,0,108) == 0 then
				s_teamChallengeWin(s_getSceneVar(cid,0,102),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
				s_setSceneVar(cid,0,108,1)
			end
			s_clearCopy(cid)
			return
		end
	end
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		local dietime = CopySceneInfo_TeamChallenge_GetUserVar(list[i+1],TCUser_DieTime)
		if curtime > dietime + 30 and dietime ~= 0 then
			local maxhp = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_MAXHP)
			local maxsp = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_MAXSP)
			s_addValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_HP,maxhp)
			s_addValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_SP,maxsp)
			CopySceneInfo_TeamChallenge_OnPlayerRelive(list[i+1],0)
		end
	end
	if curtime > inittime + 6*60 then
		local redlife = 0
		local bluelife = 0
		local redpower = 0
		local bluepower = 0
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			if s_getFightTeamID(list[i+1]) == s_getSceneVar(cid,0,102) then
				redlife = redlife+CopySceneInfo_TeamChallenge_GetUserVar(list[i+1],TCUser_LifeNum)
				redpower = redpower+s_getField(list[i+1],UserVar_Power)
			elseif s_getFightTeamID(list[i+1]) == s_getSceneVar(cid,0,103) then
				bluelife = bluelife+CopySceneInfo_TeamChallenge_GetUserVar(list[i+1],TCUser_LifeNum)
				bluepower = bluepower+s_getField(list[i+1],UserVar_Power)
			end
		end
		if redlife == bluelife then
			if redpower < bluepower then
				if s_getSceneVar(cid,0,108) == 0 then
					s_teamChallengeWin(s_getSceneVar(cid,0,102),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
					s_setSceneVar(cid,0,108,1)
				end
			else
				if s_getSceneVar(cid,0,108) == 0 then
					s_teamChallengeWin(s_getSceneVar(cid,0,103),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
					s_setSceneVar(cid,0,108,1)
				end
			end
			s_clearCopy(cid)
			return
		elseif redlife < bluelife then
			if s_getSceneVar(cid,0,108) == 0 then
				s_teamChallengeWin(s_getSceneVar(cid,0,103),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
				s_setSceneVar(cid,0,108,1)
			end
			s_clearCopy(cid)
			return
		elseif bluelife < redlife then
			if s_getSceneVar(cid,0,108) == 0 then
				s_teamChallengeWin(s_getSceneVar(cid,0,102),ctype,s_getSceneVar(cid,0,106),s_getSceneVar(cid,0,107))
				s_setSceneVar(cid,0,108,1)
			end
			s_clearCopy(cid)
			return
		end
	end

	--8.	玩家掉线后，该角色剩余生命次数减为0，不可再进副本。
	--	玩家不操作，则默认自死亡时30秒后自动随机复活。玩家不操作，则默认自死亡时30秒后自动随机复活。玩家不操作，则默认自死亡时30秒后自动随机复活。
end

------------------------------------------------------------------------------------
local TeamChallengeCopyScene = [[
    CopySceneInfo_$1 = {
	}
    function CopySceneInfo_$1:InitCopyScene(cid)
        CopySceneInfo_TeamChallenge_InitCopyScene(cid)
    end
    function CopySceneInfo_$1:OnPlayerIntoCopyScene(cid,uid)
        CopySceneInfo_TeamChallenge_OnPlayerIntoCopyScene(cid,uid)
    end
    function CopySceneInfo_$1:OnPlayerLeaveCopyScene(cid,uid)
        CopySceneInfo_TeamChallenge_OnPlayerLeaveCopyScene(cid,uid)
    end
    function OnLoopCopyScene_1Sec_$1(ctype,cid)
        OnLoopCopyScene_1Sec_TeamChallenge(ctype,cid)
    end

	function CopySceneInfo_$1:GetUserVar(uid,key)
		CopySceneInfo_TeamChallenge_GetUserVar(uid,key)
	end

	function CopySceneInfo_$1:SetUserVar(uid,key,value)
		CopySceneInfo_TeamChallenge_SetUserVar(uid,key,value)
	end
	function CopySceneInfo_$1:SendCopyInfo(cid,uid,ckey,cvalue)
		CopySceneInfo_TeamChallenge_SendCopyInfo(cid,uid,ckey,cvalue)
	end
	function CopySceneInfo_$1:OnPlayerDie(cid,uid,murder,dtype)
		CopySceneInfo_TeamChallenge_OnPlayerDie(cid,uid,murder,dtype)
	end
	function CopySceneInfo_$1:OnPlayerRelive(uid,rtype)
		CopySceneInfo_TeamChallenge_OnPlayerRelive(uid,rtype)
	end
]]
for i = 104,109 do
	RegistetFunction(FormatString(TeamChallengeCopyScene,i))
end
