--守卫战城副本
--副本变量
--1_1_ 当前守卫切换
--1_2  开始刷怪
--1_3  当前刷怪index
--1_4  进入玩家的id
--1_5  倒计时,结束后回收副本
--1_6  刷怪倒计时
CopySceneInfo_2001 =
{
	maxplayernum = 1,

	--初始化副本的操作
    --三种类型的守卫id
    whiteGuard = {9301,9302,9303,9304,9305,9306},
    greeGuard  = {9311,9312,9313,9314,9315,9316},
    blueGuard  = {9321,9322,9323,9324,9325,9326},

    --守卫位置
    guardPos  = {{6,12},{11,12},{16,12},{21,12},{26,12},{31,12}},
	initcopy =
	{
		action =
		{
			--{s_copySetLifeTime,{480}},
			--{s_copySummonNpc,{305,2,15,15,}},
		},
	},

	playerinto =
	{
		action =
		{
			{s_copyZoneOne,{"区域一"}},
			{s_copyZoneTwo,{"区域二"}},
			{s_copyZoneThree,{"区域三"}},
			--{s_copyTime,{480}},

			--{s_copySetSceneVar,{1,1,1}},
			--{s_copyRandomSetSceneVar,{1,5,1,1}},
		},
	},

}

--变量改变
function CopySceneInfo_2001:OnCopySceneVarChange(cid, key1, key2, newvalue, oldvalue)
    ----刷新守卫
    if key1 == 1 and key2 == 1 then
        --清空所有怪物
        local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
        for i = 1,table.getn(list), 2 do --清理NPC
            local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
            for j = 1,table.getn(self.whiteGuard) do
                if self.whiteGuard[j] == baseid then
                    s_clearNpc(list[i+1])
                end
            end
            for j = 1,table.getn(self.greeGuard) do
                if self.greeGuard[j] == baseid then
                    s_clearNpc(list[i+1])
                end
            end
            for j = 1,table.getn(self.blueGuard) do
                if self.blueGuard[j] == baseid then
                    s_clearNpc(list[i+1])
                end
            end

        end
        --普通守卫
        local masterid = s_getSceneVar(cid,1,4)
        s_debug("masterid="..masterid)
        if newvalue == 1 then
            for i = 1,table.getn(self.whiteGuard) do
                local posx = self.guardPos[i][1]
                local posy = self.guardPos[i][2]
                local npcid = s_sysSummon(self.whiteGuard[i],cid,posx,posy,1006,1)
                s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,masterid)
            end
            s_sysInfo(masterid,"召唤普通守卫",ChatPos_Tips)
        --1刷新皇城守卫
        elseif newvalue == 2 then
            for i = 1,table.getn(self.greeGuard) do
                local posx = self.guardPos[i][1]
                local posy = self.guardPos[i][2]
                local npcid = s_sysSummon(self.greeGuard[i],cid,posx,posy,1006,1)
                s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,masterid)
            end
            s_sysInfo(masterid,"召唤精英守卫",ChatPos_Tips)
            --2刷新中都守卫
        elseif newvalue == 3 then
            for i = 1,table.getn(self.blueGuard) do
                local posx = self.guardPos[i][1]
                local posy = self.guardPos[i][2]
                local npcid = s_sysSummon(self.blueGuard[i],cid,posx,posy,1006,1)
                s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,masterid)
            end
            s_sysInfo(masterid,"召唤最强守卫",ChatPos_Tips)
        end

    elseif  key1 == 1 and key2 == 6 and newvalue == 10000 then
        local npc_count = table.getn(GuardCityNpcDataBase)
        s_sendCopyTime(cid,npc_count + 30);
        s_setSceneVar(cid,1,6,npc_count + 30);
    end

end

--副本主循环
function OnLoopCopyScene_5Sec_2001(ctype,cid)
    --开始刷怪
    if s_getSceneVar(cid,1,2) == 1 then
        local npc_count = table.getn(GuardCityNpcDataBase)
        local cur_index = s_getSceneVar(cid,1,3)
        if cur_index == 0 then
            cur_index = 1;
        end
        --s_debug("curindex="..cur_index)
        local monstercount = s_getCopyEntryCount(cid, SCENE_ENTRY_NPC)
        for i = 1,5 do
            if cur_index <= npc_count and monstercount < 30 then
                local npcid = s_sysSummon(GuardCityNpcDataBase[cur_index].npcid,cid,1,8,120,1)
                --local npcid = s_sysSummon(9212,cid,32,19,120,1)
                cur_index = cur_index + 1;
                s_setSceneVar(cid,1,3,cur_index)
            else
                s_setSceneVar(cid,1,2,0)
                s_setSceneVar(cid,1,3,1);   -- 重置刷怪index
                s_setSceneVar(cid,1,5,3);  --回收守卫倒计时
            end
            s_sendCopyZoneOne(cid,npc_count - cur_index)
        end
    end

    local endtime = s_getSceneVar(cid,1,6)
    if endtime >= 5 then
        endtime = endtime - 5
        s_setSceneVar(cid,1,6,endtime)
        if endtime > 0 and endtime < 10 then
            --完成主线任务
            local uid = s_getSceneVar(cid,1,4)
            local taskProcess = s_getTaskValue(uid, 5072, TaskValue_Process)
            if taskProcess == TaskProcess_Doing then
                AddRoleTaskOperate(uid,5072)
            end

        end
    else
        s_setSceneVar(cid,1,6,0)
    end

    if endtime <= 0 then
        endtime = 0;
    end
    --local overtime = s_getSceneVar(cid,1,5)
    if endtime <= 0 then
        --local monstercount = s_getCopyEntryCount(cid, SCENE_ENTRY_NPC)
        --s_debug("monstercount="..monstercount)

		local uid = s_getSceneVar(cid,1,4)
        --if monstercount < 2 then
            s_debug("开始回收守卫")
            --清空所有守卫
            local whiteGuard = {9301,9302,9303,9304,9305,9306}
            local greeGuard  = {9311,9312,9313,9314,9315,9316}
            local blueGuard  = {9321,9322,9323,9324,9325,9326}
            local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
            for i = 1,table.getn(list), 2 do --清理NPC
                local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
                for j = 1,table.getn(whiteGuard) do
                    if whiteGuard[j] == baseid then
                        s_clearNpc(list[i+1])
                    end
                end
                for j = 1,table.getn(greeGuard) do
                    if greeGuard[j] == baseid then
                        s_clearNpc(list[i+1])
                    end
                end
                for j = 1,table.getn(blueGuard) do
                    if blueGuard[j] == baseid then
                        s_clearNpc(list[i+1])
                    end
                end

            end
            --清空玩家召守卫标记
            s_setVar(uid,162,3,0);
            s_setSceneVar(cid,1,5,0);
        --end
            s_debug("回收守卫结束")
		--完成主线任务
		local taskProcess = s_getTaskValue(uid, 5072, TaskValue_Process)
		if taskProcess == TaskProcess_Doing then
			AddRoleTaskOperate(uid,5072)
		end

    end

end
--副本创建初始化
function CopySceneInfo_2001:InitCopyScene(ctype,cid)
    s_setSceneVar(cid,1,3,1)
    s_setSceneVar(cid,1,4,0)
    s_setSceneVar(cid,1,5,0);  --回收守卫倒计时

end

--玩家离开副本
function CopySceneInfo_2001:OnPlayerLeaveCopyScene(cid,uid)
    --s_setSceneVar(cid,1,3,0)
    --s_setSceneVar(cid,1,4,0)
    --s_setSceneVar(cid,1,2,0)
    --s_setVar(uid,162,4,0)
    --s_setVar(uid,162,1,0)
    --s_setVar(uid,162,3,0)
    --s_clearCopy(cid);
    --完成主线任务
	local taskProcess = s_getTaskValue(uid, 5072, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,5072)
    end

end

--玩家进入副本
function CopySceneInfo_2001:OnPlayerIntoCopyScene(cid,uid)
	s_trace("进入副本2222=="..cid.."=="..uid)
    s_setVar(uid,162,1,cid)
    --s_setSceneVar(cid,1,3,1)
    s_setSceneVar(cid,1,4,uid)
    --s_setSceneVar(cid,1,2,0)
    ----添加默认守卫
    --for i = 1,table.getn(self.whiteGuard) do
        --local posx = self.guardPos[i][1]
        --local posy = self.guardPos[i][2]
        --local npcid = s_sysSummon(self.whiteGuard[i],cid,posx,posy,1006,1)
        --s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,uid)
    --end
    local overtime = s_getSceneVar(cid,1,6)
    s_sendCopyTime(cid,overtime);


	local monstercount = s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	s_sendCopyZoneOne(cid,tostring(monstercount))
	local taskProcess = s_getTaskValue(uid,5072, TaskValue_Process)
     if taskProcess == TaskProcess_Doing then
         AddRoleTaskOperate(uid,5072)
     end 

end

--销毁副本
function CopySceneInfo_2001:FinalCopyScene(cid)
    local uid = s_getSceneVar(cid,1,4)
    s_setVar(uid,162,1,0);      --清空副本id的记录
    s_setVar(uid,162,3,0)
end

function CopySceneInfo_GuardCity_OnNpcDead9201(uid,npcid)
    local guardlevel = s_getVar(uid,162,3)
    if guardlevel == 0 then
        return;
    end
    local exp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_EXP)
    if exp <= 0 then
        return;
    end
    if guardlevel == 1 then
        exp = exp * 0.5;
		s_refreshExp(uid,exp,ExpType_GuardCopy,0)
    elseif guardlevel == 2 then
		s_refreshExp(uid,exp,ExpType_GuardCopy,0)
    end
    s_sysInfo(uid,"额外获得经验:"..exp)
end

--获得每日次数
function CopySceneInfo_2001:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30002)
	--dayNum
	table.insert(outvec, 3)
	--dayDoneNum
	table.insert(outvec, s_getVar(uid,162,2))
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)


end

--RegisterNpcDeadEvent(9201,"CopySceneInfo_GuardCity_OnNpcDead9201($1,$2)")
--RegisterNpcDeadEvent(9202,"CopySceneInfo_GuardCity_OnNpcDead9201($1,$2)")
--RegisterNpcDeadEvent(9203,"CopySceneInfo_GuardCity_OnNpcDead9201($1,$2)")
--RegisterNpcDeadEvent(9204,"CopySceneInfo_GuardCity_OnNpcDead9201($1,$2)")
--RegisterNpcDeadEvent(9205,"CopySceneInfo_GuardCity_OnNpcDead9201($1,$2)")
--RegisterNpcDeadEvent(9206,"CopySceneInfo_GuardCity_OnNpcDead9201($1,$2)")
--RegisterNpcDeadEvent(9207,"CopySceneInfo_GuardCity_OnNpcDead9201($1,$2)")
--RegisterNpcDeadEvent(9208,"CopySceneInfo_GuardCity_OnNpcDead9201($1,$2)")
--RegisterNpcDeadEvent(9209,"CopySceneInfo_GuardCity_OnNpcDead9201($1,$2)")
--RegisterNpcDeadEvent(9210,"CopySceneInfo_GuardCity_OnNpcDead9201($1,$2)")
