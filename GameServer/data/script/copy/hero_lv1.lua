--英雄会第一层

CopySceneInfo_15 = {
	{ position = {}, team = {}, point = {},},	-- 1
	{ position = {}, team = {}, point = {},},	-- 2
	{ position = {}, team = {}, point = {},},	-- 3
	{ position = {}, team = {}, point = {},},	-- 4
	{ position = {}, team = {}, point = {},},	-- 5
}


--副本创建初始化
function CopySceneInfo_15:InitCopyScene(cid)
	s_setSceneVar(cid,0,0,s_getCurTime(TIME_ALLSECONDS))
end

--销毁副本
function CopySceneInfo_15:FinalCopyScene(cid)
end

--刷新客户端副本信息
--1 剩余时间 2 第一小队 3 积分 4 第二小队 5 积分 6 第三小队 7 积分 8 第四小队 9 积分
function CopySceneInfo_15:SendCopyInfo(cid, uid)
	local vlist = {}
	local size = 1
	local time_now = s_getCurTime(TIME_ALLSECONDS)
	local pass = time_now - s_getSceneVar(cid,0,0)
	if pass < 600 then
		pass = 600 - pass
	else
		pass = 0
	end
	table.insert(vlist, 1)
	table.insert(vlist, pass)

	local room = s_getSceneVar(cid,0,1)
	if CopySceneInfo_15[room].point ~= nil then
		table.sort(CopySceneInfo_15[room].point,function(t1,t2)return t1[2] > t2[2] end)
	end

	for i=1,table.getn(CopySceneInfo_15[room].point) do
		table.insert(vlist, 2*i)
		table.insert(vlist, CopySceneInfo_15[room].point[i][1])
		table.insert(vlist, 2*i+1)
		table.insert(vlist, CopySceneInfo_15[room].point[i][2])
		size = size + 2
	end
	s_sendCopyVar(CopySceneType_Hero_LV1, cid, uid,size,vlist)
end

function CopySceneInfo_15:OnPlayerIntoCopyScene(cid,uid)
	--	local POS = {86,164,83,104,134,73,189,105,190,165,134,195,132,124,148,133,129,143,136,135}
	local POS = {123,127,123,140,135,147,148,139,148,128,137,120,101,53,83,62,48,124,48,144,83,204,100,214,171,215,188,205,223,144,223,124,189,63,171,53}
	local leader = s_getTeamLeader(uid)
	local teamid = s_getTeamID(uid)
	if teamid == 0 then
		ReturnUserHome(uid,"CopySceneInfo_15:OnPlayerIntoCopyScene")
		return
	end

	s_addVar(uid,101,11,0)
	s_addVar(uid,101,12,0)
	s_addVar(uid,101,14,s_getCurTime(TIME_ALLSECONDS))
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,6)
	local room = s_getSceneVar(cid,0,1)
	if CopySceneInfo_15[room].position[leader] == nil then
		CopySceneInfo_15[room].position[leader] = math.random(1,table.getn(POS)/2)
	end
	local insert = 0
	for i=1,table.getn(CopySceneInfo_15[room].team) do
		if CopySceneInfo_15[room].team[i] == teamid then
			insert = 1
			break
		end
	end
	if insert == 0 then
		table.insert(CopySceneInfo_15[room].team, teamid)
		local t = {leader,0}
		table.insert(CopySceneInfo_15[room].point,t)
		s_setTeamMask(teamid,1,2)
	end
	local index = CopySceneInfo_15[room].position[leader]
	s_goto(SCENE_ENTRY_PLAYER,uid,POS[2*index-1],POS[2*index])
	CopySceneInfo_15:SendCopyInfo(cid, uid)
end

function CopySceneInfo_15:OnPlayerLeaveCopyScene(cid,uid)
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
		s_setTeamMask(tid,remove,2)
		for i=1,table.getn(CopySceneInfo_15[room].team) do
			if CopySceneInfo_15[room].team[i] == tid then
				CopySceneInfo_15[room].team[i] = 0
			end
		end
	end
end

function OnLoopCopyScene_1Sec_15(ctype,cid)
	local time_now = s_getCurTime(TIME_ALLSECONDS)
	local pass = time_now - s_getSceneVar(cid,0,0)
	if s_getSceneVar(cid,0,2) == 0 then
		CopySceneInfo_15:createMonster(cid,1)
	end
	if pass % 5 == 0 then
		CopySceneInfo_15:SendCopyInfo(cid, 0)
	end
	local room = s_getSceneVar(cid,0,1)
	if pass >= 600 then
		table.sort(CopySceneInfo_15[room].point,function(t1,t2)return t1[2] > t2[2] end)
		local leader1 = 0
		if CopySceneInfo_15[room].point[1] ~= nil then
			leader1 = CopySceneInfo_15[room].point[1][1]
		end
		local leader2 = 0
		if CopySceneInfo_15[room].point[2] ~= nil then
			leader2 = CopySceneInfo_15[room].point[2][1]
		end
		local leader3 = 0
		if CopySceneInfo_15[room].point[3] ~= nil then
			leader3 = CopySceneInfo_15[room].point[3][1]
		end
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			--检查是否进入
			local leader = s_getTeamLeader(list[i+1])
			if leader ~= leader1 and leader ~= leader2 and leader ~= leader3 then
				for j=1,table.getn(CopySceneInfo_15[room].point) do
					if CopySceneInfo_15[room].point[j][1] == leader then
						if CopySceneInfo_15[room].point[j][2] >= 50 then
							s_sysMail(list[i+1],"王者试炼第一层参与奖励！",0,29561,1,"1-1", 0, "王者试炼活动")
							ReturnUserHome(list[i+1],"OnLoopCopyScene_1Sec_15")
						end
					end
				end
			else
				s_relive(list[i],list[i+1])
				s_removebuff(list[i],list[i+1],10502)
				s_removebuff(list[i],list[i+1],10703)
				s_intoCopy(list[i+1],17,s_getSceneVar(cid,0,1))
			end
		end
		if pass >= 605 then
			CopySceneInfo_15[room].position = {}
			CopySceneInfo_15[room].team = {}
			CopySceneInfo_15[room].point = {}
			s_clearCopy(cid)
		end
	end
end

function CopySceneInfo_15:createMonster(cid,index)
	if index == 1 then	--普通小怪
		local POS = { 121,63, 154,62, 189,83, 207,113, 207,155, 189,184,
			152,206, 120,206, 82,183, 66,154, 67,112, 84,83, 136,93, 172,114,
			171,154, 135,174, 101,154, 104,113,136,133}
	for i = 1,table.getn(POS),2 do
		local posx = POS[i]; local posy = POS[i+1]
		for i = 1,7 do
			local npcid = s_sysSummon(22801,cid,posx,posy)
			local world_level = s_getWorldLevel()
			if world_level == 2 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,5100,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,2600,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,2600,10) --特伤百分比增加
			elseif world_level == 3 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,12200,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,5600,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,5600,10) --特伤百分比增加
			elseif world_level == 4 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,21300,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,8900,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,8900,10) --特伤百分比增加
			elseif world_level == 5 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,34400,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,12500,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,12500,10) --特伤百分比增加
			elseif world_level == 6 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,56800,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,16500,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,16500,10) --特伤百分比增加
			elseif world_level == 7 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,83200,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,20900,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,20900,10) --特伤百分比增加
			elseif world_level == 8 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,115000,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,25500,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,25500,10) --特伤百分比增加
			elseif world_level == 9 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,154000,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,30600,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,30600,10) --特伤百分比增加
			elseif world_level == 10 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,197000,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,35800,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,35800,10) --特伤百分比增加
			end
		end
	end
	local BOSSPOS = {136,72,82,164,189,164}
	for i = 1,table.getn(BOSSPOS),2 do
		local bossposx = BOSSPOS[i]; local bossposy = BOSSPOS[i+1]
		for i = 1,1 do
			local npcid = s_sysSummon(22802,cid,bossposx,bossposy)
			local world_level = s_getWorldLevel()
			if world_level == 2 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,5100,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,2600,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,2600,10) --特伤百分比增加
			elseif world_level == 3 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,12200,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,5600,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,5600,10) --特伤百分比增加
			elseif world_level == 4 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,21300,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,8900,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,8900,10) --特伤百分比增加
			elseif world_level == 5 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,34400,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,12500,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,12500,10) --特伤百分比增加
			elseif world_level == 6 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,56800,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,16500,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,16500,10) --特伤百分比增加
			elseif world_level == 7 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,83200,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,20900,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,20900,10) --特伤百分比增加
			elseif world_level == 8 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,115000,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,25500,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,25500,10) --特伤百分比增加
			elseif world_level == 9 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,154000,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,30600,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,30600,10) --特伤百分比增加
			elseif world_level == 10 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,197000,10) --最大血量百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,104,35800,10) --防御百分比增加
				s_addbuff(SCENE_ENTRY_NPC,npcid,106,35800,10) --特伤百分比增加
			end
		end
	end
	s_setSceneVar(cid,0,2,1)
	end
end

function CopySceneInfo_15:OnPlayerDie(cid,uid,murder,dtype)
	if murder == 0 or murder == nil then return end
	local leader = s_getTeamLeader(murder[1])
	local room = s_getSceneVar(cid,0,1)
	for i=1,table.getn(CopySceneInfo_15[room].point) do
		if CopySceneInfo_15[room].point[i][1] == leader then
			CopySceneInfo_15[room].point[i][2] = CopySceneInfo_15[room].point[i][2] + 3
		end
	end
end

function CopySceneInfo_15:dead22801(uid,npcid)
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 15 then
		local leader = s_getTeamLeader(uid)
		local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
		local room = s_getSceneVar(cid,0,1)
		for i=1, table.getn(CopySceneInfo_15[room].point) do
			if leader == CopySceneInfo_15[room].point[i][1] then
				CopySceneInfo_15[room].point[i][2] = CopySceneInfo_15[room].point[i][2]+10
			end
		end
	end
end

function CopySceneInfo_15:dead22802(uid,npcid)
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if ctype == 15 then
		local leader = s_getTeamLeader(uid)
		local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
		local room = s_getSceneVar(cid,0,1)
		for i=1, table.getn(CopySceneInfo_15[room].point) do
			if leader == CopySceneInfo_15[room].point[i][1] then
				CopySceneInfo_15[room].point[i][2] = CopySceneInfo_15[room].point[i][2]+100
			end
		end
	end
end

-- RegisterMyNpcDeadEvent(22801,"CopySceneInfo_15:dead22801($1,$2)")
-- RegisterMyNpcDeadEvent(22802,"CopySceneInfo_15:dead22802($1,$2)")
