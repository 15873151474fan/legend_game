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
scene229_teamid						= 21		--混乱深渊存储队伍id
scene229_count						= 22		--boss刷新数量
scene229_over						= 10
scene229_begin_time					= 1
scene229_over_time					= 2
scene229_relive_posx				= 31 --复活坐标x
scene229_relive_posy				= 13
scene229_boss_count					= 1
scene229_boss_total					= 6
scene229_boss_resettime				= 15
scene229_boss_npcid					= 40
scene229_boss_blood					= 41
scene229_boss_attcount				= 42
scene229_relive_next				= 43

scene229_relive_uid1			= 51	--副本用户id存储
scene229_relive_uid2			= 52
scene229_relive_uid3			= 53
scene229_relive_uid4			= 54
scene229_relive_uid5			= 55
scene229_relive_baseid			= 56
scene229_relive_ctype			= 57

--2 --xx玩家所获得的积分



CopySceneInfo_229 =
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
		--[1]={bossid= 11027 ,posx = 24 ,posy=14 ,ai = 103 ,recycle = 1,},
		[1]={bossid= 23021 ,posx = 18 ,posy=13 ,ai = 103 ,recycle = 1,},
		[2]={bossid= 23022 ,posx = 18 ,posy=13 ,ai = 103 ,recycle = 1,},
		[3]={bossid= 23023 ,posx = 18 ,posy=13 ,ai = 103 ,recycle = 1,},
		--[1]={bossid= 23019 ,posx = 18 ,posy=14 ,ai = 103 ,recycle = 1,},
		--[2]={bossid= 23020 ,posx = 18 ,posy=14 ,ai = 103 ,recycle = 1,},
		--[3]={bossid= 23021 ,posx = 18 ,posy=14 ,ai = 103 ,recycle = 1,},
	},
}


--副本创建初始化
function CopySceneInfo_229:InitCopyScene(cid)
    --s_setSceneVar(cid,1,defencetower_first_time,10)

	s_setSceneVar(cid,1,scene229_over_time,s_getCurTime(TIME_ALLSECONDS) + 1199)
	--local index = 1
	local index = math.random(1,3)
	self.ctype = index + 2
    local npcid = s_sysSummon(self.bossinfo[index].bossid, cid, self.bossinfo[index].posx,self.bossinfo[index].posy ,self.bossinfo[index].ai,self.bossinfo[index].recycle)
    s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_COPYSCENE_MAPID,228)
	self.npcid = npcid
	self.baseid = self.bossinfo[index].bossid
    s_setSceneVar(cid,1,scene229_count,1)
	self.blood = s_getValue(VALUE_TYPE_HP,npcid,VALUE_TYPE_HP)
    s_setSceneVar(cid,1,scene229_boss_npcid,self.npcid)
    s_setSceneVar(cid,1,scene229_boss_blood	,self.blood)
    s_setSceneVar(cid,1,scene229_boss_attcount,1)
    s_setSceneVar(cid,1,scene229_relive_baseid,self.bossinfo[index].bossid)
    s_setSceneVar(cid,1,scene229_relive_ctype,self.ctype)

    --s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_HP, 910000000)
    --s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP, 910000000)
    s_debug("scene229 sceneid=="..cid.." baseid=="..self.baseid.." npcid=="..npcid.." teamid=="..s_getSceneVar(cid,1,scene229_teamid).." count=="..s_getSceneVar(cid,1,scene229_count).." ctype=="..self.ctype.." blood=="..self.blood)
end
--玩家死亡
function CopySceneInfo_229:OnPlayerDie(cid,uid,murder,dtype)

    --ReturnUserHome(uid,"CopySceneInfo_229:OnPlayerDie")
end

--销毁副本
function CopySceneInfo_229:FinalCopyScene(cid)

end

--清空npc
function CopySceneInfo_229:ClearNpc(cid)
    --清空npc
    local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
    for i = 1,table.getn(list), 2 do --清理NPC
		if list[i+1] > 0 then 
        	s_clearNpc(list[i+1])
		end
    end
end

--1秒钟循环
function OnLoopCopyScene_1Sec_229(ctype,cid)
	self = CopySceneInfo_229 
    local curtime = s_getCurTime(TIME_ALLSECONDS)
    if  s_getSceneVar(cid,1,scene229_over) == 1 then
        CopySceneInfo_229:ClearNpc(cid)
		s_clearCopy(cid)
	end
    local blood = s_getSceneVar(cid,1,scene229_boss_blood)
	local attcount = s_getSceneVar(cid,1,scene229_boss_attcount)
	local npcid = s_getSceneVar(cid,1,scene229_boss_npcid)
	local nowblood = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	local maxhp	= s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MAXHP)
	if attcount >= scene229_boss_resettime and npcid > 0 then
		if blood == nowblood and maxhp ~=nil and maxhp >0 then
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP,maxhp)
		else
			s_setSceneVar(cid,1,scene229_boss_blood	,nowblood)
		end
		s_setSceneVar(cid,1,scene229_boss_attcount,0)
		s_trace(" >>>>>229 "..npcid.." "..(blood or 0).." "..(nowblood or 0).." "..(maxhp or 0))
	end
	s_setSceneVar(cid,1,scene229_boss_attcount,s_getSceneVar(cid,1,scene229_boss_attcount)+1)

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
		if s_getSceneVar(cid,1,scene229_relive_next) ==  0 then
    		s_setSceneVar(cid,1,scene229_relive_next,1)
		end 
		if nowblood ~= maxhp and maxhp ~=nil and maxhp >0 then
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP,maxhp)
		end
	end
	if s_getSceneVar(cid,1,scene229_relive_next) > 0 then
		s_setSceneVar(cid,1,scene229_relive_next,s_getSceneVar(cid,1,scene229_relive_next)+1) 
	end 
	--s_trace(">>>>>>>>>>>>>>>>>>222222 count tttttt "..s_getSceneVar(cid,1,scene229_relive_next))
    if s_getSceneVar(cid,1,scene229_relive_next) == 4 then
		for i = 1,table.getn(list), 2 do
			if list[i] == SCENE_ENTRY_PLAYER then
				s_setVar(list[i+1],149,62,1)
				s_sendHLSYReliveInfo(list[i+1],1)
			end
		end
    	s_setSceneVar(cid,1,scene229_relive_next,0)
	end 

end

--3秒钟循环
function OnLoopCopyScene_3Sec_229(ctype,cid)
	self = CopySceneInfo_229 
    local curtime = s_getCurTime(TIME_ALLSECONDS)
    if curtime >= s_getSceneVar(cid,1,scene229_over_time) then
          s_setSceneVar(cid,1,scene229_over,1)
	end
	local overtime = s_getSceneVar(cid,1,scene229_over_time)
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
function CopySceneInfo_229:OnPlayerIntoCopyScene(cid,uid)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local lasttime = s_getSceneVar(cid,1,scene229_over_time)
	local time = 0
	local remain = 0
	if lasttime > curtime then
		time = lasttime - curtime
	end
	--local count = s_getSceneVar(cid,1,scene229_count)
	--if scene229_boss_count >= count then
	--	remain = scene229_boss_count - count + 1
	--end
    local baseid = s_getSceneVar(cid,1,scene229_relive_baseid)
    local ctype = s_getSceneVar(cid,1,scene229_relive_ctype)
	local remain = s_getSceneVar(cid,1,scene229_count)
	local npcid = s_getSceneVar(cid,1,scene229_boss_npcid)
	s_sendHLSYSceneInfo(cid,time,remain,scene229_boss_total,baseid,ctype)
	s_sendHLSYBossInfo(uid,npcid,baseid,ctype)
	s_setVar(uid,149,57,npcid)
	s_setVar(uid,149,60,cid)
	s_trace(uid.." 进入深渊二层副本 sceneid =="..cid.." npcid "..npcid.." baseid "..baseid)

	local find = false
	for i=51,55,1 do
		if s_getSceneVar(cid,1,i) == uid then
			find = true
		end 
	end 

	if find == false then
		if s_getSceneVar(cid,1,scene229_relive_uid1) == 0 then
			s_setSceneVar(cid,1,scene229_relive_uid1,uid) 
		elseif s_getSceneVar(cid,1,scene229_relive_uid2)  == 0 then
			s_setSceneVar(cid,1,scene229_relive_uid2,uid) 
		elseif s_getSceneVar(cid,1,scene229_relive_uid3)  == 0 then 
			s_setSceneVar(cid,1,scene229_relive_uid3,uid) 
		elseif s_getSceneVar(cid,1,scene229_relive_uid4)  == 0 then 
			s_setSceneVar(cid,1,scene229_relive_uid4,uid) 
		elseif s_getSceneVar(cid,1,scene229_relive_uid5)  == 0 then 
			s_setSceneVar(cid,1,scene229_relive_uid5,uid) 
		end
	end 

end

--玩家离开副本
function CopySceneInfo_229:OnPlayerLeaveCopyScene(cid,uid)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)
	s_setVar(uid,149,60,0)
	s_trace(uid.." 离开深渊二层副本 sceneid =="..cid)
    --完成主线任务
	--local taskProcess = s_getTaskValue(uid, 1135, TaskValue_Process)
	--if taskProcess == TaskProcess_Doing then
    --    AddRoleTaskOperate(uid,1135)
    --end

    -- 刷新副本任务次数显示
    --RefreshCopyDailyInfo(uid)
end

--玩家复活
function CopySceneInfo_229:OnPlayerRelive(uid, rtype)
	if rtype == 3 or rtype == 4 then
		s_goto(SCENE_ENTRY_PLAYER,uid,scene229_relive_posx,scene229_relive_posy)
	end
end

--boss死亡回调
function CopySceneInfo_229:CopySceneInfo_229_boss_death_callback(uid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
    local baseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
    s_debug("scene229 boss_death sceneid ==>> "..cid.." baseid "..baseid.." dead npcid =>>"..self.baseid.." count =>> "..s_getSceneVar(cid,1,scene229_count).." uid =>> "..uid.." ctype =>> "..self.ctype)
    local point = 0

	local awardbaseid = baseid
	local awardnpcid = s_getSceneVar(cid,1,scene229_boss_npcid)

    local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
    local num = 0;
    local vlist = {}
    for i = 1,table.getn(list), 2 do
        if list[i] == SCENE_ENTRY_PLAYER then
           --给玩家增加副本积分
          -- s_setVar(list[i+1],290,4,s_getVar(list[i+1],290,4) + point)
          -- --这儿只作记录用
          -- s_setSceneVar(cid,2,list[i+1],s_getSceneVar(cid,2,list[i+1])+point)
          -- table.insert(vlist,list[i+1]);
          -- table.insert(vlist,s_getSceneVar(cid,2,list[i+1]));
          -- num = num + 1;
		  --s_setVar(list[i+1],149,57,self.npcid)
        --end
		     s_setVar(list[i+1],149,57,0)
			s_setVar(list[i+1],149,62,0)
		end
    end

	local ctype = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_TYPE)
     --s_setSceneVar(cid,1,scene229_over,1)
	s_setSceneVar(cid,1,scene229_over_time,s_getCurTime(TIME_ALLSECONDS) + 60)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local lasttime = s_getSceneVar(cid,1,scene229_over_time)
	local time = 0
	local remain = 0
	if lasttime >= curtime then
		time = lasttime - curtime
	end

	self.baseid=0
	self.ctype=0
	s_setSceneVar(cid,1,scene229_count,0)
    s_setSceneVar(cid,1,scene229_boss_npcid,0)
	s_sendHLSYSceneInfo(cid,time,0,0,0,0)
	-- 发送奖励
	local awardinfo = AbyssDataBase.query(awardbaseid) 
	if awardinfo == nil then
		s_trace(cid.."229 Copy find Boss Award nil "..awardbaseid)
	end 
	local bossname = s_getValue(SCENE_ENTRY_NPC,awardnpcid,VALUE_TYPE_NAME)
	for i=51,55,1 do
		if s_getSceneVar(cid,1,i) > 0 and awardinfo ~= nil then
			s_sysMail(s_getSceneVar(cid,1,i),"混乱深渊击杀"..(bossname or "").."奖励",0,awardinfo.award,1,"1-1",0, "混乱深渊Boss奖励")
			s_trace(s_getSceneVar(cid,1,i).." 深渊邮件奖励 baseid "..awardbaseid)
		end 
	end 


	--s_sendCopyVar(ctype, cid,0,num,vlist)
	

    --s_debug("scene229 boss_death id =>>"..baseid.." count =>> "..s_getSceneVar(cid,22))
	--local count = s_getSceneVar(cid,22)
	--if self.bossinfo[count] ~= nil and count < 6 then
	--	if self.bossinfo[count].nextid > 0  then
	--		local npcid = s_sysSummon(self.bossinfo[count + 1].bossid, cid, self.bossinfo[count + 1].posx,self.bossinfo[count + 1].posy , posx,self.bossinfo[count + 1].ai,posx,self.bossinfo[count + 1].recycle)
	--		s_setSceneVar(cid,1,scene229_count,count + 1)
	--		s_debug("scene229 newboss  npcid =>>"..npcid.." count =>> "..s_getSceneVar(cid,22))
	--	end
	--end
	--if count == 6 then
	--	s_abysscopyIntoCopy(uid,s_getSceneVar(cid,scene229_teamid),229,5)
	--end

end

--RegisterMyNpcDeadEvent(11027,"CopySceneInfo_229:CopySceneInfo_229_boss_death_callback($1,$2)")

for i=23021,23023 do
        RegisterMyNpcDeadEvent(i,"CopySceneInfo_229:CopySceneInfo_229_boss_death_callback($1,$2)")
end
 
----守护图腾死亡回调
--function CopySceneInfo_229_guard_death_callback(uid,npcid)
--	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
--    s_debug("图腾被杀死了")
--    s_copyInfo(cid,"保护图腾失败",ChatPos_Tips)
--    s_setSceneVar(cid,1,defencetower_is_over,1)
--    s_setSceneVar(cid,1,defencetower_recycle_over,20)
--    s_sendCopyCustomTime(cid,1,2)
--end

--守护图腾死亡事件
--RegisterCopyNpcDeadEvent(8401,229,0,"CopySceneInfo_229:dead_8401($1,$2)")
--普通怪物死亡事件

--for i=0,9 do
--    RegisterNpcDeadEvent(8300+i,"CopySceneInfo_229:CopySceneInfo_229_monster_death_callback($1,$2)")
--    RegisterNpcDeadEvent(8330+i,"CopySceneInfo_229:CopySceneInfo_229_monster_death_callback($1,$2)")
--    RegisterNpcDeadEvent(8360+i,"CopySceneInfo_229:CopySceneInfo_229_monster_death_callback($1,$2)")
--    --boss回调
--    if i < 5 then
--        RegisterNpcDeadEvent(8501+i,"CopySceneInfo_229:CopySceneInfo_229_boss_death_callback($1,$2)")
--    end
--end



--下面的不用了，副本的只能相同类型只能有一个回调,还没找到批量的方法
--RegisterCopyNpcDeadEvent(8330,229,226,"CopySceneInfo_181:dead8300_8515($1,$2)")
--RegisterCopyNpcDeadEvent(8360,229,226,"CopySceneInfo_181:dead8300_8515($1,$2)")
--RegisterCopyNpcDeadEvent(8331,229,226,"CopySceneInfo_226:dead8300_8515($1,$2)")
