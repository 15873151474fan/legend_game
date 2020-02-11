--英雄会第四层(原第五层)

CopySceneInfo_19 = {score = {},dead = {}, team = {}, point = {}}

--角色数据
User_GetAward			= 1	-- 是否发奖

--用户变量
function CopySceneInfo_19:GetUserVar(uid,key)
	return s_getVar(uid,104,key)
end
function CopySceneInfo_19:SetUserVar(uid,key,value)
	s_addVar(uid,104,key,value)
end

--副本创建初始化
function CopySceneInfo_19:InitCopyScene(cid)
	CopySceneInfo_19.dead = {}
	CopySceneInfo_19.score = {}
	CopySceneInfo_19.team = {}
	CopySceneInfo_19.point = {}
	s_setSceneVar(cid,0,0,s_getCurTime(TIME_ALLSECONDS))
end

--刷新客户端副本信息
--1 剩余时间 2 第一小队 3 积分 4 第二小队 5 积分 6 第三小队 7 积分 8 第四小队 9 积分 10 第五小队 11 积分
function CopySceneInfo_19:SendCopyInfo(cid, uid)
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

	table.sort(CopySceneInfo_19.point,function(t1,t2)return t1[2] > t2[2] end)

	for i=1,table.getn(CopySceneInfo_19.point) do
		table.insert(vlist, 2*i)
		table.insert(vlist, CopySceneInfo_19.point[i][1])
		table.insert(vlist, 2*i+1)
		table.insert(vlist, CopySceneInfo_19.point[i][2])
		size = size + 2
	end
	s_sendCopyVar(CopySceneType_Hero_LV5, cid, uid,size,vlist)
end

function CopySceneInfo_19:OnPlayerIntoCopyScene(cid,uid)
	local leader = s_getTeamLeader(uid)
	local teamid = s_getTeamID(uid)
	local insert = 0
	for i=1,table.getn(CopySceneInfo_19.team) do
		if CopySceneInfo_19.team[i] == teamid then
			insert = 1
			break
		end
	end
	if insert == 0 then
		table.insert(CopySceneInfo_19.team, teamid)
		local t = {leader,0}
		table.insert(CopySceneInfo_19.point,t)
		s_setTeamMask(teamid,1,16)
	end
	CopySceneInfo_19:SendCopyInfo(cid,uid)
	CopySceneInfo_19:SetUserVar(uid,User_GetAward,0)
end

function CopySceneInfo_19:OnPlayerLeaveCopyScene(cid,uid)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,73)
	local tid = s_getTeamID(uid)
	local remove = 0
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i=1,table.getn(list) do
		if s_getTeamID(list[i+1]) == tid then
			remove = 1
		end
	end
	if remove == 0 then
		s_setTeamMask(tid,remove,16)
		for i=1,table.getn(CopySceneInfo_19.team) do
			if CopySceneInfo_19.team[i] == tid then
				CopySceneInfo_19.team[i] = 0
			end
		end
	end
end

function CopySceneInfo_19:OnPlayerDie(cid,uid,murderlist,dtype)
	local leader = s_getTeamLeader(uid)
	if  leader == 0 then
		ReturnUserHome(uid,"CopySceneInfo_19:OnPlayerDie")
	else
		CopySceneInfo_19.dead[uid] = s_getCurTime(TIME_ALLSECONDS)
	end

	if murderlist == nil  or table.getn(murderlist) == 0 then
		return
	end
	--积分计算方式 TODO
	leader = s_getTeamLeader(murderlist[1])
	if leader ~= 0 and leader ~= s_getTeamLeader(uid) then
		for i=1,table.getn(CopySceneInfo_19.point) do
			if CopySceneInfo_19.point[i][1] == leader then
				CopySceneInfo_19.point[i][2] = CopySceneInfo_19.point[i][2] + 3
			end
		end
	end
	leader = s_getTeamLeader(uid)
	if leader ~= 0 then
		for i=1,table.getn(CopySceneInfo_19.point) do
			if CopySceneInfo_19.point[i][1] == leader then
				if CopySceneInfo_19.point[i][2] > 0 then
					CopySceneInfo_19.point[i][2] = CopySceneInfo_19.point[i][2] - 1
				end
			end
		end
	end
end

function OnLoopCopyScene_1Sec_19(ctype,cid)
	s_setSceneVar(cid,0,1,s_getSceneVar(cid,0,1)+1)
	local pass = s_getSceneVar(cid,0,1)
	if pass % 5 == 0 then
		CopySceneInfo_19:SendCopyInfo(cid, 0)
	end
	if pass > 600 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			--清除BUFF
			s_removebuff(list[i],list[i+1],10502)
			s_removebuff(list[i],list[i+1],10703)
		end
	end
	CopySceneInfo_19:checkDeath(ctype,cid)
	CopySceneInfo_19:checkFinal(ctype,cid,pass)
end
function CopySceneInfo_19:checkFinal(ctype,cid,pass)
	local pass = s_getSceneVar(cid,0,1)
	if pass > 600 then
		s_copyInfo(cid,"胜负已分，比赛结束" )
		CopySceneInfo_19:SendCopyInfo(cid, 0)
		local leader1 = 0
		if CopySceneInfo_19.point[1] ~= nil then
			leader1 = CopySceneInfo_19.point[1][1]
		end
		local leader2 = 0
		if CopySceneInfo_19.point[2] ~= nil then
			leader2 = CopySceneInfo_19.point[2][1]
		end
		local leader3 = 0
		if CopySceneInfo_19.point[3] ~= nil then
			leader3 = CopySceneInfo_19.point[3][1]
		end
		local leader4 = 0
		if CopySceneInfo_19.point[4] ~= nil then
			leader4 = CopySceneInfo_19.point[4][1]
		end
		local leader5 = 0
		if CopySceneInfo_19.point[5] ~= nil then
			leader5 = CopySceneInfo_19.point[5][1]
		end
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			--检查是否进入
			if CopySceneInfo_19:GetUserVar(list[i+1],User_GetAward) == 0 then
				local leader = s_getTeamLeader(list[i+1])
				-- TODO
				local judge = 0
				if leader == leader1 then
					judge =	CopySceneInfo_19_leader1item(leader1)
					s_sysMail(list[i+1],"王者试炼第一名队伍奖励！",0,20691,1,"1-1", 0, "王者试炼活动")
					if list[i+1] == leader1 then
						s_sysMail(list[i+1],"王者试炼第一名队长奖励！",0,23057,1,"1-1", 0, "王者试炼活动")
					end
				elseif leader == leader2 then
					judge =	CopySceneInfo_19_leader2item(leader2)
					s_sysMail(list[i+1],"王者试炼第二名队伍奖励！",0,20695,1,"1-1", 0, "王者试炼活动")
				elseif leader == leader3 then
					judge =	CopySceneInfo_19_leader3item(leader3)
					s_sysMail(list[i+1],"王者试炼第三名队伍奖励！",0,20694,1,"1-1", 0, "王者试炼活动")
				elseif leader == leader4 then
					judge =	CopySceneInfo_19_leader4item(leader4)
					s_sysMail(list[i+1],"王者试炼第四名队伍奖励！",0,20693,1,"1-1", 0, "王者试炼活动")
				elseif leader == leader5 then
					judge =	CopySceneInfo_19_leader5item(leader5)
					s_sysMail(list[i+1],"王者试炼第五名队伍奖励！",0,20692,1,"1-1", 0, "王者试炼活动")
				end
				s_sysMail(list[i+1],"王者试炼决赛参与奖励！",0,29561,2,"1-1", 0, "王者试炼活动")
				CopySceneInfo_19:SetUserVar(list[i+1],User_GetAward,1)
			end
		end
		s_clearCopy(cid)
	end
end

function CopySceneInfo_19_leader1item(uid)
	local worldlevel = s_getWorldLevel()
	local judge = 0
	if worldlevel == 2 then
		judge = 240
	elseif worldlevel == 3 then
		judge = 360
	elseif worldlevel == 4 then
		judge = 480
	elseif worldlevel == 5 then
		judge = 600
	elseif worldlevel == 6 then
		judge = 750
	elseif worldlevel == 7 then
		judge = 900
	elseif worldlevel == 8 then
		judge = 1080
	elseif worldlevel == 9 then
		judge = 1260
	elseif worldlevel >= 10 then
		judge = 1440
	end
	return judge
end
function CopySceneInfo_19_leader2item(uid)
	local worldlevel = s_getWorldLevel()
	local judge = 0
	if worldlevel == 2 then
		judge = 180
	elseif worldlevel == 3 then
		judge = 250
	elseif worldlevel == 4 then
		judge = 325
	elseif worldlevel == 5 then
		judge = 420
	elseif worldlevel == 6 then
		judge = 520
	elseif worldlevel == 7 then
		judge = 620
	elseif worldlevel == 8 then
		judge = 750
	elseif worldlevel == 9 then
		judge = 870
	elseif worldlevel >= 10 then
		judge = 1000
	end
	return judge
end
function CopySceneInfo_19_leader3item(uid)
	local worldlevel = s_getWorldLevel()
	local judge = 0
	if worldlevel == 2 then
		judge = 160
	elseif worldlevel == 3 then
		judge = 225
	elseif worldlevel == 4 then
		judge = 290
	elseif worldlevel == 5 then
		judge = 380
	elseif worldlevel == 6 then
		judge = 475
	elseif worldlevel == 7 then
		judge = 570
	elseif worldlevel == 8 then
		judge = 680
	elseif worldlevel == 9 then
		judge = 800
	elseif worldlevel >= 10 then
		judge = 910
	end
	return judge
end
function CopySceneInfo_19_leader4item(uid)
	local worldlevel = s_getWorldLevel()
	local judge = 0
	if worldlevel == 2 then
		judge = 140
	elseif worldlevel == 3 then
		judge = 195
	elseif worldlevel == 4 then
		judge = 255
	elseif worldlevel == 5 then
		judge = 340
	elseif worldlevel == 6 then
		judge = 430
	elseif worldlevel == 7 then
		judge = 520
	elseif worldlevel == 8 then
		judge = 620
	elseif worldlevel == 9 then
		judge = 720
	elseif worldlevel >= 10 then
		judge = 820
	end
	return judge
end
function CopySceneInfo_19_leader5item(uid)
	local worldlevel = s_getWorldLevel()
	local judge = 0
	if worldlevel == 2 then
		judge = 120
	elseif worldlevel == 3 then
		judge = 170
	elseif worldlevel == 4 then
		judge = 220
	elseif worldlevel == 5 then
		judge = 300
	elseif worldlevel == 6 then
		judge = 385
	elseif worldlevel == 7 then
		judge = 460
	elseif worldlevel == 8 then
		judge = 550
	elseif worldlevel == 9 then
		judge = 650
	elseif worldlevel >= 10 then
		judge = 740
	end
	return judge
end

function CopySceneInfo_19:checkDeath(ctype,cid)
	local time = s_getCurTime(TIME_ALLSECONDS)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		local hp = s_getValue(list[i],list[i+1],VALUE_TYPE_HP)
		if hp ~= 0 then
			CopySceneInfo_19.dead[list[i+1]] = 0
		else
			local value = CopySceneInfo_19.dead[list[i+1]]
			if  value ~= nil and value > 0 then
				if time - value >= 30 then
					s_relive(list[i],list[i+1])
					POS = {{100,100},{150,150},{200,200}}
					local rand = math.random(1,table.getn(POS))
					s_goto(SCENE_ENTRY_PLAYER,uid,POS[rand][1],POS[rand][2])
				end
			end
		end
	end
end

function CopySceneInfo_19:dead22805(uid,npcid)
	local world_level = s_getWorldLevel()
	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
	local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
	--全队给称号
	local teams = s_getTeamEntry(SCENE_ENTRY_PLAYER,uid,0)
	for j = 1,table.getn(teams),2 do
		local itemid = s_addSceneItem(23057,1,cid,posx,posy,0,"1-1")
		if itemid ~= 0 and itemid ~= nil then
			s_setSceneItemValue(itemid,2,1)     --属主类型
			s_setSceneItemValue(itemid,3,teams[j+1])   --属主id
		end
	end
	if world_level <= 5 then
		local gem = { 27201,27211,27221,27231,27241}
		for i = 1,20+world_level*5 do
			s_addSceneItem(gem[math.random(1,5)],1,cid,posx,posy,0,"")
		end
	else
		local gem = { 27201,27211,27221,27231,27241}
		for i = 1,45 do
			s_addSceneItem(gem[math.random(1,5)],1,cid,posx,posy,0,"")
		end
	end
	local leader = s_getTeamLeader(uid)
	local name = s_getValue(SCENE_ENTRY_PLAYER,leader,VALUE_TYPE_NAME)
	local country = s_getValue(SCENE_ENTRY_PLAYER,leader,VALUE_TYPE_HOMELADN_NAME)
	if country ~= nil and name ~= nil then
		s_worldInfo(country .."的".. name .. "带领英勇的队员，在王者试炼的战场上力挫众多强队，最终笑到了最后",ChatPos_Sys + ChatPos_Honor)
	end
end
-- RegisterMyNpcDeadEvent(22805,"CopySceneInfo_19:dead22805($1,$2)")
