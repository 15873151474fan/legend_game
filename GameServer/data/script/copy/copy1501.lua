
--经验副本
defencetower_begin_time           = 1;        --活动开始时间
defencetower_over_time                = 2;        --活动结束时间
defencetower_monster_current      = 3;   --怪物当前波数
defencetower_monster_total        = 4;    --怪物总共波数
defencetower_beging               = 5;       --是否刷怪中
defencetower_is_over              = 6;      --是否已结束
defencetower_recycle_over         = 7;      --回收倒计时,胜利或失败的缓冲时间，然后清理玩家出副本
success_over_time                = 8;        --打怪结束，领取奖励时间

CopySceneInfo_1501 = {}

function CopySceneInfo_1501:InitCopyScene(cid)
	s_debug(">>>>>>>>>获得加速buff加速,速度npcid:"..cid)
	--s_setSceneVar(cid,1,defencetower_over_time,s_getCurTime(TIME_ALLSECONDS) + 1800)
	--[[local chapterid = 0
	chapterid = s_getVar(uid,140,95)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>怪物死掉时发送 chapterid = "..chapterid)
	local chapterName = SceneDataBase.query(chapterid)
	local npcallnum = chapterName.monsnum 
        for i = 1,npcallnum,1 do
		s_sysSummon(50001, cid, 12, 9, 0, 1)
	end]]--
end
function CopySceneInfo_1501:ClearNpc(cid)
     --清空npc
     local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
     for i = 1,table.getn(list), 2 do --清理NPC
         s_clearNpc(list[i+1])
     end
end

--玩家复活
function CopySceneInfo_1501:OnPlayerRelive(uid, rtype)
         if rtype == 3 or rtype == 4 then
                 s_goto(SCENE_ENTRY_PLAYER,uid,11,21)
         end
end

--玩家离开副本
function CopySceneInfo_1501:OnPlayerLeaveCopyScene(sceneid, uid)
    	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
        if monstercount ~= 0 then
                s_copyInfo(sceneid,"材料副本挑战失败！",ChatPos_Tips);
        end
	s_clearCopy(sceneid)
	s_setVar(uid,140,144,0)
end

--玩家进入副本提示
function CopySceneInfo_1501:OnPlayerIntoCopyScene(cid,uid)
	--local monstercount = s_getCopyEntryCount(cid, SCENE_ENTRY_NPC)
	--s_sendCopyZoneOne(cid,tostring(monstercount))
	s_debug("玩家进入材料副本1111")
	local chapterid = 0
	chapterid = s_getVar(uid,140,95)
	local chapterName = SceneDataBase.query(chapterid)
	
	s_setSceneVar(cid,1,defencetower_over_time,s_getCurTime(TIME_ALLSECONDS) + chapterName.timelimit)
	
	local npcallnum = 0
	npcallnum = chapterName.monsnum
	--[[for i = 1,npcallnum,1 do
		if chapterid == 1 then
			local mosid = JewelDataBase.query(i)
			local msid = mosid.monsterid
			s_sysSummon(msid, cid, 12, 9, 0, 1)
		elseif chapterid == 2 then
			local mosid = SoulDataBase.query(i)
			local msid = mosid.monsterid
			s_sysSummon(msid, cid, 12, 9, 0, 1)
		elseif chapterid == 3 then
			local mosid = WingsSceneDataBase.query(i)
			local msid = mosid.monsterid
			s_sysSummon(msid, cid, 12, 9, 0, 1)
		elseif chapterid == 4 then
			local mosid = ShieldDataBase.query(i)
			local msid = mosid.monsterid
			s_sysSummon(msid, cid, 12, 9, 0, 1)
		end
	end]]--
	local snum = 0
        for i = 1,4,1 do
                local mosid = SceneDataBase.query(i)
                snum = snum + mosid.monsnum
        end     
        for i = 1,snum,1 do
                local mosid = SceneMonsterDataBase.query(i)
                if mosid.dwID == 1 then     
                        s_sysSummon(mosid.monsterid, cid, mosid.posx, mosid.posy, 0, 1)
                end     
        end
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>怪物死掉时发送 chapterid = "..chapterid)

	local monstercount = s_getCopyEntryCount(cid, SCENE_ENTRY_NPC)	
	s_sendCopyZoneOne(cid,monstercount..","..npcallnum)
        local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
        local uid = 0
        for i = 1,table.getn(list), 2 do
                if list[i] == SCENE_ENTRY_PLAYER then
                        uid = list[i+1]
                end
        end
        s_setVar(uid,140,93,0)
	--进入副本标志
	s_setVar(uid,140,144,1)
       -- s_setVar(uid,140,94,s_getVar(uid,140,94)-1)
    local overtime = s_getSceneVar(cid,1,defencetower_over_time) - s_getCurTime(TIME_ALLSECONDS)
    s_sendCopyTime(cid,overtime);
end

function OnLoopCopyScene_1Sec_1501(ctype,cid)
    local curtime = s_getCurTime(TIME_ALLSECONDS)
    --检测活动时间结束
        local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
        local uid = 0
        for i = 1,table.getn(list), 2 do
                if list[i] == SCENE_ENTRY_PLAYER then
                        uid = list[i+1]
                end
        end
	if s_getVar(uid,140,93) == 2 then 
		if curtime >= s_getSceneVar(cid,1,success_over_time) then	
			local copyid = 0
			copyid = s_getVar(uid,140,95)
			s_debug(">>>>>>>>>>>>>>>>>自动发奖励 copyid = "..copyid)
			local chapterName = SceneDataBase.query(copyid)
			GetRewardByMail(uid,chapterName.item,"材料副本获得","材料副本未领取奖励！",1,false,0)
			--sendMaterialReward(uid,1,copyid)
			s_setVar(uid,140,93,1)
			CopySceneInfo_1501:ClearNpc(cid)
			s_clearCopy(cid)	
		end
	end
	if s_getVar(uid,140,93) == 1 then
		CopySceneInfo_1501:ClearNpc(cid)
		s_clearCopy(cid)
		s_setVar(uid,140,93,0)
	end
	local monstercount = s_getCopyEntryCount(cid, SCENE_ENTRY_NPC)
	if curtime >= s_getSceneVar(cid,1,defencetower_over_time) and monstercount ~= 0 then
		--s_sysInfo(uid,"材料副本挑战失败！")
		s_copyInfo(cid,"材料副本挑战失败！",ChatPos_Tips);
		CopySceneInfo_1501:ClearNpc(cid)
		s_clearCopy(cid)
		--s_sysInfo(uid,"材料副本挑战失败！")
	end
        --local monstercount = s_getCopyEntryCount(cid, SCENE_ENTRY_NPC)
        if curtime >= s_getSceneVar(cid,1,defencetower_over_time) and s_getSceneVar(cid,1,defencetower_is_over) == 0 then
                s_setSceneVar(cid,1,defencetower_is_over,1)
        end
	--local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	--s_debug(">>>>>>>>>>>>>>>>>>>>....怪物死了，发送给客户端monstercount = "..monstercount)
end

--[[
function sendMaterialReward(uid,itemtimes,copyid)
	--local chapterid = 0
	--chapterid = s_getVar(uid,140,95)
	if itemtimes == 3 then
		local chapterName = SceneDataBase.query(copyid)
		local usemoney = chapterName.threecost
		if s_removeMoney(uid,MoneyType_Gold,usemoney,"材料副本三倍领取") ~= VALUE_OK then
			s_sysInfo(uid,"元宝不足",ChatPos_Tips)
			return
		end
	end
	local chapterName = SceneDataBase.query(copyid)
	if s_getVar(uid,140,93) == 2 then
		GetRewardWithMail(uid,chapterName.item,"材料副本获得",itemtimes,false,AddItemAction_Task)
		s_setVar(uid,140,93,1)
	end
	s_setVar(uid,140,95,0)
end
]]--
function CopySceneInfo_1501_MyNpcDeadNoraml(uid, npcid)
	s_debugUser(uid,">>>>>>>>>怪物死亡时发送给客户端 npcid = :"..npcid)
	local sceneid = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_SCENE_ID)
	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	local chapter = 0
	chapter = s_getVar(uid,140,95)
	local chapterName = SceneDataBase.query(chapter)	


	s_debugUser(uid,">>>>>>>>>>>>>>>>>怪物死亡时发送给客户端 monstercount = "..monstercount)
	if monstercount == 0 then
		MaterialSuccess(uid)
		s_setSceneVar(sceneid,1,success_over_time,s_getCurTime(TIME_ALLSECONDS) + chapterName.timelimit)
		s_debugUser(uid,">>>>>>>>>怪物死亡了，看发不发")
	end
        local npcallnum = 0
        npcallnum = chapterName.monsnum

        s_sendCopyZoneOne(sceneid,monstercount..","..npcallnum)
		
	--s_sendCopyZoneOne(sceneid,tostring(monstercount))
	if monstercount == 0 then
		s_setVar(uid,140,93,2)
	end
end

function CopySceneInfo_1501:RegisterNpcDead()
	local monsterdatas = SceneMonsterDataBase
	for _,monster in ipairs(monsterdatas) do
		if type(monster) == "table" and monster.dwID == 1 then
			RegisterMyNpcDeadEvent(monster.monsterid,"CopySceneInfo_1501_MyNpcDeadNoraml($1,$2)")
		end
	end
end

CopySceneInfo_1501:RegisterNpcDead()

