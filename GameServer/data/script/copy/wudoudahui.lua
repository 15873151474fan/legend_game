--武斗大会
--1_1_ 剩最一个玩家的id
--1_2 是否已经结束了，结束了退出不掉装备
CopySceneInfo_137 =
{
	--初始化副本的操作
	initcopy =
	{
	},
}


--掉落物品
function CopySceneInfo_137:DropItem(uid,cid,isdrop)
    --结束后不再掉落
    if s_getSceneVar(cid,1,2) == 0 and isdrop == 1 then
        --必掉落一个血珠
        local posx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
        local posy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
        s_addSceneItem(10007,1,cid,posx,posy,0,"1-1")
        --查找背包剩于血珠数量
        local itemlist = s_getItemListByBaseID(uid, 10007, PACKAGETYPE_MAIN)
        if itemlist == nil or table.getn(itemlist) == 0 then
            return 0
        end
        local itemnum = 0;
        for k,v in pairs(itemlist) do
            itemnum = itemnum + s_getItemValue(uid,v,-8)
        end
        --掉落总数的一半
        itemnum = math.floor(itemnum / 2)
        if s_deleteItemByBaseID(uid,10007,itemnum,"死亡或退出血战到底掉落删除") ~= VALUE_OK then
            s_debugUser(uid,"物品扣除失败，不给予掉落") 
            return 0;
        end
        --开始掉落到场景
        for i=1,itemnum,1 do
            s_addSceneItem(10007,1,cid,posx,posy,0,"1-1")
        end
    end
    --将10007转换成10008道具，因为10007道具不可使用
    local itemlist = s_getItemListByBaseID(uid, 10007, PACKAGETYPE_MAIN)
    if itemlist == nil or table.getn(itemlist) == 0 then
        return 0
    end

    local itemnum = 0;
    for k,v in pairs(itemlist) do
        itemnum = itemnum  + s_getItemValue(uid,v,-8)
    end
    if s_deleteItemByBaseID(uid,10007,itemnum,"血战到底结束删除") ~= VALUE_OK then
        s_debugUser(uid,"物品扣除失败，不给予兑换:"..itemnum) 
        return 0;
    end
    s_addItem(uid,10008,0,itemnum,0,"1-1","血战到底结束获得",0,1001)
end
--副本创建初始化
function CopySceneInfo_137:InitCopyScene(sid)
	s_setSceneVar(cid,1,1,0)
end
--玩家死亡
function CopySceneInfo_137:OnPlayerDie(cid,uid,murder,dtype)
    local outtime = s_getCurTime(TIME_ALLSECONDS)
    s_setVar(uid,163,7,outtime);
    CopySceneInfo_137:DropItem(uid,cid,1)

end

--玩家离开副本
function CopySceneInfo_137:OnPlayerLeaveCopyScene(cid,uid)
    s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)
    CopySceneInfo_137:DropItem(uid,cid,0)
end

--销毁副本
function CopySceneInfo_137:FinalCopyScene(cid)
    --local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
    --if table.getn(list) > 2 then
        --s_worldInfo("武斗大会已结束，很遗憾，没有勇士能够击败群雄。",ChatPos_Sys + ChatPos_Honor)
    --elseif table.getn(list) == 2 then
        --local name = s_getValue(list[1],list[2],VALUE_TYPE_NAME)
        --s_worldInfo("祝贺"..name.."战胜群雄，赢得武斗大会！",ChatPos_Sys + ChatPos_Honor)
        --s_addItem(uid,19099,0,1,0,"1-1","赢取武斗大会")

    --end
end

--3秒钟循环
function OnLoopCopyScene_3Sec_137(ctype,cid)
    local overtime = s_getEventTime(Relation_World,0,EventFight, EVENT_TIME_REM)
    if overtime < 1200 and overtime > 0  then
        local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
        local rolelist = {}
        for i = 1,table.getn(list),2 do
            if s_isDead(list[i+1]) == VALUE_FAIL then
                table.insert(rolelist,list[i])
                table.insert(rolelist,list[i+1])
            end
        end
        --如果在场人数等于1人，直接结束活动
        if table.getn(rolelist) == 2 then
            local name = s_getValue(rolelist[1],rolelist[2],VALUE_TYPE_NAME)
            s_worldInfo("祝贺".."[#8]"..name.."[-]".."玩家在血战到底傲视天下英雄，战到最后，实乃当之无愧的沙场之王!",ChatPos_Sys + ChatPos_Important)
            --s_addItem(rolelist[2],19099,3,1,0,"1-1","你的背包已满，这是血战到底活动的终极奖励,请接收!")
            s_setCountryField(13, CountryVar_WuDaoHui_First, rolelist[2])
            s_clearCopy(cid)

            s_setSceneVar(cid,1,2,1)
            s_sendWudouhuiJoinReward();
        end
    end

    overtime = s_getEventTime(Relation_World,0,EventFight2, EVENT_TIME_REM)
    if overtime < 1200 and overtime > 0  then
        local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
        local rolelist = {}
        for i = 1,table.getn(list),2 do
            if s_isDead(list[i+1]) == VALUE_FAIL then
                table.insert(rolelist,list[i])
                table.insert(rolelist,list[i+1])
            end
        end
        --如果在场人数等于1人，直接结束活动
        if table.getn(rolelist) == 2 then
            local name = s_getValue(rolelist[1],rolelist[2],VALUE_TYPE_NAME)
            s_worldInfo("祝贺".."[#8]"..name.."[-]".."玩家在血战到底傲视天下英雄，战到最后，实乃当之无愧的沙场之王!",ChatPos_Sys + ChatPos_Important)
            --s_addItem(rolelist[2],19099,3,1,0,"1-1","你的背包已满，这是血战到底活动的终极奖励,请接收!")
            s_setCountryField(13, CountryVar_WuDaoHui_First, rolelist[2])

            s_setSceneVar(cid,1,2,1)
            s_clearCopy(cid)
            s_sendWudouhuiJoinReward();
        end
    end
end

--1秒钟循环
function OnLoopCopyScene_1Sec_137(ctype,cid)
    local step = s_getEvent(Relation_World,0,EventFight)
    local step2 = s_getEvent(Relation_World,0,EventFight2)
    if step == EventStep_Wait  and step2 == EventStep_Wait and s_getSceneVar(cid,1,1) == 0 then
        local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
        local rolelist = {}
        for i = 1,table.getn(list),2 do
            if s_isDead(list[i+1]) == VALUE_FAIL then
                table.insert(rolelist,list[i])
                table.insert(rolelist,list[i+1])
            end
        end
        if table.getn(rolelist) > 2 then
            s_worldInfo("血战到底已结束，很遗憾，没有勇士能够击败群雄。",ChatPos_Sys + ChatPos_Important)
            s_sendWudouhuiJoinReward();
        elseif table.getn(rolelist) == 2 then
            local name = s_getValue(rolelist[1],rolelist[2],VALUE_TYPE_NAME)
            s_worldInfo("祝贺".."[#8]"..name.."[-]".."玩家在血战到底傲视天下英雄，战到最后，实乃当之无愧的沙场之王!",ChatPos_Sys + ChatPos_Important)
            --s_addItem(rolelist[2],19099,3,1,0,"1-1","你的背包已满，这是血战到底活动的终极奖励,请接收!")
            s_setCountryField(13, CountryVar_WuDaoHui_First, rolelist[2])
            s_sendWudouhuiJoinReward();
        end
        s_clearCopy(cid)
        s_setSceneVar(cid,1,1,1)
        s_setSceneVar(cid,1,2,1)
    end

end

--玩家进入副本提示
function CopySceneInfo_137:OnPlayerIntoCopyScene(cid,uid)
    local overtime = s_getEventTime(Relation_World,0,EventFight, EVENT_TIME_REM)
    if overtime == 0 then
        overtime = s_getEventTime(Relation_World,0,EventFight2, EVENT_TIME_REM)
    end
    s_sendCopyTime(cid,overtime);
    local intotime = s_getCurTime(TIME_ALLSECONDS)

    --每日目标次数
    s_addDailyTargetTime(uid, enumDailySubTargetType_ForceFight, 1)
	if s_getVar(uid, 147, 8) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,8,1)
	end
    s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,2)
end

