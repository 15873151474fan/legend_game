--boss殿堂
--1_1_ 清除标记
CopySceneInfo_138 =
{
	--初始化副本的操作
	initcopy =
	{
	},
}


--副本创建初始化
function CopySceneInfo_138:InitCopyScene(sid)
	s_setSceneVar(cid,1,1,0)
end


--1秒钟循环
function OnLoopCopyScene_1Sec_138(ctype,cid)
    local step = s_getEvent(Relation_World,0,EventChallengeBoss)
    --local step1 = s_getEvent(Relation_World,0,EventChallengeBoss1)
	if step == EventStep_Wait and  s_getSceneVar(cid,1,1) == 0 then
        s_clearCopy(cid)
        s_setSceneVar(cid,1,1,1)
    end
end

--玩家进入副本提示
function CopySceneInfo_138:OnPlayerIntoCopyScene(sid,uid)
	local overtime = s_getEventTime(Relation_World,0,EventChallengeBoss, EVENT_TIME_REM)
    --[[if overtime == 0 then
        overtime = s_getEventTime(Relation_World,0,EventChallengeBoss1, EVENT_TIME_REM)
    end]]--
    s_sendCopyTime(cid,overtime);
end

CopySceneInfo_139 =
{
	--初始化副本的操作
	initcopy =
	{
	},
}


--副本创建初始化
function CopySceneInfo_139:InitCopyScene(sid)
	s_setSceneVar(cid,1,1,0)
end


--1秒钟循环
function OnLoopCopyScene_1Sec_139(ctype,cid)
    local step = s_getEvent(Relation_World,0,EventChallengeBoss)
    --local step1 = s_getEvent(Relation_World,0,EventChallengeBoss1)
    if step == EventStep_Wait and  s_getSceneVar(cid,1,1) == 0 then
        s_clearCopy(cid)
        s_setSceneVar(cid,1,1,1)
    end
end

--玩家进入副本提示
function CopySceneInfo_139:OnPlayerIntoCopyScene(sid,uid)
    local overtime = s_getEventTime(Relation_World,0,EventChallengeBoss, EVENT_TIME_REM)
    --[[if overtime <= 0 then
        overtime = s_getEventTime(Relation_World,0,EventChallengeBoss1, EVENT_TIME_REM)
    end]]--
    s_sendCopyTime(cid,overtime);
end


CopySceneInfo_140 =
{
	--初始化副本的操作
	initcopy =
	{
	},
}


--副本创建初始化
function CopySceneInfo_140:InitCopyScene(sid)
	s_setSceneVar(cid,1,1,0)
end


--1秒钟循环
function OnLoopCopyScene_1Sec_140(ctype,cid)
    local step = s_getEvent(Relation_World,0,EventChallengeBoss)
    --local step1 = s_getEvent(Relation_World,0,EventChallengeBoss1)
    if step == EventStep_Wait and  s_getSceneVar(cid,1,1) == 0 then
        s_clearCopy(cid)
        s_setSceneVar(cid,1,1,1)
    end
end

--玩家进入副本提示
function CopySceneInfo_140:OnPlayerIntoCopyScene(sid,uid)
    local overtime = s_getEventTime(Relation_World,0,EventChallengeBoss, EVENT_TIME_REM)
    --[[if overtime <= 0 then
        overtime = s_getEventTime(Relation_World,0,EventChallengeBoss1, EVENT_TIME_REM)
    end]]--
    s_sendCopyTime(cid,overtime);
end
