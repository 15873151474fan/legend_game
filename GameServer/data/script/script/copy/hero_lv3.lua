--英雄会第二层(原第三层)

CopySceneInfo_17 = {
	{position={}, team = {}},
	{position={}, team = {}},
	{position={}, team = {}},
	{position={}, team = {}},
	{position={}, team = {}},
}

--副本创建初始化
function CopySceneInfo_17:InitCopyScene(cid)
	s_setSceneVar(cid,0,0,s_getCurTime(TIME_ALLSECONDS))
end

--销毁副本
function CopySceneInfo_17:FinalCopyScene(cid)
end

function CopySceneInfo_17:OnPlayerIntoCopyScene(cid,uid)
	s_addVar(uid,101,11,0)
	s_addVar(uid,101,12,0)

	s_sendCopyInfo(cid,2,5*60,"击败巨型邪龙 获得进入下一层机会")

	local POS = { 154,136,133,102,113,135,84,155,132,63,186,154,137,148}
	local leader = s_getTeamLeader(uid)
	local teamid = s_getTeamID(uid)
	local room = s_getSceneVar(cid,0,1)
	if teamid == 0 then
		ReturnUserHome(uid,"CopySceneInfo_17:OnPlayerIntoCopyScene")
		return
	end
	if CopySceneInfo_17[room].position[leader] == nil then
		CopySceneInfo_17[room].position[leader] = math.random(1,table.getn(POS)/2)
	end
	local insert = 0
	for i=1,table.getn(CopySceneInfo_17[room].team) do
		if CopySceneInfo_17[room].team[i] == teamid then
			insert = 1
			break
		end
	end
	if insert == 0 then
		table.insert(CopySceneInfo_17[room].team, teamid)
		s_setTeamMask(teamid,1,4)
	end
	local index = CopySceneInfo_17[room].position[leader]
	s_goto(SCENE_ENTRY_PLAYER,uid,POS[index],POS[index+1])
end

function CopySceneInfo_17:OnPlayerLeaveCopyScene(cid,uid)
	local tid = s_getTeamID(uid)
	local room = s_getSceneVar(cid,0,1)
	local remove = 0
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i=1,table.getn(list) do
		if s_getTeamID(list[i+1]) == tid then
			remove = 1
		end
	end
	if remove == 0 then
		s_setTeamMask(tid,remove,4)
		for i=1,table.getn(CopySceneInfo_17[room].team) do
			if CopySceneInfo_17[room].team[i] == tid then
				CopySceneInfo_17[room].team[i] = 0
			end
		end
	end
end

function OnLoopCopyScene_1Sec_17(ctype,cid)
	local time_now = s_getCurTime(TIME_ALLSECONDS)
	local pass = time_now - s_getSceneVar(cid,0,0)
	if s_getSceneVar(cid,0,3) == 0 then
		s_setSceneVar(cid,0,3,1)
		s_setSceneVar(cid,0,2,300)
		CopySceneInfo_17:createMonster(cid)
	end
	local clear = 0
	if s_getSceneVar(cid,0,3,1) == 2 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			local time = s_getVar(list[i+1],101,11)
			if time > 0 and time_now > time then
				s_relive(list[i],list[i+1])
				s_removebuff(list[i],list[i+1],10502)
				s_removebuff(list[i],list[i+1],10703)
				s_intoCopy(list[i+1],18)
				clear = 1
			end
			--		s_clearCopy(cid)
		end
	end
	if clear == 1 then
		s_setSceneVar(cid,0,3,1)
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			if s_getVar(list[i+1],101,11) == 0 then
				s_relive(list[i],list[i+1])
				ReturnUserHome(list[i+1],"CopySceneInfo_17:OnLoopCopyScene_1Sec_17")
				s_sysMail(list[i+1],"王者试炼第二层参与奖励！",0,29561,2,"1-1", 0, "王者试炼活动")
			end
		end
	end
	if s_getSceneVar(cid,0,3) == 1 then
		if pass > 5*60 then
			local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
			for i = 1,table.getn(list), 2 do
				s_sysMail(list[i+1],"王者试炼第二层参与奖励！",0,29561,2,"1-1", 0, "王者试炼活动")
				ReturnUserHome(list[i+1],"CopySceneInfo_17:OnLoopCopyScene_1Sec_17")
			end
			local room = s_getSceneVar(cid,0,1)
			CopySceneInfo_17[room].position = {}
			CopySceneInfo_17[room].team = {}
			s_clearCopy(cid)
		end
	end
end

function CopySceneInfo_17:createMonster(cid)
	local npcid = s_sysSummon(22804,cid,125,138)
	local world_level = s_getWorldLevel()
	if world_level == 2 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,5100,10) --最大血量百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,3400,10) --防御百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,3400,10) --攻击百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,106,2600,10) --特伤百分比增加
	elseif world_level == 3 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,12300,10) --最大血量百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,7500,10) --防御百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,7500,10) --攻击百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,106,5600,10) --特伤百分比增加
	elseif world_level == 4 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,22500,10) --最大血量百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,12300,10) --防御百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,12300,10) --攻击百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,106,8900,10) --特伤百分比增加
	elseif world_level == 5 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,38800,10) --最大血量百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,17900,10) --防御百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,17900,10) --攻击百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,106,12500,10) --特伤百分比增加
	elseif world_level == 6 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,74400,10) --最大血量百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,24500,10) --防御百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,24500,10) --攻击百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,106,16500,10) --特伤百分比增加
	elseif world_level == 7 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,118000,10) --最大血量百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,32000,10) --防御百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,32000,10) --攻击百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,106,20900,10) --特伤百分比增加
	elseif world_level == 8 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,174000,10) --最大血量百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,40400,10) --防御百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,40400,10) --攻击百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,106,25500,10) --特伤百分比增加
	elseif world_level == 9 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,246000,10) --最大血量百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,50100,10) --防御百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,50100,10) --攻击百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,106,30600,10) --特伤百分比增加
	elseif world_level == 10 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,325000,10) --最大血量百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,60500,10) --防御百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,60500,10) --攻击百分比增加
		s_addbuff(SCENE_ENTRY_NPC,npcid,106,35800,10) --特伤百分比增加
	end
	s_copyInfo(cid,"BOSS出现,各位注意防范",ChatPos_Sys + ChatPos_Important)
end

function CopySceneInfo_17:dead22804(uid,npcid)
	local ENV_LEVEL = 1
	local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
	local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 17 then
		local leader = s_getTeamLeader(uid)
		local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			if s_getTeamLeader(list[i+1]) == leader then
				s_addVar(list[i+1],101,11, s_getCurTime(TIME_ALLSECONDS)+20)
				s_setSceneVar(cid,0,3,2)
				s_sysInfo(list[i+1],"任务完成,20秒后将进入下一层",ChatPos_Sys + ChatPos_Important)
			end
		end
	end
end
-- RegisterMyNpcDeadEvent(22804,"CopySceneInfo_17:dead22804($1,$2)")
