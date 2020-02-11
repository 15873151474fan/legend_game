--晶源矿脉任务
function EventKuangMai(uid,Eventid,value1,value2,value3) 
    local step1 = s_getEvent(Relation_World,0,EventMine)
    if step1 ~= EventStep_Run  then
        s_sysInfo(uid,"当前还不是晶源矿脉活动期间",ChatPos_Tips)
        return;
    end
    --生成npc
    local sceneid = HashSceneID(3,2)
   -- local npcid = s_sysSummon(186,sceneid,54,73,100,1)

    s_addState(SCENE_ENTRY_NPC,npcid,SceneEntry_God)
    --s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,10*60*1000)
    AddRoleTaskForGM(uid,34001)
end 

--请求进入晶源矿脉
function RequestIntoKuangMaiCopy(uid,dwid)
    if s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_LEVEL) < 60 then
        s_sysInfo(uid,"小于60级不能接取",ChatPos_Tips)
        return 
    end

    if s_getVar(uid,167,20) >= 1 then
        s_sysInfo(uid,"当日进入次数已满",ChatPos_Tips)
        return 
    end

    --完成任务
    s_intoCopyCustomSingle(uid,1209,223,37,10)
    s_addDailyTargetTime(uid, enumDailySubTargetType_Mine)
    s_refreshDayTaskNum(uid,30006, s_getVar(uid,167,20))
end
