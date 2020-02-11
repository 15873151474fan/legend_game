--英雄会第三层(原第四层)

CopySceneInfo_18 = { team = {} }

--副本创建初始化
function CopySceneInfo_18:InitCopyScene(cid)
	s_setSceneVar(cid,0,0,s_getCurTime(TIME_ALLSECONDS))
end

function CopySceneInfo_18:OnPlayerIntoCopyScene(cid,uid)
	local pass = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,0)
	s_sendCopyInfo(cid,4,320- pass,"剩余时间结束后可进入下一层")
	local teamid = s_getTeamID(uid)
	if teamid == 0 then
		ReturnUserHome(uid,"CopySceneInfo_18:OnPlayerIntoCopyScene")
		return
	end
	local insert = 0
	for i=1,table.getn(CopySceneInfo_18.team) do
		if CopySceneInfo_18.team[i] == teamid then
			insert = 1
			break
		end
	end
	if insert == 0 then
		table.insert(CopySceneInfo_18.team, teamid)
		s_setTeamMask(teamid,1,8)
	end
end

function CopySceneInfo_18:OnPlayerLeaveCopyScene(cid,uid)
	local tid = s_getTeamID(uid)
	local remove = 0
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i=1,table.getn(list) do
		if s_getTeamID(list[i+1]) == tid then
			remove = 1
		end
	end
	if remove == 0 then
		s_setTeamMask(tid,remove,8)
		for i=1,table.getn(CopySceneInfo_18.team) do
			if CopySceneInfo_18.team[i] == tid then
				CopySceneInfo_18.team[i] = 0
			end
		end
	end
end

function OnLoopCopyScene_1Sec_18(ctype,cid)
	local TOTAL_WAIT_TIME = 320
	local pass = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,0)
	if pass >= TOTAL_WAIT_TIME then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			s_removebuff(list[i],list[i+1],10502)
			s_removebuff(list[i],list[i+1],10703)
			s_intoCopy(list[i+1],19,0)
		end
		s_clearCopy(cid)
	end
end
