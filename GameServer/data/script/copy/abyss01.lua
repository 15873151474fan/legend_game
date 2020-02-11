--混乱深渊副本一层
-- 1-xx变量说明
--defencetower_begin_time           = 1;        --活动开始时间
--defencetower_over_time                = 2;        --活动结束时间
--defencetower_monster_current      = 3;   --怪物当前波数
--defencetower_monster_total        = 4;    --怪物总共波数
--defencetower_monter_current_index = 5; --当前波数刷怪的下标
--defencetower_first_time           = 6;        --初始化时间，一般是玩家刚进入时间
--defencetower_isbegin              = 7;        --是否开始刷怪
--defencetower_next_time            = 8;        --下一次刷怪时间
--defencetower_beging               = 9;       --是否刷怪中
--defencetower_is_over              = 10;      --是否已结束
--defencetower_recycle_over         = 11;      --回收倒计时,胜利或失败的缓冲时间，然后清理玩家出副本
scene228_teamid						= 21		--混乱深渊存储队伍id
scene228_count						= 22		--boss刷新数量
scene228_over						= 10
scene228_begin_time					= 1
scene228_over_time					= 2
scene228_relive_posx				= 22 --复活坐标x
scene228_relive_posy				= 48
scene228_boss_count				= 5
scene228_boss_total				= 6
scene228_boss_resettime			= 15
scene228_boss_npcid				= 40
scene228_boss_blood				= 41
scene228_boss_attcount			= 42
scene228_relive_next  			= 43

scene228_relive_uid1			= 51	--副本用户id存储
scene228_relive_uid2			= 52
scene228_relive_uid3			= 53
scene228_relive_uid4			= 54
scene228_relive_uid5			= 55
scene228_relive_baseid			= 56
scene228_relive_ctype			= 57

--2 --xx玩家所获得的积分



CopySceneInfo_228 =
{
	--初始化副本的操作
	initcopy =
	{
        action =
        {
            --{s_copySummonNpc,{7500,1,25,12,103,1}},
        },
	},

	npcid = 0,
	baseid = 0,
	ctype = 0,
	blood = 0,
	attcount = 0,
	bossinfo = {
		--[1]={bossid= 11021 ,posx = 24 ,posy=14 ,ai = 103 ,recycle = 1,},
		--[2]={bossid= 11022 ,posx = 24 ,posy=14 ,ai = 103 ,recycle = 1,},
		--[3]={bossid= 11023 ,posx = 24 ,posy=14 ,ai = 103 ,recycle = 1,},
		--[4]={bossid= 11024 ,posx = 24 ,posy=14 ,ai = 103 ,recycle = 1,},
		--[5]={bossid= 11025 ,posx = 24 ,posy=14 ,ai = 103 ,recycle = 1,},
		--[6]={bossid= 11026 ,posx = 24 ,posy=14 ,ai = 103 ,recycle = 1,},
		[1]={bossid= 23001 ,posx = 41 ,posy=35 ,ai = 103 ,recycle = 1,},
		[2]={bossid= 23002 ,posx = 41 ,posy=35 ,ai = 103 ,recycle = 1,},
		[3]={bossid= 23003 ,posx = 41 ,posy=35 ,ai = 103 ,recycle = 1,},
		[4]={bossid= 23004 ,posx = 41 ,posy=35 ,ai = 103 ,recycle = 1,},
		[5]={bossid= 23005 ,posx = 86 ,posy=37 ,ai = 103 ,recycle = 1,},
		[6]={bossid= 23006 ,posx = 86 ,posy=37 ,ai = 103 ,recycle = 1,},
		[7]={bossid= 23007 ,posx = 86 ,posy=37 ,ai = 103 ,recycle = 1,},
		[8]={bossid= 23008 ,posx = 86 ,posy=37 ,ai = 103 ,recycle = 1,},
		[9]={bossid= 23009 ,posx = 79 ,posy=12 ,ai = 103 ,recycle = 1,},
		[10]={bossid= 23010 ,posx = 79 ,posy=12 ,ai = 103 ,recycle = 1,},
		[11]={bossid= 23011 ,posx = 79 ,posy=12 ,ai = 103 ,recycle = 1,},
		[12]={bossid= 23012 ,posx = 79 ,posy=12 ,ai = 103 ,recycle = 1,},
		[13]={bossid= 23013 ,posx = 52 ,posy=19 ,ai = 103 ,recycle = 1,},
		[14]={bossid= 23014 ,posx = 52 ,posy=19 ,ai = 103 ,recycle = 1,},
		[15]={bossid= 23015 ,posx = 52 ,posy=19 ,ai = 103 ,recycle = 1,},
		[16]={bossid= 23016 ,posx = 52 ,posy=19 ,ai = 103 ,recycle = 1,},
		[17]={bossid= 23017 ,posx = 18 ,posy=13 ,ai = 103 ,recycle = 1,},
		[18]={bossid= 23018 ,posx = 18 ,posy=13 ,ai = 103 ,recycle = 1,},
		[19]={bossid= 23019 ,posx = 18 ,posy=13 ,ai = 103 ,recycle = 1,},
		[20]={bossid= 23020 ,posx = 18 ,posy=13 ,ai = 103 ,recycle = 1,},
		--[16]={bossid= 23016 ,posx = 18 ,posy=13 ,ai = 103 ,recycle = 1,},
		--[17]={bossid= 23017 ,posx = 18 ,posy=13 ,ai = 103 ,recycle = 1,},
		--[18]={bossid= 23018 ,posx = 18 ,posy=13 ,ai = 103 ,recycle = 1,},
	},
}


--副本创建初始化
function CopySceneInfo_228:InitCopyScene(cid)
    --s_setSceneVar(cid,1,defencetower_first_time,10)
	s_debug("scene228 InitCopyScene Begin >>>>>>>sceneid=="..cid)
	s_setSceneVar(cid,1,scene228_over_time,s_getCurTime(TIME_ALLSECONDS) + 1799)
	--local index = 1 
	local index = math.random(1,4)
	self.ctype = index
    local npcid = s_sysSummon(self.bossinfo[index].bossid, cid, self.bossinfo[index].posx,self.bossinfo[index].posy ,self.bossinfo[index].ai,self.bossinfo[index].recycle)
    s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_COPYSCENE_MAPID,227)
    s_setSceneVar(cid,1,scene228_count,1)
	self.npcid = npcid
	self.baseid = self.bossinfo[index].bossid
	self.blood = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
    s_setSceneVar(cid,1,scene228_boss_npcid,self.npcid)
    s_setSceneVar(cid,1,scene228_boss_blood	,self.blood)
    s_setSceneVar(cid,1,scene228_boss_attcount,1)
    s_setSceneVar(cid,1,scene228_relive_baseid,self.bossinfo[index].bossid)
    s_setSceneVar(cid,1,scene228_relive_ctype,self.ctype)
    --s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_HP, 910000000)
    --s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP, 910000000)
    s_debug("scene228 sceneid =="..cid.." baseid=="..self.baseid.." npcid=="..npcid.." teamid=="..s_getSceneVar(cid,1,scene228_teamid).." count=="..s_getSceneVar(cid,1,scene228_count).." ctype=="..self.ctype.." blood=="..self.blood)
end
--玩家死亡
function CopySceneInfo_228:OnPlayerDie(cid,uid,murder,dtype)

    --ReturnUserHome(uid,"CopySceneInfo_228:OnPlayerDie")
end

--销毁副本
function CopySceneInfo_228:FinalCopyScene(cid)

end

--清空npc
function CopySceneInfo_228:ClearNpc(cid)
    --清空npc
    local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
    for i = 1,table.getn(list), 2 do --清理NPC
		if list[i+1] > 0 then 
        	s_clearNpc(list[i+1])
		end
    end
end

--1秒钟循环
function OnLoopCopyScene_1Sec_228(ctype,cid)
	self = CopySceneInfo_228 
    local curtime = s_getCurTime(TIME_ALLSECONDS)
    if  s_getSceneVar(cid,1,scene228_over) == 1 then
        CopySceneInfo_228:ClearNpc(cid)
		s_clearCopy(cid)
	end

    local blood = s_getSceneVar(cid,1,scene228_boss_blood)
	local attcount = s_getSceneVar(cid,1,scene228_boss_attcount)
	local npcid = s_getSceneVar(cid,1,scene228_boss_npcid)
	if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) == 0 then
		s_trace(cid.." getValue VALUE_TYPE_HP err")
	end
	local nowblood = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP) == 0 then
		s_trace(cid.." getValue VALUE_TYPE_HP err")
	end
	local maxhp	= s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	--s_trace(" >>>>>>>228 cid ="..cid.." npcid = "..npcid.." "..(blood or 0).." "..(nowblood or 0).." "..(maxhp or 0))
	if attcount >= scene228_boss_resettime and npcid > 0 then
		if blood == nowblood and maxhp ~= nil and maxhp > 0 then
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP,maxhp)
		else
			s_setSceneVar(cid,1,scene228_boss_blood	,nowblood)
		end
		s_setSceneVar(cid,1,scene228_boss_attcount,0)
		s_trace(" >>>>>>>228 cid ="..cid.." npcid = "..npcid.." "..(blood or 0).." "..(nowblood or 0).." "..(maxhp or 0))
	end

	s_setSceneVar(cid,1,scene228_boss_attcount,s_getSceneVar(cid,1,scene228_boss_attcount)+1)
	local relivestatus = true 
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
    for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_isDead(list[i+1]) == 0 then
				relivestatus = false
			end
		end
    end
	 
	if relivestatus and npcid > 0 then
    	if s_getSceneVar(cid,1,scene228_relive_next) == 0 then
    		s_setSceneVar(cid,1,scene228_relive_next,1)
		end 
		if nowblood ~= maxhp and maxhp ~= nil and maxhp > 0 then
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP,maxhp)
		end
	end

    if s_getSceneVar(cid,1,scene228_relive_next) > 0 then
		s_setSceneVar(cid,1,scene228_relive_next,s_getSceneVar(cid,1,scene228_relive_next)+1) 
	end 
	--s_trace(">>>>>>>>>>>>>>>>>>1111111 count tttttt "..s_getSceneVar(cid,1,scene228_relive_next))
    if s_getSceneVar(cid,1,scene228_relive_next) == 4 then
		for i = 1,table.getn(list), 2 do
			if list[i] == SCENE_ENTRY_PLAYER then
				s_setVar(list[i+1],149,62,1)
				s_sendHLSYReliveInfo(list[i+1],1)
			end
		end
    	s_setSceneVar(cid,1,scene228_relive_next,0)
	end 
end

--3秒钟循环
function OnLoopCopyScene_3Sec_228(ctype,cid)
	self = CopySceneInfo_228 
    local curtime = s_getCurTime(TIME_ALLSECONDS)
    if curtime >= s_getSceneVar(cid,1,scene228_over_time) then
          s_setSceneVar(cid,1,scene228_over,1)
		  s_trace(cid.."scene228 time over ..curtime="..curtime.."..overtime="..s_getSceneVar(cid,1,scene228_over_time))
	end
	local overtime = s_getSceneVar(cid,1,scene228_over_time)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
    for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if overtime >= curtime then
				s_setVar(list[i+1],149,61,overtime - curtime)
			end
		end
    end
end



--玩家进入副本提示
function CopySceneInfo_228:OnPlayerIntoCopyScene(cid,uid)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)
    local curtime = s_getCurTime(TIME_ALLSECONDS)
	local lasttime = s_getSceneVar(cid,1,scene228_over_time)
	local time = 0
	local remain = 0
	if lasttime >= curtime then
		time = lasttime - curtime
	end
	local count = s_getSceneVar(cid,1,scene228_count)
	if scene228_boss_count >= count then
		remain = scene228_boss_count - count + 1
	end
    local baseid = s_getSceneVar(cid,1,scene228_relive_baseid)
    local ctype = s_getSceneVar(cid,1,scene228_relive_ctype)
	local npcid = s_getSceneVar(cid,1,scene228_boss_npcid)
	s_sendHLSYSceneInfo(cid,time,remain,scene228_boss_total,baseid,ctype)
	s_sendHLSYBossInfo(uid,npcid,baseid,ctype)
	s_setVar(uid,149,57,npcid)
	s_setVar(uid,149,60,cid)
	s_trace(uid.." 进入深渊一层副本 sceneid =="..cid.." npcid "..npcid.." baseid "..baseid)
	--s_setVar(uid,149,59,1)
	
	local find = false
	for i=51,55,1 do
		if s_getSceneVar(cid,1,i) == uid then
			find = true
		end 
	end 
	if find == false then
		if s_getSceneVar(cid,1,scene228_relive_uid1) == 0 then
			s_setSceneVar(cid,1,scene228_relive_uid1,uid) 
		elseif s_getSceneVar(cid,1,scene228_relive_uid2)  == 0 then
			s_setSceneVar(cid,1,scene228_relive_uid2,uid) 
		elseif s_getSceneVar(cid,1,scene228_relive_uid3)  == 0 then 
			s_setSceneVar(cid,1,scene228_relive_uid3,uid) 
		elseif s_getSceneVar(cid,1,scene228_relive_uid4)  == 0 then 
			s_setSceneVar(cid,1,scene228_relive_uid4,uid) 
		elseif s_getSceneVar(cid,1,scene228_relive_uid5)  == 0 then 
			s_setSceneVar(cid,1,scene228_relive_uid5,uid) 
		end
	end 
end

--玩家离开副本
function CopySceneInfo_228:OnPlayerLeaveCopyScene(cid,uid)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)
	s_setVar(uid,149,60,0)
	s_trace(uid.." 离开深渊一层副本 sceneid =="..cid)
    --完成主线任务
	--local taskProcess = s_getTaskValue(uid, 1135, TaskValue_Process)
	--if taskProcess == TaskProcess_Doing then
    --    AddRoleTaskOperate(uid,1135)
    --end

    -- 刷新副本任务次数显示
    --RefreshCopyDailyInfo(uid)
end

--玩家复活
function CopySceneInfo_228:OnPlayerRelive(uid, rtype)
	if rtype == 3 or rtype == 4 then
		s_goto(SCENE_ENTRY_PLAYER,uid,scene228_relive_posx,scene228_relive_posy)
	end
end

--boss死亡回调
function CopySceneInfo_228:CopySceneInfo_228_boss_death_callback(uid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
    local baseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
    local point = 0

    local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
    local num = 0;
    local vlist = {}
    --for i = 1,table.getn(list), 2 do
        --if list[i] == SCENE_ENTRY_PLAYER then
           --给玩家增加副本积分
          -- s_setVar(list[i+1],290,4,s_getVar(list[i+1],290,4) + point)
          -- --这儿只作记录用
          -- s_setSceneVar(cid,2,list[i+1],s_getSceneVar(cid,2,list[i+1])+point)
          -- table.insert(vlist,list[i+1]);
          -- table.insert(vlist,s_getSceneVar(cid,2,list[i+1]));
          -- num = num + 1;
        --end
    --end

	local ctype = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_TYPE)
	--s_sendCopyVar(ctype, cid,0,num,vlist)

    s_debug("scene228 boss_death sceneid ==>> "..cid.." baseid "..baseid.." dead npcid =>>"..s_getSceneVar(cid,1,scene228_boss_npcid)
.." count =>> "..s_getSceneVar(cid,1,scene228_count).." uid =>> "..uid.." ctype =>> "..self.ctype)
	local count = s_getSceneVar(cid,1,scene228_count)
	local awardbaseid = baseid
	local awardnpcid = s_getSceneVar(cid,1,scene228_boss_npcid)

	--local nindex =  count + 1
	--self.ctype = 2
	local iindex = math.random(1,4)
	self.ctype = iindex 
	local nindex = 4 * count + iindex
	--self.ctype = iindex
	if self.bossinfo[nindex] ~= nil and count < scene228_boss_count  then
			local npcid = s_sysSummon(self.bossinfo[nindex].bossid, cid, self.bossinfo[nindex].posx,self.bossinfo[nindex].posy ,self.bossinfo[nindex].ai,self.bossinfo[nindex].recycle)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_COPYSCENE_MAPID,227)
			s_setSceneVar(cid,1,scene228_count,count + 1)
			self.npcid = npcid
			self.baseid = self.bossinfo[nindex].bossid
			s_setSceneVar(cid,1,scene228_boss_npcid,self.npcid)
			local maxhp	= s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
			s_debug("scene228 newboss sceneid ="..cid.." npcid =>>"..npcid.." baseid "..self.baseid.." count =>> "..s_getSceneVar(cid,1,scene228_count).." maxhp="..maxhp)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP,maxhp)
			local curtime = s_getCurTime(TIME_ALLSECONDS)
			local lasttime = s_getSceneVar(cid,1,scene228_over_time)
    		s_setSceneVar(cid,1,scene228_boss_attcount,1)
			s_setSceneVar(cid,1,scene228_boss_blood	,maxhp)
			s_setSceneVar(cid,1,scene228_relive_baseid,self.baseid)
			s_setSceneVar(cid,1,scene228_relive_ctype,self.ctype)
			self.blood = maxhp
	--s_trace(" >>>>>>>228 cid ="..cid.." npcid = "..npcid.." "..(blood or 0).." "..(nowblood or 0).." "..(maxhp or 0))
			local time = 0
			local remain = 0
			if lasttime >= curtime then
				time = lasttime - curtime
			end
			local count = s_getSceneVar(cid,1,scene228_count)
			if scene228_boss_count >= count then
				remain = scene228_boss_count - count + 1
			end
			--s_sendHLSYSceneInfo(cid,time,remain,scene228_boss_total,self.baseid,self.ctype)
			if s_sendHLSYSceneInfo(cid,time,remain,remain+1,self.baseid,self.ctype) == 0 then
				s_trace(cid.."..scene228 send remain err")
			end
			--s_sendHLSYBossInfo(uid,self.npcid,self.baseid,self.ctype)
			for i = 1,table.getn(list), 2 do
				if list[i] == SCENE_ENTRY_PLAYER then
				     s_setVar(list[i+1],149,57,self.npcid)
					s_setVar(list[i+1],149,62,0)
				end
			end

			-- 发送奖励
			local awardinfo = AbyssDataBase.query(awardbaseid) 
			if awardinfo == nil then
				s_trace(cid.."228 Copy find Boss Award nil "..awardbaseid)
			end 
			local bossname = s_getValue(SCENE_ENTRY_NPC,awardnpcid,VALUE_TYPE_NAME)
			for i=51,55,1 do
				if s_getSceneVar(cid,1,i) > 0 and awardinfo ~= nil then
					s_sysMail(s_getSceneVar(cid,1,i),"混乱深渊击杀"..(bossname or "").."奖励",0,awardinfo.award,1,"1-1",0, "混乱深渊Boss奖励")
					s_trace(s_getSceneVar(cid,1,i).." 深渊邮件奖励 baseid "..awardbaseid)
				end 
				if s_getSceneVar(cid,1,i) > 0 then
					if s_sendHLSYBossInfo(s_getSceneVar(cid,1,i),npcid,self.baseid,self.ctype) == 0 then
						s_trace(cid.."..scene228 send bossinfo err"..s_getSceneVar(cid,1,i))
					end
					s_setVar(s_getSceneVar(cid,1,i),149,57,npcid)
				end
			end 
	end
	
	if count == scene228_boss_count  then
		--创建传送阵
		local teamid = s_getSceneVar(cid,1,scene228_teamid)
		if teamid == 0  then 
			teamid = s_getField(uid,UserVar_AbyssTeamid)
		end
		s_debug("scene228 over teamid  =>> "..teamid)
		if teamid > 0 then 
			s_abysscopyIntoCopy(uid,teamid,228,5)--228 地图配表 混乱深渊2层 5是类型
		end
         --s_setSceneVar(cid,1,scene228_over,1)
		s_setSceneVar(cid,1,scene228_over_time,s_getCurTime(TIME_ALLSECONDS) + 60)--考虑到没有在副本没离开，就无法再进入下一层
		for i = 1,table.getn(list), 2 do
			if list[i] == SCENE_ENTRY_PLAYER then
				     s_setVar(list[i+1],149,57,0)
					s_setVar(list[i+1],149,62,0)
			end
		end
		local time = 0
		local lasttime = s_getSceneVar(cid,1,scene228_over_time)
		local remain = 0
		local curtime = s_getCurTime(TIME_ALLSECONDS)
		if lasttime >= curtime then
			time = lasttime - curtime
		end
		--s_sendHLSYSceneInfo(cid,time,0,scene228_boss_total,0,0)
		s_sendHLSYSceneInfo(cid,time,0,1,0,0)
		s_setSceneVar(cid,1,scene228_boss_npcid,0)

			-- 发送奖励
			local awardinfo = AbyssDataBase.query(awardbaseid) 
			if awardinfo == nil then
				s_trace(cid.."228 Copy find Boss Award nil "..awardbaseid)
			end 
			local bossname = s_getValue(SCENE_ENTRY_NPC,awardnpcid,VALUE_TYPE_NAME)
			for i=51,55,1 do
				if s_getSceneVar(cid,1,i) > 0 and awardinfo ~= nil then
					s_sysMail(s_getSceneVar(cid,1,i),"混乱深渊击杀"..(bossname or "").."奖励",0,awardinfo.award,1,"1-1",0, "混乱深渊Boss奖励")
					s_trace(s_getSceneVar(cid,1,i).." 深渊邮件奖励 baseid "..awardbaseid)
				end 
			end 

	end

end

for i = 23001,23020 do
        RegisterMyNpcDeadEvent(i,"CopySceneInfo_228:CopySceneInfo_228_boss_death_callback($1,$2)")
end

----守护图腾死亡回调
--function CopySceneInfo_228_guard_death_callback(uid,npcid)
--	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
--    s_debug("图腾被杀死了")
--    s_copyInfo(cid,"保护图腾失败",ChatPos_Tips)
--    s_setSceneVar(cid,1,defencetower_is_over,1)
--    s_setSceneVar(cid,1,defencetower_recycle_over,20)
--    s_sendCopyCustomTime(cid,1,2)
--end

--守护图腾死亡事件
--RegisterCopyNpcDeadEvent(8401,228,0,"CopySceneInfo_228:dead_8401($1,$2)")
--普通怪物死亡事件

--for i=0,9 do
--    RegisterNpcDeadEvent(8300+i,"CopySceneInfo_228:CopySceneInfo_228_monster_death_callback($1,$2)")
--    RegisterNpcDeadEvent(8330+i,"CopySceneInfo_228:CopySceneInfo_228_monster_death_callback($1,$2)")
--    RegisterNpcDeadEvent(8360+i,"CopySceneInfo_228:CopySceneInfo_228_monster_death_callback($1,$2)")
--    --boss回调
--    if i < 5 then
--        RegisterNpcDeadEvent(8501+i,"CopySceneInfo_228:CopySceneInfo_228_boss_death_callback($1,$2)")
--    end
--end



--下面的不用了，副本的只能相同类型只能有一个回调,还没找到批量的方法
--RegisterCopyNpcDeadEvent(8330,228,226,"CopySceneInfo_181:dead8300_8515($1,$2)")
--RegisterCopyNpcDeadEvent(8360,228,226,"CopySceneInfo_181:dead8300_8515($1,$2)")
--RegisterCopyNpcDeadEvent(8331,228,226,"CopySceneInfo_226:dead8300_8515($1,$2)")
