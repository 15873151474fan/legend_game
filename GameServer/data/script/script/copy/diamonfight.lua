--宝石战场
--1_1_ 活动结束，清除玩家标志
CopySceneInfo_132 =
{
	--初始化副本的操作
	initcopy =
	{
		action =
		{
            {s_copySummonNpc,{7400,1,19,15,103,1}},
		},
	},
}
--销毁副本
function CopySceneInfo_132:FinalCopyScene(cid)
end

function CopySceneInfo_132:InitCopyScene(cid)
	s_setSceneVar(cid,1,1,0)
end

--1秒钟循环
function OnLoopCopyScene_1Sec_132(ctype,cid)
    local step = s_getEvent(Relation_World,0,EventJewelBattle)
--    local step2 = s_getEvent(Relation_World,0,EventJewelBattle2)
--    if step == EventStep_Wait  and step2 == EventStep_Wait then
    if step == EventStep_Wait then
            s_clearCopy(cid)
    end
end

--玩家复活
function CopySceneInfo_132:OnPlayerRelive(uid, rtype)
	if rtype == 3 or rtype == 4 then
		s_goto(SCENE_ENTRY_PLAYER,uid,8,36)
	end
end

--玩家死亡
function CopySceneInfo_132:OnPlayerDie(cid,uid,murder,dtype)
    s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
    --给杀人者加分
    if murder == 0 or murder == nil then
        return;
    end
    --如果杀人者是怪物
    local retvalue = s_getValue(SCENE_ENTRY_PLAYER,murder[1],VALUE_TYPE_SCENE_TYPE)
    if retvalue == nil or retvalue == 0 then
        return;
    end

    local point = 50;
    if s_getVar(murder[1],163,2)  > 3000 then
        s_sysInfo(murder[1],"今日获得积分已达上限，不能再继续获得",ChatPos_Tips)
        return;
    end
    s_setVar(murder[1],163,1,point + s_getVar(murder[1],163,1))
    s_setVar(murder[1],163,2,point + s_getVar(murder[1],163,2))
    s_sysInfo(murder[1],"获得:"..point.."点积分,当前积分:"..s_getVar(murder[1],163,1),ChatPos_Tips)
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
    local vlist = {}
    table.insert(vlist,1);
    table.insert(vlist,s_getVar(murder[1],163,1));
	s_sendCopyVar(ctype, cid,murder[1],1,vlist)

end

--玩家离开副本
function CopySceneInfo_132:OnPlayerLeaveCopyScene(cid,uid)
    s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)
end

--玩家进入副本提示
function CopySceneInfo_132:OnPlayerIntoCopyScene(cid,uid)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,2)
    local overtime = s_getEventTime(Relation_World,0,EventJewelBattle, EVENT_TIME_REM)
    if overtime == 0 then
        overtime = s_getEventTime(Relation_World,0,EventJewelBattle2, EVENT_TIME_REM)
    end
    s_sendCopyTime(cid,overtime);

    --每日目标次数
    s_addDailyTargetTime(uid, enumDailySubTargetType_JewelFight, 1)
	if s_getVar(uid, 147, 10) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,10,1)
	end
    --查找是否有怪物
    local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
    local lifetime = 0;
    for i = 1,table.getn(list), 2 do
        local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
        if baseid == 336 then
            lifetime = s_getNpcLifeTime(list[i+1]);
            break;
        end
    end
    s_sendCopyCustomTime(cid,lifetime,9999);
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
    local vlist = {}
    table.insert(vlist,1);
    table.insert(vlist,s_getVar(uid,163,1));
	s_sendCopyVar(ctype, cid,uid,1,vlist)

end

--boss死后出现女神npc
function CopySceneInfo_132:dead_7400(userid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
    if s_isNpcDead(cid,303) == VALUE_FAIL then
        s_debug("宝石战场 dead_7400 回调时发现已存在303，不予创建")
        return;
    end
    local npcid = s_sysSummon(336,cid,19,15,1070,1)
	
	s_debug("baoshizhanchang")
    s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,300*1000)
    local lifetime = 0;
    local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
    for i = 1,table.getn(list), 2 do
        local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
        if baseid == 336 then
            lifetime = s_getNpcLifeTime(list[i+1]);
            break;
        end
    end
    s_sendCopyCustomTime(cid,lifetime,9999);

end


--女神倒计时死亡后刷出boss
function CopySceneInfo_132:dead_336(userid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
    if s_isNpcDead(cid,7400) == VALUE_FAIL then
        s_debug("宝石战场 dead_303 回调时发现已存在7400，不予创建")
        return;
    end
    s_sysSummon(7400,cid,19,15,103,1)
    local lifetime = 0;
    s_sendCopyCustomTime(cid,lifetime,9999);
end

RegisterMyNpcDeadEvent(7400,"CopySceneInfo_132:dead_7400($1,$2)")
RegisterMyNpcDeadEvent(336,"CopySceneInfo_132:dead_336($1,$2)")


--通得积分通知客户端
function CopyScene132PointNotice(uid)
    local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
    local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
    local vlist = {}
    table.insert(vlist,1);
    table.insert(vlist,s_getVar(uid,163,1));
    s_sendCopyVar(ctype, cid,uid,1,vlist)
end

