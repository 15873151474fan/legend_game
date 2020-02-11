--群雄夺宝
--1_1_ 活动结束，清除玩家标志
CopySceneInfo_136 =
{
	--初始化副本的操作
	initcopy =
	{
        action =
        {
            {s_copySummonNpc,{7500,1,32,21,103,1}},
        },
	},
    dropItemId = 1002,
    titleId = 39,
}


--副本创建初始化
function CopySceneInfo_136:InitCopyScene(sid)
	s_setSceneVar(cid,1,1,0)
end
--玩家死亡
function CopySceneInfo_136:OnPlayerDie(cid,uid,murder,dtype)
    if s_checkItem(uid,self.dropItemId,1) == VALUE_OK then
        s_delTitle(SCENE_ENTRY_PLAYER,uid,self.titleId);
        local list = s_dropItem(uid, self.dropItemId, 0, 0, 0, "群雄夺宝掉落宝箱")
        if list ~= nil then
            s_refreshSceneItem(list[1]);
        end
        s_removebuff(SCENE_ENTRY_PLAYER, uid, 10001)
        s_debug("群雄夺宝死亡箱子掉落uid=%u,baseid=%u",uid,self.dropItemId)
        return;
    end

    if s_isTitle(SCENE_ENTRY_PLAYER,uid,self.titleId)  == VALUE_OK then
        s_delTitle(SCENE_ENTRY_PLAYER,uid,self.titleId);
        local list = s_dropItem(uid, self.dropItemId, 0, 0, 0, "群雄夺宝掉落宝箱")
        if list ~= nil then
            s_refreshSceneItem(list[1]);
        end
        s_removebuff(SCENE_ENTRY_PLAYER, uid, 10001)
        s_debug("群雄夺宝死亡箱子掉落uid=%u,baseid=%u",uid,self.dropItemId)
        return;
    end

    --ReturnUserHome(uid,"CopySceneInfo_136:OnPlayerDie")
end

--销毁副本
function CopySceneInfo_136:FinalCopyScene(cid)

end

--1秒钟循环
function OnLoopCopyScene_1Sec_136(ctype,cid)
    local step = s_getEvent(Relation_World,0,EventHeroIndiana1)
    local step1 = s_getEvent(Relation_World,0,EventHeroIndiana2)
    if step == EventStep_Wait  and step1 == EventStep_Wait and s_getSceneVar(cid,1,1) == 0  then
        local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
        for i = 1,table.getn(list), 2 do
            if s_checkItem(list[i+1],1002,1) == VALUE_OK then
                s_deleteItemByBaseID(list[i+1],1002,1,"群雄夺宝活动结束删除")
                s_addItem(list[i+1],10190,0,1,0,"1-1","群雄夺宝活动结束回收箱子获得",0,1001)
                local name = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_NAME)
                s_worldInfo("[#9]群雄逐鹿[-]活动:[#3]"..name.."[-]击败群雄，获得[#10190],宝箱内装着满满100元宝！",ChatPos_Important+ChatPos_Sys)
                s_removebuff(SCENE_ENTRY_PLAYER, uid, 10001)

            end
        end

        s_clearCopy(cid)
        s_setSceneVar(cid,1,1,1)

    end
end

--玩家进入副本提示
function CopySceneInfo_136:OnPlayerIntoCopyScene(cid,uid)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,2)

    local overtime = s_getEventTime(Relation_World,0,EventHeroIndiana1, EVENT_TIME_REM)
    if overtime == 0 then
        overtime = s_getEventTime(Relation_World,0,EventHeroIndiana2, EVENT_TIME_REM)
    end
    s_sendCopyTime(cid,overtime);

    --每日目标次数
    s_addDailyTargetTime(uid, enumDailySubTargetType_RobTreasure, 1)
	if s_getVar(uid, 147, 6) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,6,1)
	end
end

--玩家离开副本
function CopySceneInfo_136:OnPlayerLeaveCopyScene(sid,uid)
    s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)
    if s_checkItem(uid,self.dropItemId,1) == VALUE_OK then
        s_delTitle(SCENE_ENTRY_PLAYER,uid,self.titleId);
        local list = s_dropItem(uid, self.dropItemId, 0, 0, 0, "群雄夺宝掉落宝箱")
        if list ~= nil then
            s_refreshSceneItem(list[1]);
        end

        s_removebuff(SCENE_ENTRY_PLAYER, uid, 10001)
        s_debug("群雄夺宝离开箱子掉落uid=%u,baseid=%u",uid,self.dropItemId)
        return;
    end

    if s_isTitle(SCENE_ENTRY_PLAYER,uid,self.titleId)  == VALUE_OK then
        s_delTitle(SCENE_ENTRY_PLAYER,uid,self.titleId);
        local list = s_dropItem(uid, self.dropItemId, 0, 0, 0, "群雄夺宝掉落宝箱")
        if list ~= nil then
            s_refreshSceneItem(list[1]);
        end
        s_removebuff(SCENE_ENTRY_PLAYER, uid, 10001)
        s_debug("群雄夺宝离开箱子掉落uid=%u,baseid=%u",uid,self.dropItemId)
        return;
    end
    s_debug("OnPlayerLeaveCopyScene")

end

--怪物死后掉出宝箱
function CopySceneInfo_136:dead_7500(userid,npcid)
	s_debug("群雄夺宝，怪物死后掉出宝箱")
    local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
    local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
    local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
    s_addSceneItem(1002,1,cid,posx,posy,0,"1-1")
end

RegisterMyNpcDeadEvent(7500,"CopySceneInfo_136:dead_7500($1,$2)")
