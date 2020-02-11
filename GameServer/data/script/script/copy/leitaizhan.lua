--擂台战
--1_1_ 剩最一个玩家的id
CopySceneInfo_135 =
{
	--初始化副本的操作
}

--玩家死亡
function CopySceneInfo_135:OnPlayerDie(cid,uid,murder,dtype)
    s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
    --给杀人者加分
    if murder == 0 or murder == nil then
        return;
    end
    local baseExp = 5000
    local baseIncExp = 2500
    local baseMedal = 25
    local exp = baseExp * 2;
    s_refreshExp(murder[1],exp,ExpType_GuardCopy,0)
    local incExp = baseIncExp * 2;
    s_refreshIncExp(murder[1],incExp,ExpType_GuardCopy,0)
    local medal = baseMedal * 2;
    s_setVar(murder[1],140,4,s_getVar(murder[1],140,4) + medal) --勋章
	s_sendNewSpecialItemTips(murder[1],ItemID_Special_AchievementPoint,medal)
    s_sysInfo(murder[1],"杀人获得:"..medal.."勋章碎片",ChatPos_Tips)

end

--副本创建初始化
function CopySceneInfo_135:InitCopyScene(sid)
	s_setSceneVar(cid,1,1,0)
end


----1秒钟循环
--function OnLoopCopyScene_1Sec_135(ctype,cid)
    --local step = s_getEvent(Relation_World,0,EventArena)
    --local step1 = s_getEvent(Relation_World,0,EventArena1)
    --local step2 = s_getEvent(Relation_World,0,EventArena2)
    --if step == EventStep_Wait and step1 == EventStep_Wait and step2 == EventStep_Wait and s_getSceneVar(cid,1,1) == 0 then
        --s_clearCopy(cid)
        --s_setSceneVar(cid,1,1,1)
    --end
--end
--3秒钟循环
function OnLoopCopyScene_3Sec_135(ctype,cid)
    local overtime = s_getEventTime(Relation_World,0,EventArena, EVENT_TIME_REM)
    if overtime <= 0 then
        overtime = s_getEventTime(Relation_World,0,EventArena1, EVENT_TIME_REM)
        if overtime <= 0 then
            overtime = s_getEventTime(Relation_World,0,EventArena2, EVENT_TIME_REM)
        end
    end
    if overtime <= 0 then
        s_clearCopy(cid);
    end
    --定点为玩家刷新积分
    local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
    for i =1,table.getn(list),2 do
        --未死亡
        if s_isDead(list[i+1])  == VALUE_FAIL then
            --二倍奖励
            local baseExp = 5000
            local baseIncExp = 2500
            local baseMedal = 25
            if s_isInZoneByPos(list[i],list[i+1],ZONE_THREE_REWARD) == VALUE_OK then
                local exp = baseExp * 2;
                s_refreshExp(list[i+1],exp,ExpType_GuardCopy,0)
                local incExp = baseIncExp * 2;
                s_refreshIncExp(list[i+1],incExp,ExpType_GuardCopy,0)
                local medal = baseMedal * 2;
                s_setVar(list[i+1],140,4,s_getVar(list[i+1],140,4) + medal) --勋章
				s_sendNewSpecialItemTips(list[i+1],ItemID_Special_AchievementPoint,medal)
            --1倍奖励
            elseif s_isInZoneByPos(list[i],list[i+1],ZONE_POINT_FIVE) == VALUE_OK then
                local exp = math.floor(baseExp * 0.5);
                s_refreshExp(list[i+1],exp,ExpType_GuardCopy,0)
                local incExp = math.floor(baseIncExp * 0.5);
                s_refreshIncExp(list[i+1],incExp,ExpType_GuardCopy,0)
                local medal = math.floor(baseMedal * 0.5);
                s_setVar(list[i+1],140,4,s_getVar(list[i+1],140,4) + medal) --勋章
				s_sendNewSpecialItemTips(list[i+1],ItemID_Special_AchievementPoint,medal)
            --0.5倍奖励
            else
                local exp = baseExp * 1;
                s_refreshExp(list[i+1],exp,ExpType_GuardCopy,0)
                local incExp = math.floor(baseIncExp * 1);
                s_refreshIncExp(list[i+1],incExp,ExpType_GuardCopy,0)
                local medal = math.floor(baseMedal * 1);
                s_setVar(list[i+1],140,4,s_getVar(list[i+1],140,4) + medal) --勋章
				s_sendNewSpecialItemTips(list[i+1],ItemID_Special_AchievementPoint,medal)
            end
        end
    end
end

function CopySceneInfo_135:OnPlayerRelive(uid, rtype)
	if rtype == 3 or rtype == 4 then
		s_goto(SCENE_ENTRY_PLAYER,uid,15,26)
	end
end

--玩家进入副本提示
function CopySceneInfo_135:OnPlayerIntoCopyScene(cid,uid)
    local overtime = s_getEventTime(Relation_World,0,EventArena, EVENT_TIME_REM)
    if overtime == 0 then
        overtime = s_getEventTime(Relation_World,0,EventArena1, EVENT_TIME_REM)
    end
    if overtime == 0 then
        overtime = s_getEventTime(Relation_World,0,EventArena2, EVENT_TIME_REM)
    end
    s_sendCopyTime(cid,overtime);

    --每日目标次数
    s_addDailyTargetTime(uid, enumDailySubTargetType_ArenaFight, 1)
	if s_getVar(uid, 147, 9) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,9,1)
	end
end
