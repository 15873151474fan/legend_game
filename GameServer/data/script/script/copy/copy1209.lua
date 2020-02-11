--晶源矿脉
-- 相关数据
--[[ 
1_1 副本时间
1_2 副本矿洞坍塌概率
1_3 副本矿洞是否坍塌
1_4 副本矿洞攻击坍塌次数

uid 167 24 玩家挖矿阶段
uid 167 25 玩家挖矿积分
]]--
CopySceneInfo_1209 = {}


function CopySceneInfo_1209:InitCopyScene(uid,cid)
    CreateJYKMNpc(uid,cid)
end

function CopySceneInfo_1209:OnPlayerIntoCopyScene(cid,uid)
    --设置倒计时 玩家属性
    local mconfig = MineralDataBase.query(1)
    s_sendCopyTime(cid,s_getSceneVar(cid,1,1))
    s_sendMinerData(uid,3,mconfig.id,0,0,0)

    --挖矿阶段
    s_setVar(uid,167,22,0)
    s_setVar(uid,167,24,1)
    s_setVar(uid,167,25,0)
    s_setVar(uid,167,26,100)

    s_setVar(uid,167,27,0)
    s_setVar(uid,167,28,mconfig.fixedpro + math.random(mconfig.randomproMin,mconfig.randomproMax))

    --完成任务
    FinishRoleTask(uid,33001)
end

function CreateJYKMNpc(uid,cid)
    --获取配表数据
    local mconfig = MineralDataBase.query(1)
    --设置倒计时间
    s_setSceneVar(cid,1,1,10*60)
    --发送副本时间
    s_sendCopyTime(cid,s_getSceneVar(cid,1,1))
    --创建副本BOSS
    local npcid = s_sysSummon(41001,cid,37,7,100,1)
    s_addState(SCENE_ENTRY_NPC,npcid,SceneEntry_God)

    s_trace("晶源矿脉初始成功")
    return true
end


--挖矿到达20次 
function OnLoopCopyScene_3Sec_1209(ctype,cid)
    --计算副本时间 
    s_setSceneVar(cid,1,1,s_getSceneVar(cid,1,1) - 3)
    if s_getSceneVar(cid,1,1) <= 0 then
        s_clearCopy(cid)
    end
end



--矿脉坍塌判断阶段处理
function JingYuanKuangMai_collapse(uid,state)
    --命中率
    local rand = math.random(0,100000)
    --矿脉奖励
    local minereward = nil
    --概率
    local probability = s_getVar(uid,167,28)
    --矿脉积分
    local point = nil
    --坍塌标志
    local flag = 0 
   
    --矿脉当前阶段
    local mconfig = MineralDataBase.query(s_getVar(uid,167,24))

    if mconfig ~= nil then
        s_trace("mconfig>>>>>>>>>>>>>>>>>>>>>>"..mconfig.id)
    end

    --挖矿下一阶段
    s_setVar(uid,167,24, s_getVar(uid,167,24) + 1)

    --当前挖矿积分
    local nextmconfig = MineralDataBase.query(s_getVar(uid,167,24))
    s_trace("nextmconfig.speed"..nextmconfig.speed)
    s_setVar(uid,167,26,nextmconfig.speed)
    s_setVar(uid,167,25,s_getVar(uid,167,25) + 20 * mconfig.speed)
    point = s_getVar(uid,167,25)

    s_trace("坍塌命中rand:"..rand.." mconfig.id:"..mconfig.id.." 积分:"..s_getVar(uid,167,25))


    --坍塌命中
    if rand <= probability then
        point = point * 0.2
        flag = 1
        s_trace("坍塌命中rand:"..rand.." mconfig.id:"..mconfig.id.." 积分:"..s_getVar(uid,167,25))
    end

    --获取挖矿奖励
    if flag == 1 then
        for k,v in pairs (MineralRewardDataBase) do
            if type(v) ~= "function" then
                if point > 100000000 then
                    minereward =  MineralRewardDataBase.query(21)
                end
            
                if v.Minscore < point and v.Maxscore > point then
                    minereward = v;
                    s_trace("积分命中v.id:"..v.id.." Minsccore: "..v.Minscore.." 积分:"..s_getVar(uid,167,25))
                    s_sendMinerData(uid,4,s_getVar(uid,167,24),point,0,minereward.id)
                    s_setVar(uid,167,28,0)
                    break
                end
            end
        end
        return 
    end

    s_setVar(uid,167,28,s_getVar(uid,167,28) + mconfig.fixedpro + math.random(mconfig.randomproMin,mconfig.randomproMax))
    s_sendMinerData(uid,3,s_getVar(uid,167,24),point,0,s_getVar(uid,167,28))
    return true
end


function JingYuanKuangMai_Leave(uid)
    --挖矿奖励
    local minereward = nil
    --挖矿积分
    local point = nil
    --挖矿当前阶段
    local mconfig = MineralDataBase.query(s_getVar(uid,167,24))

    if mconfig ~= nil then
        s_trace("mconfig>>>>>>>>>>>>>>>>>>>>>>"..mconfig.id)
    end

    s_trace("坍塌命中:".." mconfig.id:"..mconfig.id.." 积分:"..s_getVar(uid,167,25))

    --挖矿下一阶段
    s_setVar(uid,167,24, s_getVar(uid,167,24) + 1)

    --当前挖矿积分
    s_setVar(uid,167,26,mconfig.speed)
    s_setVar(uid,167,25, s_getVar(uid,167,27) * s_getVar(uid,167,26))
    point = s_getVar(uid,167,25) 

    --挖矿奖励
    for k,v in pairs (MineralRewardDataBase) do
        if type(v) ~= "function" then
            if point > 100000000 then
                minereward =  MineralRewardDataBase.query(21)
            end
        
            if v.Minscore < point and v.Maxscore > point then
                minereward = v;
                s_trace("积分命中v.id:"..v.id.." Minsccore: "..v.Minscore.." 积分:"..s_getVar(uid,167,25))
                break
            end
        end
    end

    if minereward ~= nil then
        GetRewardWithMail(uid,minereward.award,"晶矿脉任务奖励",1,false,AddItemAction_Task)
        s_sendMinerData(uid,5,s_getVar(uid,167,24),point,0,minereward.id)
    end
    s_sendMinerData(uid,5,s_getVar(uid,167,24),point,0,0)

end


--销毁副本
function CopySceneInfo_1209:FinalCopyScene(sid)

    s_clearNpc(48002)

    --清空副本倒计时
    s_setSceneVar(sid,1,1,0)
end

function CopySceneInfo_1209:OnPlayerDie(sid,uid,murder,dtype)
end

--注册矿脉死亡回调函数
RegisterNpcDeadEvent(48002,"JingYuanKuangMai_BossDead($1,$2)")
